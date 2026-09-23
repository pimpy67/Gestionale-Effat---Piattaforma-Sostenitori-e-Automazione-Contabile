# 📄 Product Requirements Document (PRD)

**Nome Progetto:** Gestionale Effatà – Piattaforma per Adottanti e Automazione Contabile
**Autore:** Andrea Pavan
**Versione:** 2.0
**Target:** Progetto Didattico / Sistema Operativo per Effatà Italia ODV

---

## ⚡ CHANGE MANAGEMENT

> **⚠️ IMPORTANTE**: Questo PRD è il documento "master" di business requirements. 
> **QUANDO CAMBIA IL PRD, CAMBIA ANCHE IL PIANO DI SVILUPPO.**
> Se lo modifichi, **aggiorna automaticamente** anche questi file in `/docs`:

```
SE CAMBI IL PRD → AGGIORNA (CASCATA):
├─ Nuova User Story (US-XXX) o AC cambiate?
│  ├─ docs/TIMELINE.md (ripiano timeline, aggiungi settimane?)
│  ├─ docs/SCHEMA_DATABASE.md (nuove tabelle?)
│  ├─ docs/API_ENDPOINTS.md (nuovi endpoint?)
│  └─ docs/RISCHI.md (nuovo rischio?)
│
├─ Cambio priorità o scope feature?
│  └─ docs/TIMELINE.md (riordina sprint, sposta deadline)
│
├─ Nuovo modello o cambio dati?
│  ├─ docs/SCHEMA_DATABASE.md (tabelle, indici, relazioni)
│  └─ docs/API_ENDPOINTS.md (impatto API)
│
├─ Cambio architettura o tech stack?
│  ├─ docs/ARCHITETTURA.md (patterns, layers, deployment)
│  └─ docs/DEPLOYMENT.md (se infra impattata)
│
└─ Nuovo rischio identificato?
   └─ docs/RISCHI.md (risk matrix, monitoring)
```

**Procedura per Change**:
1. Modifica questo PRD (versione → incrementa)
2. Aggiorna i file in `/docs` di conseguenza (tutti impattati)
3. Commit con messaggio: `update: [description] (PRD v2.X)`
4. Notifica il team → **TIMELINE E PIANO CAMBIANO**

**Esempio: Aggiungere Notifiche Push**:
```
PRD: Aggiungi US-502 "Notifiche push sostenitori"
  ↓ PIANO CAMBIA:
1. docs/TIMELINE.md 
   - Aggiungi 1-2 settimane per feature
   - Sposta altre feature di conseguenza
   
2. docs/SCHEMA_DATABASE.md
   - Crea tabella: notifications, notification_subscriptions
   - Indice: idx_notifications_user, idx_notifications_created_at
   
3. docs/API_ENDPOINTS.md
   - POST /notifications/subscribe
   - GET /notifications
   - DELETE /notifications/:id
   
4. docs/ARCHITETTURA.md
   - Descrivi: WebSocket o Redis Pub/Sub?
   - Service Worker per PWA push?
   
5. docs/RISCHI.md
   - Risk: WebSocket scalability
   - Risk: Browser push support across devices
   - Mitigation: Graceful degradation
   
6. Commit:
   git commit -m "update: Add push notifications feature (PRD v2.1)
   
   - Added US-502 to PRD
   - Replanned timeline (add 1.5 weeks)
   - Added notification schema
   - Added 3 new API endpoints
   - Identified 2 new risks + mitigations"
```

**⚡ RICORDA**: 
- PRD = cosa fare (COSA)
- docs/ = come farlo (COME + QUANDO)
- Se COSA cambia, automaticamente COME e QUANDO cambiano

---

## 1. Visione del Prodotto e Obiettivi

### 1.1 Inquadramento e Problema
L'associazione *Effatà Italia ODV* gestisce progetti di solidarietà e adozioni a distanza in Uganda. Attualmente la gestione dei dati dei sostenitori, l'invio degli aggiornamenti (foto, certificati, pagelle dei bambini) e la rendicontazione contabile (preparazione dati per il bilancio su *Verifico.it*) richiedono un intenso lavoro manuale di data-entry e gestione file.

