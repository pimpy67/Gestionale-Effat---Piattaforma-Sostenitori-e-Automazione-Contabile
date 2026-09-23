# 📋 Piano di Sviluppo - Gestionale Effatà
**Versione**: 1.0  
**Data Creazione**: 2026-09-23  
**Status**: ✅ Pronto per Implementazione

---

## Exec Summary

**Progetto**: Gestionale Effatà – Piattaforma per Adottanti e Automazione Contabile  
**Durata**: 8 settimane  
**Team Size**: 4 persone (Backend, Frontend, DevOps, QA)  
**Stack**: Node.js + Angular/Ionic + PostgreSQL + Docker  
**Rilascio**: Fine settimana 8 (MVP production-ready)

---

## 1. Visione & Obiettivi

**Problema**: Effatà Italia ODV gestisce manualmente adozioni a distanza, upload media, e riconciliazione contabile.

**Soluzione Integrata**:
1. **Telegram Bot** → Upload rapido media da operatori in Uganda
2. **Backend Node.js** → AI Vision per OCR estratti conto + validazione algoritmica
3. **PWA Angular** → Portal sostenitori + admin dashboard desktop
4. **Bridge Verifico.it** → Export automatico donazioni per bilancio

---

## 2. Architettura del Sistema

### Directory Structure (Recommended)
```
gestionale-effata/
├── backend/                      # Node.js + Express + TypeScript
│   ├── src/
│   │   ├── config/              # DB, AI, JWT config
│   │   ├── middleware/          # Auth, validation, error handling
│   │   ├── modules/
│   │   │   ├── auth/            # JWT, login, RBAC
│   │   │   ├── adoption/        # Adozioni, sostenitori
│   │   │   ├── media/           # Upload, storage, processing
│   │   │   ├── accounting/      # Transazioni, riconciliazione
│   │   │   └── telegram/        # Bot webhook, handlers
│   │   ├── services/            # AI Vision, Storage, Validation
│   │   ├── models/              # Sequelize entities
│   │   ├── routes/              # API endpoints
│   │   ├── utils/               # Helpers, validators, formatters
│   │   └── app.ts
│   ├── database/
│   │   ├── migrations/          # Schema versioning
│   │   └── seeds/
│   ├── tests/                   # Jest + Supertest
│   ├── Dockerfile
│   └── package.json
│
├── frontend/                     # Angular 17 + Ionic + PWA
│   ├── src/
│   │   ├── app/
│   │   │   ├── auth/            # Login, JWT interceptor
│   │   │   ├── admin/           # Dashboard (desktop-first)
│   │   │   ├── field-operator/  # Mobile upload
│   │   │   ├── supporter/       # Area riservata
│   │   │   └── shared/
│   │   ├── services/
│   │   ├── models/
│   │   └── assets/
│   ├── Dockerfile
│   └── package.json
│
├── database/
│   ├── migrations/
│   └── schema.sql
│
├── docker-compose.yml
├── .env.example
├── .gitignore
└── README.md
```

### Tech Stack Finalizzato
| Componente | Tecnologia | Motivazione |
|---|---|---|
| **Backend** | Node.js 20 + Express + TypeScript | Performance, ecosystem maturo |
| **Database** | PostgreSQL (primary) | ACID, JSON fields, mature |
| **ORM** | Sequelize | Query builder + migrations built-in |
| **Frontend** | Angular 17 + Ionic | PWA, mobile + desktop, typed |
| **Auth** | JWT (jsonwebtoken + bcryptjs) | Stateless, secure, scalabile |
| **AI Vision** | OpenAI GPT-4o + Claude backup | Accuracy OCR ~95% |
| **File Storage** | AWS S3 (prod) / Local (dev) | Scalable, CDN-ready |
| **Bot Telegram** | Telegraf SDK | Type-safe, simple API |
| **Testing** | Jest + Supertest + Cypress | Coverage completo |
| **Deployment** | Docker + Compose + Nginx + certbot | Containerized, SSL included |

---

## 3. Database Schema (SQL)

### Tabelle Core

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
  user_id UUID UNIQUE REFERENCES users(id),
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
  adoption_id UUID NOT NULL REFERENCES adoptions(id),
  supporter_id UUID NOT NULL REFERENCES supporters(id),
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
  adoption_id UUID REFERENCES adoptions(id),
  uploaded_by UUID REFERENCES users(id),
  file_url VARCHAR(512) NOT NULL,              -- S3 URL
  file_type VARCHAR(50) CHECK (file_type IN ('PHOTO', 'VIDEO', 'DOCUMENT')),
  file_size INT,
  caption TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- DONAZIONI
