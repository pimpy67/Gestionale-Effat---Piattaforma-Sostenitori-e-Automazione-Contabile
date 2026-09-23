# 🗄️ Database Schema - Gestionale Effatà

Database: **PostgreSQL 15+**

---

## SQL Schema

```sql
-- USERS & AUTH
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  role VARCHAR(50) NOT NULL CHECK (role IN ('ADMIN', 'FIELD_OPERATOR', 'SUPPORTER')),
  telegram_id BIGINT UNIQUE,
  is_active BOOLEAN DEFAULT true,
  last_login TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ADOZIONI
CREATE TABLE adoptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code_name VARCHAR(100) UNIQUE NOT NULL,      -- UG-101, UG-102, etc
  child_name VARCHAR(255) NOT NULL,
  birth_date DATE,
  location VARCHAR(255),
  bio TEXT,
  status VARCHAR(50) DEFAULT 'ACTIVE' CHECK (status IN ('ACTIVE', 'PAUSED', 'COMPLETED')),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- SOSTENITORI (Users che supportano una adoption)
CREATE TABLE supporters (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID UNIQUE REFERENCES users(id) ON DELETE CASCADE,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  tax_code VARCHAR(16) UNIQUE,                 -- CF italiano
  iban VARCHAR(34),
  phone VARCHAR(20),
  address TEXT,
  notes TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ASSOCIAZIONE ADOPTION ↔ SUPPORTER (N:M)
CREATE TABLE adoption_supporters (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  adoption_id UUID NOT NULL REFERENCES adoptions(id) ON DELETE CASCADE,
  supporter_id UUID NOT NULL REFERENCES supporters(id) ON DELETE CASCADE,
  monthly_amount DECIMAL(10,2),
  start_date DATE NOT NULL,
  end_date DATE,
  status VARCHAR(50) DEFAULT 'ACTIVE' CHECK (status IN ('ACTIVE', 'PAUSED', 'TERMINATED')),
  created_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(adoption_id, supporter_id)
);

-- MEDIA (Foto, video, documenti)
CREATE TABLE media (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  adoption_id UUID REFERENCES adoptions(id) ON DELETE CASCADE,
  uploaded_by UUID REFERENCES users(id) ON DELETE SET NULL,
  file_url VARCHAR(512) NOT NULL,              -- S3 URL
  file_type VARCHAR(50) CHECK (file_type IN ('PHOTO', 'VIDEO', 'DOCUMENT')),
  file_size INT,
  caption TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- DONAZIONI
CREATE TABLE donations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  supporter_id UUID REFERENCES supporters(id) ON DELETE CASCADE,
  adoption_support_id UUID REFERENCES adoption_supporters(id) ON DELETE SET NULL,
  amount DECIMAL(10,2) NOT NULL,
  donation_date DATE NOT NULL,
  payment_method VARCHAR(50),                  -- bank_transfer, card, other
  raw_causale TEXT,
  tax_code_extracted VARCHAR(16),
  status VARCHAR(50) DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'VERIFIED', 'ANOMALY', 'ARCHIVED')),
  notes TEXT,
  verified_by UUID REFERENCES users(id) ON DELETE SET NULL,
  verified_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ESTRATTI CONTO (Bank statements)
CREATE TABLE bank_statements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  iban VARCHAR(34),
  statement_date DATE,
  file_url VARCHAR(512),                       -- PDF URL
  parsed_data JSONB,                           -- OCR result from AI
  status VARCHAR(50) DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'PARSED', 'RECONCILED')),
  reconciliation_notes TEXT,
  processed_by UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- RICONCILIAZIONI (Match bank ↔ donations)
CREATE TABLE reconciliations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  bank_statement_id UUID REFERENCES bank_statements(id) ON DELETE CASCADE,
  donation_id UUID REFERENCES donations(id) ON DELETE CASCADE,
  confidence_score FLOAT CHECK (confidence_score >= 0 AND confidence_score <= 1),
  matched_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(bank_statement_id, donation_id)
);

-- AUDIT LOG (GDPR compliance)
CREATE TABLE audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE SET NULL,
  action VARCHAR(50),                          -- CREATE, UPDATE, DELETE, LOGIN, EXPORT
  resource_type VARCHAR(100),
  resource_id UUID,
  old_value JSONB,
  new_value JSONB,
  ip_address VARCHAR(45),
  timestamp TIMESTAMP DEFAULT NOW()
);

-- INDEXES per performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_telegram_id ON users(telegram_id);
CREATE INDEX idx_supporters_user ON supporters(user_id);
CREATE INDEX idx_supporters_tax_code ON supporters(tax_code);
CREATE INDEX idx_adoption_supporters_adoption ON adoption_supporters(adoption_id);
CREATE INDEX idx_adoption_supporters_supporter ON adoption_supporters(supporter_id);
CREATE INDEX idx_donations_supporter ON donations(supporter_id);
CREATE INDEX idx_donations_status ON donations(status);
CREATE INDEX idx_donations_date ON donations(donation_date);
CREATE INDEX idx_donations_verified ON donations(verified_by);
CREATE INDEX idx_media_adoption ON media(adoption_id);
CREATE INDEX idx_media_uploaded_by ON media(uploaded_by);
CREATE INDEX idx_audit_logs_user ON audit_logs(user_id);
CREATE INDEX idx_audit_logs_timestamp ON audit_logs(timestamp);
CREATE INDEX idx_audit_logs_resource ON audit_logs(resource_type, resource_id);
CREATE INDEX idx_bank_statements_status ON bank_statements(status);
CREATE INDEX idx_bank_statements_date ON bank_statements(statement_date);
CREATE INDEX idx_reconciliations_statement ON reconciliations(bank_statement_id);
CREATE INDEX idx_reconciliations_donation ON reconciliations(donation_id);
```

