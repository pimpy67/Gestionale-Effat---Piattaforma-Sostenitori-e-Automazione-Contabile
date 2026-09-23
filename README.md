# Gestionale Effatà

**Piattaforma per Adottanti e Automazione Contabile**

Gestione integrata di adozioni a distanza in Uganda con automazione contabile, upload media tramite Telegram bot, e PWA per sostenitori.

---

## 📋 Documentazione

Questo repository è organizzato con la seguente struttura:

```
.
├── README.md                              # Questo file
├── documento_di_requisiti_di_prodotto_prd.md  # Requisiti originali (PRD)
├── docs/
│   ├── ARCHITETTURA.md                   # Tech stack, patterns, deployment architecture
│   ├── SCHEMA_DATABASE.md                # Database schema SQL, indici, relazioni
│   ├── API_ENDPOINTS.md                  # REST API endpoints dettagliati
│   ├── RISCHI.md                         # Rischi critici e mitigazioni
│   ├── TIMELINE.md                       # 8 settimane timeline giorno per giorno
│   ├── DEPLOYMENT.md                     # Setup produzione, CI/CD, monitoring
│   └── CHANGE_MANAGEMENT.md              # Come gestire cambiamenti al PRD
├── backend/                              # Node.js + Express
├── frontend/                             # Angular 17 + Ionic
├── docker-compose.yml                    # Local dev environment
└── .env.example                          # Environment template
```

---

## 📖 Come Usare la Documentazione

### Per **Product Managers / Stakeholder**
Leggi il file **PRD** originale:
- `documento_di_requisiti_di_prodotto_prd.md` - Visione, user personas, user stories

### Per **Developer Backend**
Leggi questi file **in ordine**:
1. `docs/ARCHITETTURA.md` - Tech stack, project structure
2. `docs/SCHEMA_DATABASE.md` - Database schema
3. `docs/API_ENDPOINTS.md` - API endpoints che devi implementare
4. `docs/TIMELINE.md` - Che cosa devi fare questa settimana

### Per **Developer Frontend**
Leggi questi file:
1. `docs/ARCHITETTURA.md` - Tech stack (Angular, Ionic, PWA)
2. `docs/API_ENDPOINTS.md` - API endpoints che il backend espone
3. `docs/TIMELINE.md` - Sprint plan per frontend

### Per **DevOps / Infrastructure**
Leggi questi file:
1. `docs/ARCHITETTURA.md` - Deployment architecture
2. `docs/DEPLOYMENT.md` - Setup produzione, CI/CD pipeline, monitoring

### Per **QA / Testing**
Leggi questi file:
1. `docs/TIMELINE.md` - Test plan per ogni settimana
2. `docs/DEPLOYMENT.md` - Pre-deployment checklist
3. `docs/RISCHI.md` - Scenario da testare (risk scenarios)

### Per **Project Lead**
Leggi questi file:
1. `docs/TIMELINE.md` - 8 settimane roadmap, daily standup format
2. `docs/RISCHI.md` - Risk matrix, monitoring strategy
3. `docs/ARCHITETTURA.md` - Tech decisions

---

## 🎯 Differenza PRD vs PIANO_SVILUPPO

| Aspetto | PRD | docs/ |
|---------|-----|-------|
| **Cosa è** | Requisiti di prodotto | Piano tecnico di implementazione |
| **Audience** | Stakeholder, client | Developers, DevOps |
| **Livello dettaglio** | Basso (business) | Alto (technical) |
| **Cambierà?** | Raramente (se cambiano requisiti) | Spesso (durante sviluppo) |

