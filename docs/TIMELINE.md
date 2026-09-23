# 📅 Timeline & Sprint Plan (8 Settimane)

**Total**: 40 giorni lavorativi | 4 fasi | Daily standup + Weekly review

---

## SETTIMANA 1-2: Fondamenta & Autenticazione

**Deliverable**: Login API funzionante, DB setup, Docker env, primo commit code

### Giorno 1-2: Setup & Infrastructure
- [ ] Creare branch structure nel repo (main, develop)
- [ ] Setup Docker Compose (PostgreSQL, PgAdmin)
- [ ] Creare backend boilerplate (Express + TypeScript)
- [ ] Creare frontend boilerplate (Angular 17 + Ionic)
- [ ] .env.example configurazione
- [ ] Pre-commit hooks (eslint, prettier, secrets scan)

**Tasks**:
```bash
# Backend
npm init -y
npm install express typescript ts-node dotenv
mkdir src/{config,middleware,modules,services,utils}

# Frontend
ng new gestionale-effata-frontend --routing --style=scss --skip-git=true
cd gestionale-effata-frontend && ionic integrations enable capacitor

# Docker
docker-compose up -d  # PostgreSQL running locally
```

**Checkpoint**: 
- [ ] `docker-compose ps` mostra postgres running
- [ ] `npm run dev` starts backend
- [ ] `ng serve` starts frontend

---

### Giorno 3-4: Database Schema & Migrations

**Responsabile**: Backend Lead  
**Task**: Creare 10 tabelle SQL, indici, migration scripts

```bash
# Setup Sequelize
npm install sequelize sequelize-cli pg pg-hstore

# Creare migrations
sequelize-cli init
sequelize-cli migration:generate --name create-users-table
sequelize-cli migration:generate --name create-adoptions-table
# ... etc per tutte 10 tabelle

# Run migrations
sequelize-cli db:migrate
```

**Checkpoint**:
- [ ] `psql gestionale_effata` → `\dt` mostra 10 tabelle
- [ ] Indici creati e verificati
- [ ] Seeds di test data caricati

---

### Giorno 5-7: JWT Authentication Service

**Responsabile**: Backend Lead  
**Task**: Login, register, JWT middleware, RBAC

```typescript
// src/modules/auth/auth.service.ts
- register(email, password, role): Promise<User>
- login(email, password): Promise<{ accessToken, refreshToken }>
- refreshToken(token): Promise<{ accessToken }>
- validateToken(token): Promise<User>

// src/middleware/auth.middleware.ts
- JWT verification
- Role-based access check
```

**Tests**:
- Unit test: bcryptjs hash/compare
- Integration test: POST /auth/login → JWT token
- Integration test: unauthorized request → 401

**Checkpoint**:
- [ ] `POST /auth/login` returns JWT
- [ ] `GET /auth/me` with token returns user
- [ ] `GET /admin` without admin role → 403

---

### Giorno 8-9: Frontend Auth Setup

**Responsabile**: Frontend Lead  
**Task**: Login page, routing guards, JWT interceptor

```typescript
// src/app/auth/login/login.component.ts
- Form submission → POST /auth/login
- Store JWT in localStorage

// src/services/auth.service.ts
- login(), logout(), getCurrentUser()
- Token management

// src/interceptors/auth.interceptor.ts
- Add JWT to all requests
- Auto-refresh on 401
- Redirect to login on 403

// src/guards/auth.guard.ts
- CanActivate guard per protected routes
```

**Checkpoint**:
- [ ] Login page renders
- [ ] Can login with valid credentials
- [ ] Token stored in localStorage
- [ ] Protected routes require login

---

### Giorno 10: Code Review & Refinement

- Sprint review meeting
- Code review PR
- Fix issues, optimize

**Definition of Done**:
- ✅ All tests passing
- ✅ Lint 0 errors
- ✅ Docker build successful
- ✅ Deployed to staging

---

## SETTIMANA 2-3: Telegram Bot & Media

**Deliverable**: Bot funzionante, photo upload → S3, frontend gallery

### Giorno 1-3: S3 Integration & Media Endpoints

**Responsabile**: Backend Lead