---

## Entity Relationship Diagram

```
users (1) ──── (N) supporters
          ├─ role: ADMIN, FIELD_OPERATOR, SUPPORTER
          ├─ telegram_id: Bot authentication
          └─ audit_logs reference

supporters (N) ──── (N) adoptions
              via adoption_supporters
              ├─ monthly_amount: Importo mensile
              ├─ start_date, end_date: Periodo supporto
              └─ status: ACTIVE, PAUSED, TERMINATED

adoptions (1) ──── (N) media
           ├─ code_name: UG-101, UG-102
           ├─ status: ACTIVE, PAUSED, COMPLETED
           └─ uploaded_by: References users

supporters (1) ──── (N) donations
           ├─ amount: Importo
           ├─ donation_date: Data versamento
           ├─ status: PENDING, VERIFIED, ANOMALY
           └─ verified_by: References users

bank_statements (1) ──── (N) reconciliations (N) ──── donations
                   ├─ parsed_data: JSONB OCR result
                   └─ status: PENDING, PARSED, RECONCILED

audit_logs: References all tables
           ├─ old_value, new_value: JSONB change tracking
           └─ timestamp: When change occurred
```

---

## Table Descriptions

### `users`
Tutti gli utenti del sistema (admin, operatori, sostenitori).

| Campo | Tipo | Note |
|-------|------|------|
| id | UUID | Primary key |
| email | VARCHAR | Unique, case-insensitive login |
| password_hash | VARCHAR | bcryptjs hash (10 rounds) |
| name | VARCHAR | Display name |
| role | VARCHAR | ADMIN\|FIELD_OPERATOR\|SUPPORTER |
| telegram_id | BIGINT | For bot authorization |
| is_active | BOOLEAN | Soft delete |
| last_login | TIMESTAMP | For activity tracking |

---

### `adoptions`
Bambini / adozioni gestite dall'organizzazione.

| Campo | Tipo | Note |
|-------|------|------|
| id | UUID | Primary key |
| code_name | VARCHAR | Unique: UG-101, UG-102, etc |
| child_name | VARCHAR | Nome del bambino |
| birth_date | DATE | Data di nascita |
| location | VARCHAR | Region in Uganda |
| bio | TEXT | Descrizione |
| status | VARCHAR | ACTIVE\|PAUSED\|COMPLETED |

---

### `supporters`
Profili sostenitori (donatori).

| Campo | Tipo | Note |
|-------|------|------|
| id | UUID | Primary key |
| user_id | UUID | Foreign key → users (1:1) |
| tax_code | VARCHAR | Codice Fiscale italiano |
| iban | VARCHAR | Per bonifici |
| phone, address | VARCHAR/TEXT | Contact info |
| first_name, last_name | VARCHAR | Nome cognome |

---

### `adoption_supporters`
**Tabella di giunzione N:M**: Relazione tra sostenitori e adozioni.

| Campo | Tipo | Note |
|-------|------|------|
| adoption_id | UUID | Foreign key → adoptions |
| supporter_id | UUID | Foreign key → supporters |
| monthly_amount | DECIMAL | Importo mensile versato |
| start_date | DATE | Inizio supporto |
| end_date | DATE | Fine supporto (NULL = ongoing) |
| status | VARCHAR | ACTIVE\|PAUSED\|TERMINATED |

