# 🏗️ Architettura di Sistema - Gestionale Effatà

## Directory Structure

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

---

## Tech Stack

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

## Architectural Patterns

### 1. **Layered Architecture**
```
Presentation Layer (API routes, controllers)
         ↓
Business Logic Layer (services)
         ↓
Data Access Layer (repositories, ORM)
         ↓
Database Layer (PostgreSQL)
```

### 2. **Module-Based Organization**
- Ogni modulo (`auth`, `adoption`, `media`, `accounting`, `telegram`) è autocontenuto
- Facile aggiungere/rimuovere funzionalità
- Scalabile per microservices future

### 3. **Dependency Injection**
- Constructor injection per testabilità
- Container pattern per service registration

### 4. **Repository Pattern**
- Abstrazione DB access
- Facile switch tra ORM (Sequelize → TypeORM)

### 5. **Offline-First PWA**
- Service Worker per caching strategico
- Sync queue per operazioni offline
- Progressive enhancement

---

## Data Flow Diagram

```
[ OPERATORE / VOLONTARIO ]              [ SOSTENITORE ]
          │                                   │
          ▼ (Upload Foto / PDF)               ▼ (Login JWT)
   ┌──────────────┐                  ┌─────────────────┐
   │ Telegram Bot │                  │ Web Portal (PWA)│
   └──────┬───────┘                  └────────┬────────┘
          │                                   │
          └─────────────┬─────────────────────┘
                        │ HTTP REST / Webhooks
                        ▼
            ┌──────────────────────┐
            │   BACKEND NODE.JS    │
            ├──────────────────────┤
            │  - Controller API    │
            │  - Media Processor   │
            │  - Validation Layer  │
            └───────────┬──────────┘
                        │
       ┌────────────────┼────────────────┐
       ▼                ▼                ▼
┌──────────────┐ ┌──────────────┐ ┌──────────────┐
│  AI Vision   │ │  Database    │ │ Cloud Media  │
│  (OpenAI)    │ │ (PostgreSQL) │ │ Storage (S3) │
└──────────────┘ └──────────────┘ └──────────────┘
                        │
                        ▼ (Esportazione CSV)
               ┌────────────────┐
               │  VERIFICO.IT   │
               └────────────────┘
```

---

## Security Architecture

### Authentication & Authorization
- **JWT Tokens**: Short-lived access token (15 min) + refresh token (7 days)
- **RBAC** (Role-Based Access Control):
  - `ADMIN`: Full system access
  - `FIELD_OPERATOR`: Media upload only
  - `SUPPORTER`: Read-only own adoption data
- **Password**: bcryptjs hashing (10 rounds)

### Data Protection
- **HTTPS/TLS**: Nginx + certbot SSL
- **GDPR Compliance**:
  - Soft delete (logical delete, not physical)
  - Audit logs for all data changes
  - Right to be forgotten implementation
  - Encryption of sensitive fields (CF, IBAN)

### API Security
- **Rate Limiting**: 100 req/min per supporter, 1000 per admin
- **CORS**: Whitelisted domains only
- **Helmet.js**: Security headers
- **Input Validation**: Joi schema validation on all endpoints

---

## Deployment Architecture

```
┌─────────────────────────────────────┐
│         Developer Laptop            │
│  (Docker Compose: Backend + PG)     │
└─────────────────────────────────────┘
               │
               │ git push
               ▼
┌─────────────────────────────────────┐
│      GitHub + GitHub Actions        │
│  (CI/CD: lint, test, build Docker)  │
└─────────────────────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│    Linux VPS (Production)           │
│  ┌────────────────────────────────┐ │
│  │ Docker Compose                 │ │
│  │ ├─ Backend (Node.js)           │ │
│  │ ├─ Frontend (Nginx static)     │ │
│  │ ├─ PostgreSQL (with backup)    │ │
│  │ └─ Prometheus (monitoring)     │ │
│  └────────────────────────────────┘ │
│  ┌────────────────────────────────┐ │
│  │ Nginx Reverse Proxy + Certbot  │ │
│  │ (SSL, routing, compression)    │ │
│  └────────────────────────────────┘ │
└─────────────────────────────────────┘
```

---

## Scalability Considerations

### Current (MVP - 8 weeks)
- Monolithic backend (Node.js single instance)
- PostgreSQL on same VPS
- Local file storage or S3

### Future (Post-MVP)
- Microservices: Separate bot, API, worker services
- Load balancer (Nginx or AWS ALB)
- Database replication (primary + replica)
- Redis cache layer (JWT blacklist, session store)
- Message queue (RabbitMQ/Redis Streams for async jobs)
- CDN (CloudFront) for static assets and media