```typescript
// src/services/storage.service.ts
- uploadToS3(file): Promise<url>
- deleteFromS3(key): Promise<void>

// src/modules/media/media.controller.ts
- POST /api/v1/media/upload
- GET /api/v1/media/:id
- DELETE /api/v1/media/:id

// Multer middleware
- File size limit: 50MB
- Allowed types: image/*, video/*, application/pdf
```

**Tests**:
- Mock S3 upload
- Integration test: upload file → saved in DB
- Test: unauthorized user → 403

---

### Giorno 4-5: Telegram Bot Setup

**Responsabile**: Backend Lead

```typescript
// src/modules/telegram/bot.service.ts
- Setup Telegraf SDK
- /start command handler
- Photo upload handler
- Message acknowledgment

// src/modules/telegram/telegram.controller.ts
- POST /api/v1/telegram/webhook
- Verify secret token
- Parse message + photo
- Call media.service.upload()
```

**Features**:
- [ ] /start → greet operator
- [ ] Send photo with caption (adoption code)
- [ ] Save photo to S3
- [ ] Create Media DB record
- [ ] Send confirmation message back

**Testing**:
- Mock Telegram API
- Test webhook signature verification
- Test photo parsing

---

### Giorno 6-7: Frontend Media Gallery

**Responsabile**: Frontend Lead

```typescript
// src/app/shared/media-gallery/media-gallery.component.ts
- Display grid of media
- Lazy load images
- Modal for full-size view
- Delete button (owner only)

// src/services/media.service.ts
- getAdoptionMedia(adoptionId)
- uploadMedia(file, adoptionId)
- deleteMedia(mediaId)
```

**UI**:
- Responsive grid (mobile: 1 col, tablet: 2, desktop: 3+)
- Loading skeleton
- Error handling

---

### Giorno 8-10: Integration & Testing

- E2E test: Bot upload → Frontend render
- Load test: 50 simultaneous uploads
- Fix bugs

**Checkpoint**:
- [ ] Bot responds to /start
- [ ] Photo upload → S3 → DB
- [ ] Frontend gallery shows photos
- [ ] All tests passing

---

## SETTIMANA 3-4: AI Vision & Accounting

**Deliverable**: OCR parsing funzionante, transaction API, validation

### Giorno 1-3: OpenAI Vision Integration

**Responsabile**: Backend Lead

```typescript
// src/services/ai-vision.service.ts
- uploadToChatGPT(imageBuffer): Promise<parsed>
- parseStatement(ocr_result): Promise<transactions>
- structuredOutput: JSON schema for response

const prompt = `
Extract from bank statement:
- Date (YYYY-MM-DD)
- Amount (decimal)
- Description/Causale
- Account number
Return JSON array: [{ date, amount, description, account }]
`;
```

**Setup**:
```bash
npm install openai
export OPENAI_API_KEY=sk-...
```

**Tests**:
- PoC con 10 estratti reali
- Misurare accuracy > 95%
- Latency < 10 sec per documento

---

### Giorno 4-6: Transaction Validation & API

**Responsabile**: Backend Lead

```typescript
// src/modules/accounting/accounting.service.ts
- validateCF(codiceFiscale): boolean  // Checksum
- validateIBAN(iban): boolean         // Regex
- reconcileTransaction(parsed): Donation

// src/modules/accounting/accounting.controller.ts
- POST /accounting/parse-statement
- GET /accounting/donations
- PUT /accounting/donations/:id/verify

// src/models/donation.model.ts
- status: PENDING | VERIFIED | ANOMALY | ARCHIVED
- verified_by, verified_at
```

**Database**:
```sql
CREATE TABLE bank_statements (
  parsed_data JSONB,
  status VARCHAR,
  ...
);

CREATE TABLE donations (
  status VARCHAR,
  verified_by UUID,
  verified_at TIMESTAMP,
  ...
);
```

---

### Giorno 7-10: Admin Dashboard + Tests

**Responsabile**: Frontend + Backend

**Backend**:
- GET /accounting/donations → list pending
- Dashboard metrics endpoint

**Frontend**:
- Admin dashboard page
- Transaction table
- Verify/Reject buttons
- Filter by status/date

**Tests**:
- All validation tests
- Concurrency test (2 admin verify same donation)
- Integration test: upload PDF → parse → verify

---

## SETTIMANA 4-5: Domain Models & API Complete

**Deliverable**: Adoption/Supporter API, full CRUD, all endpoints documented

### Giorno 1-4: Adoption & Supporter Models