**Se il PRD cambia** → aggiorna `docs/` di conseguenza (vedi [CHANGE_MANAGEMENT.md](#change-management))

---

## 🚀 Quick Start (Local Development)

### Prerequisiti
- Node.js 20+
- Docker + Docker Compose
- Git

### Setup

```bash
# Clone
git clone https://github.com/pimpy67/Gestionale-Effat...
cd gestionale-effata

# Environment
cp .env.example .env

# Start services
docker-compose up -d
sleep 30

# Install + migrate
cd backend && npm install && npm run migrate
cd ../frontend && npm install

# Start dev
cd backend && npm run dev    # Terminal 1: http://localhost:3000
cd frontend && ng serve      # Terminal 2: http://localhost:4200
```

**Verifica**: 
```bash
curl http://localhost:3000/api/v1/health
```

---

## 📅 Development Timeline

**8 settimane totali**, 4 fasi:

- **W1-2**: Fondamenta (DB, Auth, Docker)
- **W2-3**: Telegram Bot + Media
- **W3-4**: AI Vision OCR + Accounting
- **W5-8**: Frontend PWA + Export + Deployment

Vedi `docs/TIMELINE.md` per dettagli giorno-per-giorno.

---

## 🔧 Tech Stack

- **Backend**: Node.js 20 + Express + TypeScript
- **Frontend**: Angular 17 + Ionic + PWA
- **Database**: PostgreSQL 15
- **AI Vision**: OpenAI GPT-4o
- **Storage**: AWS S3 (production) / Local (dev)
- **Bot**: Telegram + Telegraf SDK
- **Deployment**: Docker Compose + Nginx + Certbot SSL

---

## 📊 Database Schema

10 tabelle:
- `users` - Autenticazione
- `adoptions` - Adozioni
- `supporters` - Sostenitori
- `adoption_supporters` - Relazione N:M
- `donations` - Transazioni
- `media` - Foto/video
- `bank_statements` - Estratti conto
- `reconciliations` - Matching bank ↔ donations
- `audit_logs` - GDPR compliance

Vedi `docs/SCHEMA_DATABASE.md` per SQL completo.

---

## 🔌 API Endpoints

**Base URL**: `https://api.gestionale-effata.it/api/v1`

**Auth**:
- `POST /auth/register`
- `POST /auth/login`
- `POST /auth/refresh`
- `GET /auth/me`

**Adoptions**:
- `GET /adoptions`
- `GET /adoptions/:id`
- `POST /adoptions`

**Media**:
- `POST /media/upload`
- `GET /media/:id`

**Accounting**:
- `POST /accounting/parse-statement` (OCR)
- `GET /accounting/donations`
- `PUT /accounting/donations/:id/verify`
- `POST /accounting/export-verifico` (CSV export)

Vedi `docs/API_ENDPOINTS.md` per la lista completa con request/response examples.

---

## ⚠️ Rischi Critici

5 rischi identificati con mitigazioni:

1. **OCR Accuracy < 95%** → Manual review loop
2. **Media Upload Lento (Uganda)** → S3 multipart + compression
3. **GDPR Compliance** → Soft delete + audit logs
4. **Database Concurrency** → Optimistic locking
5. **JWT Token Lifecycle** → Sliding window refresh

Vedi `docs/RISCHI.md` per dettagli e monitoring strategy.

---

## 🔄 Change Management

### Se il PRD cambia...

**Esempio**: Cliente chiede di aggiungere feature "notifiche push"

**Procedura**:
1. **Aggiorna PRD** (`documento_di_requisiti_di_prodotto_prd.md`)
   - Aggiungi user story (US-XXX)
   - Aggiungi acceptance criteria
   
2. **Aggiorna docs/**
   - `SCHEMA_DATABASE.md`: nuove tabelle (notifications)
   - `API_ENDPOINTS.md`: nuovi endpoint (POST /notifications, GET /notifications)
   - `ARCHITETTURA.md`: se architettura impattata
   - `TIMELINE.md`: ripiano timeline se necessario
   
3. **Aggiorna RISCHI.md** se nuovi rischi identificati

4. **Commit** con message:
   ```
   Update: Add push notification feature
   
   - Updated PRD with US-XXX
   - Added notification schema to SCHEMA_DATABASE.md
   - Added endpoints to API_ENDPOINTS.md
   - Replanned timeline: Feature in W5 instead of MVP
   ```

### Se cambiano i Rischi...

Se durante lo sviluppo scopri un nuovo rischio:

1. Aggiungi a `docs/RISCHI.md`
2. Aggiorna timeline se necessario
3. Notifica il team

---

## ✅ Pre-Launch Checklist

Prima di andare in produzione (settimana 8):

**Code Quality**:
- [ ] `npm run test` (>80% coverage)
- [ ] `npm run lint` (0 errors)
- [ ] `npm run build` (success)
- [ ] E2E tests passing (`npx cypress run`)

**Security**:
- [ ] OWASP Top 10 audit done
- [ ] GDPR compliance review passed
- [ ] Secrets scanning (no API keys in code)

**Infrastructure**:
- [ ] Docker images build cleanly
- [ ] Database backups working
- [ ] SSL certificate configured
- [ ] Monitoring dashboards setup

**Deployment**:
- [ ] CI/CD pipeline working
- [ ] Staging environment tested
- [ ] Rollback procedure documented
- [ ] Team trained

Vedi `docs/DEPLOYMENT.md` per checklist completa.

---

## 📞 Communication

### Daily Standup
15 minuti, formato:
- 🟡 Cosa ho fatto ieri
- 🟢 Cosa faccio oggi
- 🔴 Blockers

### Weekly Sprint Review
- Review completati items
- Demo to stakeholders
- Planning next week

### Risk Review
- Bi-weekly risk assessment
- Update `docs/RISCHI.md` se needed

---

## 📝 Contributing

### Workflow
1. Create branch: `git checkout -b feature/something`
2. Make changes
3. Update relevant docs in `docs/`
4. Test locally: `npm run test`
5. Commit: `git commit -m "feature: description"`
6. Push: `git push origin feature/something`
7. Create Pull Request

### Commit Message Format
```
type: subject (max 50 chars)

body (max 72 chars per line)
- Bullet points acceptable
```

Types: `feat`, `fix`, `refactor`, `test`, `docs`, `update`

---

## 🆘 Troubleshooting

### Docker Compose non parte
```bash
docker-compose down
docker-compose pull
docker-compose up -d
```

### Database lock/corruption
```bash
# Restart database
docker-compose restart postgres

# Or restore from backup (see docs/DEPLOYMENT.md)
```

### Tests non partono
```bash
cd backend
npm install
npm run test
```

### Porta occupata
```bash
# Trova processo su port 3000
lsof -i :3000

# Kill e restart
kill -9 <PID>
docker-compose restart
```

---

## 📚 Resources

- **GitHub**: https://github.com/pimpy67/Gestionale-Effat...
- **Issues**: Report bugs or feature requests
- **Discussions**: Ask questions

---

## 📄 License

Questo è un progetto didattico per Effatà Italia ODV.

---

**Last Updated**: 2026-09-23  
**Version**: 1.0  
**Next Review**: End of Week 1