### 1.2 Soluzione
Un **sistema integrato e modulare** composto da:
1. **Telegram Bot:** Interfaccia veloce per gli operatori in Italia/Uganda per il caricamento di media e la lettura degli estratti conto tramite AI.
2. **Backend API (Node.js/Express):** Core applicativo con elaborazione media, AI Vision per OCR estratti conto e validazione algoritmica dei dati.
3. **Database Relazionale (MySQL/PostgreSQL/SQLite):** Struttura dati normalizzata per sostenitori, adozioni, donazioni e logistica media.
4. **Portal Sostenitori (Frontend Angular/Ionic):** Area riservata web/PWA per i sostenitori per consultare lo stato dell'adozione, i media e lo storico donazioni/ricevute.
5. **Esportazione & Bridge Contabile:** Modulo di integrazione per formattare e trasferire le entrate contabili verso *Verifico.it*.

---

## 2. Archetipi Utente (User Personas)

| ID Archetipo | Chi è | Contesto d'uso | Competenze Digitali | Frequenza d'Uso |
| :--- | :--- | :--- | :--- | :--- |
| **ARC-001** | **Amministratore / Tesoriere** | Usa il sistema da desktop per validare donazioni, esportare report contabili per *Verifico.it* e gestire le associazioni tra sostenitori e bambini. | Medio-alte (conosce fogli di calcolo e gestionali) | Settimanale / Mensile |
| **ARC-002** | **Operatore sul Campo / Volontario** | Opera spesso da smartphone in mobilità (anche con connettività limitata in Uganda) per caricare foto e notizie dei bambini. | Base / Intermedia (usa quotidianamente Telegram e app di messaggistica) | Quotidiana / Eventuale |
| **ARC-003** | **Sostenitore / Donatore** | Accede prevalentemente da smartphone o PC per verificare lo stato della propria adozione, scaricare le ricevute fiscali e guardare le foto. | Base (navigazione web standard) | Sporadica (1-2 volte al mese o al momento della donazione) |

---

## 3. Requisiti Funzionali: User Story e Acceptance Criteria

### M1: Telegram Bot Operativo (Data Input Hub)

#### **US-101: Upload Rapido Foto Bambino**
* **User Story:** Come **Operatore sul Campo (ARC-002)**, voglio inviare una foto e un messaggio al bot Telegram indicando il codice del bambino, così da aggiornare la scheda senza dover accedere al pannello web.
* **Acceptance Criteria (AC-101):**
  * **Dato che** sono un operatore autorizzato con Telegram ID censito nel sistema;
  * **Quando** invio al bot la foto di un bambino associando il codice `UG-102` nell'interazione;
  * **Allora** il sistema ridimensiona l'immagine, la salva nello storage e registra un nuovo record `Media` associato al bambino `UG-102`;
  * **E** invia un messaggio di conferma su Telegram con l'ID della foto salvata;
  * **E** se il Telegram ID non è autorizzato, il sistema **nega l'operazione** e restituisce un errore di autorizzazione.

---

### M2: Core Backend & Processing Engine (AI Vision & Validation)

#### **US-201: Parsing Estratto Conto via AI Vision**
* **User Story:** Come **Tesoriere (ARC-001)**, voglio caricare l'estratto conto PDF dell'associazione, così che il sistema estragga automaticamente i dati dei donatori evitando la digitazione manuale.
* **Acceptance Criteria (AC-201):**
  * **Dato che** un file di estratto conto bancario (PDF/immagine) viene caricato nel sistema;
  * **Quando** il servizio di AI Vision processa il documento;
  * **Allora** estrae un array JSON contenente: *Data, Nome Ordinante, Codice Fiscale, Importo, Causale*;
  * **E** applica la regola di validazione algoritmica sul Codice Fiscale (Regex + Checksum);
  * **E** se la somma delle entrate e uscite non quadra con il saldo finale dichiarato nel documento, il sistema segna l'importazione come "Da Revisionare Manualmente" e notifica l'operatore.

---

### M3: Portal Sostenitori (Frontend Web / PWA)