```typescript
// src/models/adoption.model.ts
// src/models/supporter.model.ts
// src/models/adoption-supporter.model.ts (N:M relation)

// Controllers + Routes
- GET /adoptions
- POST /adoptions (admin only)
- GET /adoptions/:id
- PUT /adoptions/:id
- GET /adoptions/:id/supporters
```

---

### Giorno 5-10: Full API Testing & Swagger Docs

```bash
npm install swagger-jsdoc swagger-ui-express

# Generate: http://localhost:3000/api-docs
```

**Endpoints documented**:
- [ ] Auth (5 endpoints)
- [ ] Adoptions (5 endpoints)
- [ ] Media (3 endpoints)
- [ ] Accounting (8 endpoints)
- [ ] Reports (3 endpoints)
- [ ] Telegram webhook (1 endpoint)

**Pre-launch Checklist**:
- [ ] All endpoints responding
- [ ] Error handling consistent
- [ ] Rate limiting active
- [ ] CORS configured
- [ ] Load test: 100 req/sec → no errors

---

## SETTIMANA 5-6: Frontend PWA Phase 1

**Deliverable**: Admin dashboard, supporter portal, PWA ready

### Giorno 1-3: Admin Dashboard

```typescript
// src/app/admin/dashboard/dashboard.component.ts
- KPI cards (total adoptions, $ income, pending)
- Transaction table
- Export button
- Responsive layout
```

### Giorno 4-6: Supporter Portal

```typescript
// src/app/supporter/adoption-detail/adoption-detail.component.ts
- Display child info
- Media gallery
- Donation history
- Download receipt
```

### Giorno 7-10: PWA Features

```typescript
// Service Worker
- Cache-first strategy for static assets
- Network-first for API
- Offline fallback page

// Angular config
- manifest.json (PWA metadata)
- icons (192x192, 512x512)
```

**Testing**:
- [ ] Works on Chrome, Safari, Firefox
- [ ] Mobile responsiveness
- [ ] Offline mode works
- [ ] Network-slow mode (throttling)

---

## SETTIMANA 6-7: Frontend Phase 2 & Verifico Export

**Deliverable**: Manual reconciliation UI, CSV export

### Giorno 1-4: Reconciliation UI

```typescript
// Admin can manually match bank transactions ↔ donations
- Drag-drop interface
- Confidence score display
- Bulk approve/reject
```

### Giorno 5-10: Verifico.it Export

```typescript
// POST /accounting/export-verifico
- Date range picker
- CSV generation
- Download trigger
- Compliance check
```

---

## SETTIMANA 7-8: Testing, Security, Deployment

### Giorno 1-3: E2E Testing

```bash
npm install cypress

# Run:
npx cypress open
```

**Test Scenarios**:
- [ ] Complete user flow: login → upload → reconcile → export
- [ ] Bot upload → gallery render
- [ ] Admin verify donation
- [ ] Supporter download receipt

---

### Giorno 4-5: Security Audit & GDPR

- [ ] OWASP Top 10 review
- [ ] SQL injection test
- [ ] CSRF protection verify
- [ ] Secrets scanning
- [ ] GDPR compliance check (with lawyer)

---

### Giorno 6-10: CI/CD & Deployment

```bash
# GitHub Actions workflow
- Lint (ESLint)
- Test (Jest + Cypress)
- Build Docker images
- Deploy to staging
- Smoke tests
- Deploy to production
```

**Production Checklist**:
- [ ] Database backups running
- [ ] SSL certificate active
- [ ] Monitoring dashboards setup
- [ ] Alerting rules configured
- [ ] Runbook documentation complete
- [ ] Team training done

---

## Daily Standup Format

```
🟡 What I did yesterday:
   - Implemented JWT middleware
   - Fixed bug in media upload

🟢 What I'm doing today:
   - Deploy auth to staging
   - Code review PR #3

🔴 Blockers:
   - None
```

## Weekly Review

- Sprint retrospective
- Code metrics review
- Risk assessment
- Planning for next sprint

---

## Contingency Plan

If behind schedule:

**Week 1-2 Delay** → Push Telegram Bot to Week 3  
**Week 3-4 Delay** → Use mock AI Vision responses for testing  
**Week 5-6 Delay** → Focus on admin dashboard first  
**Week 7-8 Delay** → Deploy MVP without export (add later)