Un sostenitore può supportare multiple adozioni, un'adozione ha multiple sostenitori.

---

### `donations`
Transazioni finanziarie (donazioni).

| Campo | Tipo | Note |
|-------|------|------|
| id | UUID | Primary key |
| supporter_id | UUID | Foreign key → supporters |
| adoption_support_id | UUID | FK → adoption_supporters (opzionale) |
| amount | DECIMAL | Importo versato |
| donation_date | DATE | Data versamento |
| payment_method | VARCHAR | bank_transfer\|card\|other |
| raw_causale | TEXT | Descrizione dal bonifico |
| tax_code_extracted | VARCHAR | CF estratto da OCR/causale |
| status | VARCHAR | PENDING\|VERIFIED\|ANOMALY\|ARCHIVED |
| verified_by, verified_at | UUID, TIMESTAMP | Approvazione admin |

---

### `media`
File multimediali (foto, video, documenti dei bambini).

| Campo | Tipo | Note |
|-------|------|------|
| id | UUID | Primary key |
| adoption_id | UUID | FK → adoptions |
| uploaded_by | UUID | FK → users (operatore che ha uploadato) |
| file_url | VARCHAR | S3 URL |
| file_type | VARCHAR | PHOTO\|VIDEO\|DOCUMENT |
| file_size | INT | Bytes |
| caption | TEXT | Descrizione/nota |

---

### `bank_statements`
Estratti conto bancari caricati e processati.

| Campo | Tipo | Note |
|-------|------|------|
| id | UUID | Primary key |
| iban | VARCHAR | Conto IBAN |
| statement_date | DATE | Data estratto |
| file_url | VARCHAR | S3 URL del PDF/immagine |
| parsed_data | JSONB | Risultato OCR: [{date, amount, description, iban}, ...] |
| status | VARCHAR | PENDING\|PARSED\|RECONCILED |
| processed_by | UUID | FK → users (admin che ha processato) |

---

### `reconciliations`
Matching tra transazioni bancarie e donazioni nel sistema.

| Campo | Tipo | Note |
|-------|------|------|
| bank_statement_id | UUID | FK → bank_statements |
| donation_id | UUID | FK → donations |
| confidence_score | FLOAT | 0.0-1.0: accuratezza match |
| matched_at | TIMESTAMP | Quando è avvenuto il match |

---

### `audit_logs`
**GDPR Compliance**: Log di tutti i cambiamenti ai dati sensibili.

| Campo | Tipo | Note |
|-------|------|------|
| user_id | UUID | Chi ha fatto l'azione |
| action | VARCHAR | CREATE\|UPDATE\|DELETE\|LOGIN\|EXPORT |
| resource_type | VARCHAR | adoption\|supporter\|donation\|etc |
| resource_id | UUID | ID della risorsa modificata |
| old_value, new_value | JSONB | Prima/dopo i dati |
| ip_address | VARCHAR | Per tracking |
| timestamp | TIMESTAMP | Quando è avvenuto |

---

## Migrations Strategy

Usiamo **Sequelize CLI** per gestire le migrazioni:

```bash
# Creare una nuova migration
sequelize-cli migration:generate --name create-users-table

# Eseguire tutte le migrazioni
sequelize-cli db:migrate

# Rollback ultima migration
sequelize-cli db:migrate:undo

# Seed di test data
sequelize-cli db:seed:all
```

Ogni migration è versionata nel repo e tracciata in `database/migrations/`.

---

## Query Performance

**Queries critiche** con indici:

```sql
-- Login: cercare utente per email
SELECT * FROM users WHERE email = $1;
→ INDEX: idx_users_email

-- Trovare donation by status per riconciliazione
SELECT * FROM donations WHERE status = 'PENDING' AND donation_date > $1;
→ INDEXES: idx_donations_status, idx_donations_date

-- Media gallery per un'adozione
SELECT * FROM media WHERE adoption_id = $1 ORDER BY created_at DESC;
→ INDEX: idx_media_adoption

-- Audit log search per compliance
SELECT * FROM audit_logs WHERE user_id = $1 AND timestamp > $2;
→ INDEXES: idx_audit_logs_user, idx_audit_logs_timestamp

-- Riconciliazione banking
SELECT * FROM reconciliations WHERE bank_statement_id = $1;
→ INDEX: idx_reconciliations_statement
```

Tutti gli indici sono definiti sopra.