CREATE TABLE donations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  supporter_id UUID REFERENCES supporters(id),
  adoption_support_id UUID REFERENCES adoption_supporters(id),
  amount DECIMAL(10,2) NOT NULL,
  donation_date DATE NOT NULL,
  payment_method VARCHAR(50),                  -- bank_transfer, card, other
  raw_causale TEXT,
  tax_code_extracted VARCHAR(16),
  status VARCHAR(50) DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'VERIFIED', 'ANOMALY', 'ARCHIVED')),
  notes TEXT,
  verified_by UUID REFERENCES users(id),
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
  processed_by UUID REFERENCES users(id),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- RICONCILIAZIONI (Match bank ↔ donations)
CREATE TABLE reconciliations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  bank_statement_id UUID REFERENCES bank_statements(id),
  donation_id UUID REFERENCES donations(id),
  confidence_score FLOAT CHECK (confidence_score >= 0 AND confidence_score <= 1),
  matched_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(bank_statement_id, donation_id)
);

-- AUDIT LOG (GDPR compliance)
CREATE TABLE audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  action VARCHAR(50),                          -- CREATE, UPDATE, DELETE, LOGIN, EXPORT
  resource_type VARCHAR(100),
  resource_id UUID,
  old_value JSONB,
  new_value JSONB,
  ip_address VARCHAR(45),
  timestamp TIMESTAMP DEFAULT NOW()
);

-- INDEXES
CREATE INDEX idx_supporters_user ON supporters(user_id);
CREATE INDEX idx_adoption_supporters_adoption ON adoption_supporters(adoption_id);
CREATE INDEX idx_donations_supporter ON donations(supporter_id);
CREATE INDEX idx_donations_status ON donations(status);
CREATE INDEX idx_donations_date ON donations(donation_date);
CREATE INDEX idx_media_adoption ON media(adoption_id);
CREATE INDEX idx_audit_logs_user ON audit_logs(user_id);
CREATE INDEX idx_audit_logs_timestamp ON audit_logs(timestamp);
CREATE INDEX idx_bank_statements_status ON bank_statements(status);
```

---

## 4. API Endpoints (REST)

### Auth Module
```
POST   /api/v1/auth/register        # Registrazione (supporter, operator)
POST   /api/v1/auth/login           # Login → JWT token
POST   /api/v1/auth/refresh         # Refresh token
POST   /api/v1/auth/logout          # Logout + audit log
GET    /api/v1/auth/me              # Current user profile
```

### Adoptions
```
GET    /api/v1/adoptions            # List (filtrato per role)
GET    /api/v1/adoptions/:id        # Detail
POST   /api/v1/adoptions            # Create (ADMIN only)
PUT    /api/v1/adoptions/:id        # Update
GET    /api/v1/adoptions/:id/media  # Gallery media
GET    /api/v1/adoptions/:id/supporters  # Lista sostenitori
```

### Supporters
```
GET    /api/v1/supporters/:id       # Profilo sostenitore
PUT    /api/v1/supporters/:id       # Update IBAN, CF
GET    /api/v1/supporters/:id/adoptions  # Mie adozioni
GET    /api/v1/supporters/:id/donations  # Storico donazioni
```

### Media
```
POST   /api/v1/media/upload         # Upload file (multipart)
GET    /api/v1/media/:id            # Download (auth check)
DELETE /api/v1/media/:id            # Delete (owner or admin)
GET    /api/v1/media/adoption/:adoptionId  # Lista media per adoption
```

### Accounting
```
GET    /api/v1/accounting/donations # List donazioni
POST   /api/v1/accounting/donations # Create manuale
PUT    /api/v1/accounting/donations/:id/verify  # Verifica (admin)

POST   /api/v1/accounting/parse-statement  # Upload PDF/img → parse
GET    /api/v1/accounting/bank-statements/:id  # Detail estratto

POST   /api/v1/accounting/reconcile # Match transactions
GET    /api/v1/accounting/reconcile-status  # Stato riconciliazione