#### **US-301: Accesso Area Riservata Sostenitore**
* **User Story:** Come **Sostenitore (ARC-003)**, voglio accedere con le mie credenziali riservate alla mia dashboard, così da poter vedere gli aggiornamenti del bambino che ho adottato.
* **Acceptance Criteria (AC-301):**
  * **Dato che** sono un sostenitore registrato con un'adozione attiva;
  * **Quando** effettuo il login con successo nella PWA;
  * **Allora** visualizzo la scheda del bambino abbinato con le relative foto e notizie recenti;
  * **E** il sistema **deve negare tassativamente** l'accesso alle schede di bambini o alle donazioni di altri sostenitori;
  * **E** se provo ad accedere a una rotta non autorizzata (es. `/admin`), la richiesta viene bloccata e reindirizzata alla pagina di Login con uno stato HTTP 403.

---

### M4: Bridge Contabile (Integrazione Verifico.it)

#### **US-401: Esportazione Dati per Verifico.it**
* **User Story:** Come **Tesoriere (ARC-001)**, voglio esportare le donazioni verificate in formato CSV/Excel compatibile con *Verifico.it*, così da poter compilare il bilancio d'esercizio senza errori di data-entry.
* **Acceptance Criteria (AC-401):**
  * **Dato che** esistono donazioni approvate e riconciliate nel mese di riferimento;
  * **Quando** seleziono il range di date e clicco su "Esporta per Verifico";
  * **Allora** il sistema genera un file CSV formattato con le colonne: *Data, Categoria Cassa, Causale, Importo, Codice Fiscale*;
  * **E** esclude automaticamente le donazioni con stato "Non Verificato" o con anomalie aperte.

---

## 4. Architettura di Sistema e Diagrammi di Flusso

### 4.1 Flusso dei Dati (Data Flow Diagram)

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
│  (Claude/OAI)│ │ (Relazionale)│ │ Storage      │
└──────────────┘ └──────────────┘ └──────────────┘
                        │
                        ▼ (Esportazione CSV / Bot RPA)
               ┌────────────────┐
               │  VERIFICO.IT   │
               └────────────────┘
```

---

## 5. Modello Dati (Database Relazionale)

### Entità Principali
* `Users` (id, email, password_hash, role [admin|sostenitore|volontario], telegram_id, created_at)
* `Supporters` (id, user_id, first_name, last_name, tax_code, address, phone, notes)
* `Children` (id, code_name, birth_date, location, bio, status [active|completed])
* `Adoptions` (id, supporter_id, child_id, start_date, monthly_amount, status)
* `Donations` (id, supporter_id, adoption_id, amount, donation_date, payment_method, tax_code_extracted, raw_causale, verified)
* `Media` (id, child_id, donation_id, file_path, file_type [photo|pdf|letter], caption, uploaded_by, created_at)

---

## 6. Requisiti Non Funzionali e Stack Tecnologico

* **Stack Tecnologico:**
  * **Frontend:** Angular / Ionic (PWA per utilizzo desktop e mobile).
  * **Backend:** Node.js (Express.js) con Knex.js / TypeORM.
  * **Database:** PostgreSQL o MySQL (compatibilità SQLite per ambienti locali/test).
  * **AI Services:** Vision API (OpenAI GPT-4o / Anthropic Claude 3.5 Sonnet / Google Gemini).
  * **Deployment:** Containerizzazione **Docker & Docker Compose** gestibile su Linux VPS tramite Nginx e certbot (SSL).
* **Privacy & Sicurezza (GDPR):**
  * Controllo granulare degli accessi: ciascun sostenitore può vedere *esclusivamente* i dati e i media del bambino a lui abbinato.
  * Nessun dato bancario sensibile (es. IBAN completo) viene inviato ai modelli AI se non strettamente necessario per la riconciliazione.

---

## 7. Roadmap e Piano di Sviluppo

```
[Settimana 1-2] ──► [Settimana 3-4] ──► [Settimana 5-6] ──► [Settimana 7-8]
  Analisi ER &        Bot Telegram &      AI OCR Parser &     Frontend PWA &
  Setup DB/API        Upload Media        Validation Layer     Bridge Verifico
```