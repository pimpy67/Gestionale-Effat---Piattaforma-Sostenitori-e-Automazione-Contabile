# Diario del progetto – Gestionale Effatà

Registro delle sessioni di lavoro sul PRD: decisioni prese, punti aperti, prossimi passi.
Il dettaglio di ogni decisione è nel PRD (`docs/PRD.md`), capitolo 5.7.

---

## 23/09/2026 – Impostazione del PRD e brain dump (v3.0 → v3.3)

**Fatto**
- Analisi della traccia "ScuolaChill" e del PRD Template del docente.
- PRD riorganizzato sullo schema del template (tre parti: il cosa, il come, tempi e valutazione), con doppi titoli e domande del template adattate a Effatà.
- Brain dump iniziale inserito nell'Allegato finale e riordinato per temi (BD.3–BD.5).
- Schede sostenitore, beneficiario e intervento (cap. 5.8).
- Scoperte su VERIF!CO: tracciato master di importazione, IBAN_MITTENTE per abbinare i bonifici, ID_PROGETTO per imputare ai progetti.

## 24/09/2026 – Prime decisioni e blocchi 1–3 della fase 1 (v3.4 → v3.8)

**Numeri e situazione attuale**
- 700–800 sostenitori, circa 1.200 bambini adottati.
- AS-IS: Silvia invia il materiale via WhatsApp → Andrea lo passa al bot Telegram; estratti conto inseriti a mano in VERIF!CO; sostenitori in un gruppo WhatsApp.

**Ruoli e permessi**
- Amministratore (unico con accesso ai dati sensibili), volontario (azioni abilitate dall'amministratore), socio (area dedicata), sostenitore. Referente in Uganda: futuro.

**Adozioni, interventi, visibilità**
- Famiglia con 1..N bambini; un bambino ha un solo sostenitore attivo, con riaffido e storico (FR-ADO-01/02/03).
- Interventi con 1..N finanziatori (FR-INT-01); listino con costo congelato, imputazione dalla causale, Cassa sostegno Effatà, checklist di rendicontazione (FR-INT-02…06).
- Ogni sostenitore vede solo ciò che ha donato; le foto di gruppo sono accettate (FR-VIS-01).

**Accesso e sicurezza**
- Registrazione libera con conferma dell'email; collegamento ai dati storici solo con prova di identità (FR-REG-01/02/03).
- Scadenza per inattività, archiviazione e ripristino configurabili (FR-ACC-01/02/03).
- Password protetta, verifica in due passaggi obbligatoria per amministratori e volontari; conferma delle modifiche a email, IBAN e codice fiscale (FR-SEC-01/02).
- Ricevute fiscali prodotte da VERIF!CO; nell'area riservata riepilogo annuale e "Richiedi copia" (FR-RIC-01).

**Perimetro (confermato nella struttura, in approfondimento)**
- Fase 1: dashboard con ruoli, permessi e vista d'insieme; famiglie, bambini e interventi; rendicontazione; registrazione, area riservata, causale standard e carrello con bonifico; import CSV banca ed export VERIF!CO.
- Fase 2: bot integrato tramite API, pagamento con carta, area soci, scadenza accessi con avvisi, recupero sostenitori storici.
- Futuro: chat, WhatsApp, app sugli store, accesso dall'Uganda, inglese, OCR sui PDF.

**Tecnologia (orientamento, da confermare dopo i requisiti)**
- Ionic + React come PWA; Node.js con NestJS in TypeScript; testi in file di traduzione separati.

**Bot esistente**
- Documentato e verificato sul codice (`docs/bot/TECHNICAL-INTEGRATION.md`).
- Due sistemi indipendenti: il gestionale è proprietario dei dati, il bot dei contenuti social; dialogo solo tramite API con token (cap. 11.5).
- Sicurezza: API del bot protette con token dal 24/09/2026; token esposto in chat → da sostituire.

**Aperto**
- Blocco 4 della fase 1: estratto conto → VERIF!CO. Serve un export UniCredit anonimizzato e la versione di VERIF!CO.
- Domande all'associazione (PRD, Appendice B).
- Calendario ITS (stage, esami) prima di fissare le date delle milestone.

**Prossimi passi**
- Blocco 4, poi passaggio rapido su fase 2 e futuro.
- Dal 1° ottobre: seconda parte del PRD (scelte tecnologiche, architettura, API, dati, sicurezza).
- Consegna del PRD ripulito: venerdì 9 ottobre 2026.