GET    /api/v1/accounting/export-verifico  # Download CSV
POST   /api/v1/accounting/export-verifico  # Genera + download (POST preferred)
```

### Admin Reports
```
GET    /api/v1/reports/dashboard    # KPIs (# adozioni, $ totale, pending)
GET    /api/v1/reports/transactions # CSV transazioni
GET    /api/v1/reports/adoptions-status  # Stato adozioni
GET    /api/v1/reports/supporters   # Lista sostenitori
```

### Telegram Webhook
```
POST   /api/v1/telegram/webhook     # Telegram updates (secret token)
```

---

## 5. Dipendenze NPM (Versioni Definitive)

### Backend (package.json)
```json
{
  "name": "gestionale-effata-backend",
  "version": "1.0.0",
  "description": "Backend API for Gestionale Effatà",
  "main": "dist/app.js",
  "scripts": {
    "dev": "ts-node-dev src/app.ts",
    "build": "tsc",
    "start": "node dist/app.js",
    "test": "jest",
    "test:integration": "jest --testPathPattern=integration",
    "lint": "eslint src --ext .ts",
    "format": "prettier --write src",
    "migrate": "sequelize-cli db:migrate",
    "seed": "sequelize-cli db:seed:all"
  },
  "dependencies": {
    "express": "^4.18.2",
    "sequelize": "^6.35",
    "pg": "^8.11",
    "dotenv": "^16.3.1",
    "jsonwebtoken": "^9.1.0",
    "bcryptjs": "^2.4.3",
    "joi": "^17.11.0",
    "cors": "^2.8.5",
    "helmet": "^7.1.0",
    "morgan": "^1.10.0",
    "express-rate-limit": "^7.1.5",
    "openai": "^4.24.1",
    "aws-sdk": "^2.1500.0",
    "multer": "^1.4.5",
    "telegraf": "^4.14.1",
    "iban-regex": "^1.0.0",
    "codice-fiscale-validator": "^2.0.0",
    "papaparse": "^5.4.1",
    "date-fns": "^2.30.0",
    "pino": "^8.16.2",
    "axios": "^1.6.2",
    "lodash": "^4.17.21"
  },
  "devDependencies": {
    "typescript": "^5.2.2",
    "@types/node": "^20.8.9",
    "@types/express": "^4.17.21",
    "ts-jest": "^29.1.1",
    "jest": "^29.7.0",
    "@testing-library/node": "^21.0.0",
    "supertest": "^6.3.3",
    "@types/jest": "^29.5.8",
    "eslint": "^8.52.0",
    "@typescript-eslint/eslint-plugin": "^6.9.1",
    "@typescript-eslint/parser": "^6.9.1",
    "prettier": "^3.0.3",
    "sequelize-cli": "^6.6.1",
    "ts-node-dev": "^2.0.0"
  }
}
```

### Frontend (package.json)
```json
{
  "name": "gestionale-effata-frontend",
  "version": "1.0.0",
  "dependencies": {
    "@angular/animations": "^17.0.0",
    "@angular/common": "^17.0.0",
    "@angular/compiler": "^17.0.0",
    "@angular/core": "^17.0.0",
    "@angular/forms": "^17.0.0",
    "@angular/platform-browser": "^17.0.0",
    "@angular/platform-browser-dynamic": "^17.0.0",
    "@angular/router": "^17.0.0",
    "@angular/service-worker": "^17.0.0",
    "@ionic/angular": "^7.5.0",
    "@ionic/storage": "^4.0.0",
    "@auth0/angular-jwt": "^5.2.0",
    "rxjs": "^7.8.1",
    "chart.js": "^4.4.0",
    "ng2-charts": "^4.1.1",
    "ngx-file-drop": "^14.0.0",
    "lodash": "^4.17.21"
  },
  "devDependencies": {
    "@angular/cli": "^17.0.0",
    "@angular/compiler-cli": "^17.0.0",
    "typescript": "^5.2.2",
    "cypress": "^13.6.0",
    "@cypress/schematic": "^2.5.0",
    "jasmine-core": "^5.0.0",
    "karma": "^6.4.2",
    "karma-chrome-launcher": "^3.2.0",
    "karma-coverage": "^2.2.1",
    "karma-jasmine": "^5.1.0",
    "karma-jasmine-html-reporter": "^2.1.0"
  }
}
```

---

## 6. Sfide Critiche & Mitigazioni

| # | Sfida | Impatto | Soluzione | Sprint |
|---|-------|--------|----------|--------|
| 1 | **OCR Accuracy < 95%** | Riconciliazione fallita | Prompt engineering; manual review loop; confidence score | 3 |
| 2 | **Media Upload Lento (Uganda)** | UX pessima, timeout | S3 multipart; client-side compression; offline queue | 2 |
| 3 | **GDPR - Diritto oblio** | Legal violation | Soft delete; anonymization; retention policy; lawyer review | 7 |
| 4 | **Database Concurrency** | Race condition riconciliazione | Optimistic locking (version field); serializable tx | 3 |
| 5 | **JWT Expiration** | Session timeout mobile | Sliding window (refresh 5min prima); retry logic | 1 |
| 6 | **CF/IBAN Validation** | False positives | Regex + checksum; manual verification UI | 3 |
| 7 | **Offline Support Bot** | Telegram queue perde dati | SQLite local queue; sync on reconnect | 2 |
| 8 | **Performance Load** | Dashboard lenta con 1000+ transazioni | DB indexing; pagination; caching Redis | 6 |

---

## 7. Timeline Dettagliata (8 Settimane = 40 giorni lavorativi)

### **SETTIMANA 1-2: Fondamenta & Autenticazione**
**Deliverable**: Login API funzionante, DB schema, Docker env

| Giorno | Task | Responsabile |
|--------|------|--------------|
| 1-2 | Setup repo + Docker Compose + DB | DevOps |
| 3-4 | Database migrations schema | Backend |
| 5-7 | JWT auth service + tests | Backend |
| 8-9 | Frontend Angular setup + routing | Frontend |
| 10 | Code review + refinement | Lead |

**Obiettivi Settimanali**:
- [ ] Docker Compose up (backend + postgres)
- [ ] User login API (/auth/login) responding
- [ ] Frontend build without errors
- [ ] Database migrations clean run

---

### **SETTIMANA 2-3: Telegram Bot & Media**
**Deliverable**: Bot upload funzionante, media in S3

| Giorno | Task | Responsabile |
|--------|------|--------------|
| 1-3 | S3 integration + multer handler | Backend |
| 4-5 | POST /api/media/upload endpoint | Backend |
| 6-7 | Telegram bot webhook setup | Backend |
| 8-10 | Frontend media gallery component | Frontend |

**Obiettivi**:
- [ ] /start command bot responds
- [ ] Photo upload → S3 → DB saved
- [ ] Mobile gallery displays media
- [ ] Operator auth via Telegram ID

---

### **SETTIMANA 3-4: AI Vision & Accounting Core**
**Deliverable**: OCR parsing funzionante, transaction API

| Giorno | Task | Responsabile |
|--------|------|--------------|
| 1-3 | OpenAI Vision integration | Backend |
| 4-6 | POST /parse-statement endpoint | Backend |
| 7-10 | Transaction CRUD + validation | Backend |

**Obiettivi**:
- [ ] Upload PDF estratto conto → parsed JSON
- [ ] CF validator regex + checksum passing
- [ ] Transaction model with status workflow
- [ ] Confidence score flagging

---

### **SETTIMANA 4-5: Domain Models & API Complete**
**Deliverable**: Adoption + Supporter API, full CRUD

| Giorno | Task | Responsabile |
|--------|------|--------------|
| 1-4 | Adoption model + endpoints | Backend |
| 5-7 | Supporter management API | Backend |
| 8-10 | Reconciliation logic | Backend |

**Obiettivi**:
- [ ] GET /adoptions/:id returns full data
- [ ] Supporter attachment workflow
- [ ] Reconciliation matching logic
- [ ] All API endpoints documented (Swagger)

---

### **SETTIMANA 5-6: Frontend PWA Phase 1**
**Deliverable**: Admin dashboard + supporter portal basics

| Giorno | Task | Responsabile |
|--------|------|--------------|
| 1-3 | Admin dashboard layout (desktop) | Frontend |
| 4-6 | Transaction table + filters | Frontend |
| 7-10 | Supporter portal view-only | Frontend |

**Obiettivi**:
- [ ] Dashboard KPIs rendering
- [ ] Transaction list sortable
- [ ] Responsive mobile layout
- [ ] JWT interceptor working

---

### **SETTIMANA 6-7: Frontend Phase 2 & Verifico.it**
**Deliverable**: Manual reconciliation UI, export CSV

| Giorno | Task | Responsabile |
|--------|------|--------------|
| 1-4 | Reconciliation UI (drag-drop) | Frontend |
| 5-7 | Verifico.it export API endpoint | Backend |
| 8-10 | Export CSV download + tests | Backend/Frontend |

**Obiettivi**:
- [ ] Admin can approve transactions
- [ ] CSV export matches Verifico spec
- [ ] Batch export operations
- [ ] Error handling + retry logic

---

### **SETTIMANA 7-8: Testing, Security, Deployment**
**Deliverable**: Production-ready, monitored, documented

| Giorno | Task | Responsabile |
|--------|------|--------------|
| 1-3 | E2E tests (Cypress) | QA |
| 4-5 | Security audit + GDPR check | Security/Lead |
| 6-8 | CI/CD pipeline (GitHub Actions) | DevOps |
| 9-10 | Production deployment + monitoring | DevOps/Lead |

**Obiettivos**:
- [ ] All E2E tests passing
- [ ] OWASP Top 10 review done
- [ ] SSL certificate installed
- [ ] Monitoring alerts configured
- [ ] Runbook documentation complete

---

## 8. Verification & Pre-Launch Checklist

### Code Quality
- [ ] Unit tests: `npm run test` (>80% coverage)
- [ ] Integration tests: `npm run test:integration` passing
- [ ] Linting: `npm run lint` 0 errors
- [ ] Build: `npm run build` success
- [ ] API Swagger docs generated

### Functionality
- [ ] User story acceptance criteria all passing
- [ ] Telegram bot commands responding
- [ ] PDF OCR parsing accuracy >95%
- [ ] Media upload end-to-end
- [ ] Dashboard rendering all KPIs
- [ ] Export CSV format correct (Verifico validation)

### Security & Privacy
- [ ] GDPR audit passed
- [ ] OWASP Top 10 tested
- [ ] SQL injection tests passing
- [ ] JWT token lifecycle correct
- [ ] CF/IBAN validation robust
- [ ] Audit logs capturing all changes
- [ ] Secrets scanning (pre-commit hook)

### Performance
- [ ] Page load time <2s (dashboard)
- [ ] API response time <500ms (avg)
- [ ] Database query optimization (explain plans)
- [ ] CDN configured for images
- [ ] PWA offline mode tested

### Infrastructure
- [ ] Docker images build cleanly
- [ ] docker-compose up -d succeeds
- [ ] Database migrations run without error
- [ ] Nginx config + SSL certificate
- [ ] Backup strategy tested (restore test)
- [ ] Monitoring dashboards (Prometheus/Grafana)

### Documentation
- [ ] API documentation (Swagger/OpenAPI)
- [ ] Architecture decision records (ADRs)
- [ ] Deployment runbook
- [ ] GDPR & privacy policy
- [ ] User manual (admin, operator, supporter)

---

## 9. Tech Debt & Future Improvements (Post-MVP)

- [ ] Implement Redis caching (JWT blacklist, session)
- [ ] ClamAV virus scanning for file uploads
- [ ] Internationalization (i18n) for IT/EN
- [ ] Push notifications (PWA + Telegram)
- [ ] Mobile app native (React Native / Flutter)
- [ ] GraphQL API (complementary to REST)
- [ ] Machine learning (fraud detection on donations)
- [ ] Offline sync queue with conflict resolution
- [ ] Multi-language support for AI Vision (non-English statements)
- [ ] Integration with other accounting systems

---

## 10. Risks & Mitigation

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|-----------|
| AI Vision accuracy low | Medium | High | PoC 10 real PDFs week 1; manual review workflow |
| Media upload scalability | Medium | High | CDN + compression; load test week 2 |
| GDPR compliance issues | Low | Critical | Legal review week 1; audit logs comprehensive |
| Database performance | Medium | Medium | Indexing strategy; query optimization week 5 |
| Team availability | Low | High | Clear role assignment; documentation focus |

---

## 11. Definizioni Fase-Completamento

### Phase Complete quando:
1. **Tutti** deliverables completati
2. **Tutti** acceptance criteria passando
3. **Code review** passato
4. **Tests** >80% coverage
5. **Deployment** successful (staging)

---

## 12. Next Actions (Immediati)

- [ ] **Conferma tech stack** (PostgreSQL vs MySQL? OpenAI vs Claude?)
- [ ] **Assegna team** (Backend, Frontend, DevOps lead)
- [ ] **Setup repository** (GitHub + protections)
- [ ] **Configura pre-commit hooks** (linting, secrets scan)
- [ ] **Prova PoC**: 
  - [ ] Crea bot Telegram minimo
  - [ ] Test OCR su 10 estratti reali
  - [ ] Setup Docker Compose locale
- [ ] **Chiama legal** per GDPR compliance review

---

## Summary

Questo piano fornisce una roadmap completa per 8 settimane di sviluppo. L'architettura è scalabile, la tecnologia è consolidata, e i rischi sono identificati e mitigati.

**Prossimo step**: Approvazione e inizio **Week 1** Setup Infrastructure.

