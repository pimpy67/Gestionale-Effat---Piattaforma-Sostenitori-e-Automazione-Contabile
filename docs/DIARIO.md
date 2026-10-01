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

## 24/09/2026 (sera) – Repository pulita e PRD v1.0

**Fatto**
- Repository ripulita: rimossi PRD vecchi, piano di sviluppo e documenti tecnici superati; restano README, `.gitignore`, `docs/PRD.md`, `docs/DIARIO.md`, `docs/bot/TECHNICAL-INTEGRATION.md`. Repository privata.
- Regole del documento: un solo documento (cosa, come, quando nel PRD); il codice segue il PRD; versioni solo quando cambiano le decisioni (1.x per sessione, 2.0 alla consegna, 3.0 alla validazione).
- Nome del prodotto: "Gestionale Effatà – Piattaforma Sostenitori e Automazione Contabile".
- **PRD v1.0** (tag `prd-v1.0`): prima versione condivisa con il docente, capitolo 1 in forma definitiva.

**Decisioni**
- Flusso rovesciato: prima la registrazione, poi l'adozione o la donazione.
- Simpatizzante (chi si registra) → sostenitore (dopo la prima donazione); spazio informativo in fase 2, con collegamenti al sito.
- Donante e avente diritto alla detrazione; causale standard con "erogazione liberale" e codice fiscale.
- Quietanza caricata dal sostenitore → lettera di ringraziamento; conferma all'import trimestrale dell'estratto conto.
- Canali: solo UniCredit e campagne esterne (GoFundMe) imputate alla raccolta fondi.
- VERIF!CO resta il riferimento per contabilità, ricevute e newsletter (invio tramite relay Brevo); le anagrafiche complete vanno dal gestionale a VERIF!CO.
- Sanatoria dei dati pregressi in fase 2. OCR degli estratti conto non previsto (CSV/Excel).

**Prossimi passi**
- Invitare il docente sulla repository e inviare l'email con il link.
- Capitolo 2 (Stakeholder) in forma definitiva, poi i capitoli successivi uno alla volta.
- Blocco 4: copia anonimizzata di `ListaMovimenti.xlsx`; risposte all'Appendice B.

## 29/09/2026 – Capitoli 2 e 3 definitivi, CLAUDE.md aggiunto (v1.1)

**Fatto**
- Capitoli 2 e 3 ripuliti e portati a forma definitiva (senza impalcature e note di revisione).
  - Cap. 2 (Stakeholder): Presidente e amministratore (i due soci fondatori), circa 12 volontari, soci solo i fondatori con intenzione di aprire adesione a pagamento.
  - Cap. 3 (Contesto): tabella con 2 amministratori, ~12 volontari, soci fondatori; quattro archetipi; flusso AS-IS e TO-BE in sette passi.
- Spostamento della descrizione del bot esistente in capitolo 10.1 (architettura).
- Aggiornamento di FR-VER-01 (VERIF!CO Maxi, solo entrate positive).
- Aggiunta di NFR-16 (passaggio di consegne) e rischio "dipendenza da una sola persona" in cap. 19.
- Appendice B: due risposte registrate (versione di VERIF!CO, soci e volontari) e domanda sulle commissioni delle campagne.
- **CLAUDE.md** aggiunto alla radice: regole per Claude Code (no codice prima della validazione PRD, il codice segue il PRD, no modifiche al PRD senza conferma, regole di versioning).
- **PRD v1.1** (tag `prd-v1.1`): capitoli 2 e 3 definitivi.

**Allineamento**
- Repository locale e remoto sincronizzati.
- Descrizione breve per cap. 4 scritta ("in un minuto al presidente").

**Prossimi passi**
- Giovedì: cap. 4 (Panoramica e user flow).
- Venerdì: cap. 5 (User story).
- Consegna del PRD ripulito: venerdì 9 ottobre 2026.

## 01/10/2026 – Revisione delle user story e PRD v1.3

**Fatto**
- Revisione, una alla volta, di tutte le 23 user story (AMM-01…08, VOL-01…03, SOS-01…09, SOC-01…03) con i loro acceptance criteria.
- Prime quattro interviste per i requisiti impliciti (membri dell'associazione): previsionale e andamento, attendibilità dei dati, tempestività, filtri, report e scadenze.
- **PRD v1.3** (tag `prd-v1.3`): capitolo 5 in forma definitiva; NFR-17/18/19 e requisiti impliciti nel capitolo 6; capitolo 1 aggiornato.

**Decisioni**
- Contabilità ufficiale, uscite e fornitori restano in VERIF!CO; certificazioni per la detrazione inviate da VERIF!CO una volta l'anno (fine febbraio–inizio marzo).
- Estratto conto mensile; anagrafiche nuove o modificate verso VERIF!CO già in fase 1; chiusura annuale con scadenza 15 febbraio (FR-VER-03).
- Consenso della famiglia: modulo unico "tutto o niente", una sola casella "modulo caricato"; senza modulo = nessun consenso (FR-CON-01).
- Vetrina riservata agli utenti registrati; credito solidale stessa tipologia e importo, scade dopo 1 mese e va alla casa famiglia Effatà (progetto distinto dalla Cassa sostegno).
- Niente TRN/CRO, suggerito il bonifico istantaneo; proposta di imputazione con l'AI in fase 2.
- Obiettivi annuali per capitolo e andamento mensile in fase 1 (FR-DASH-02); ricerca, filtri, report e scadenze (FR-REP-01/02).

**Aperto**
- Domande nuove in Appendice B (ruoli degli intervistati, modulo di consenso e referente privacy, calendario solidale, previsionale e anagrafiche in VERIF!CO, ID_PROGETTO della casa famiglia, quota associativa).
- Intervista a un sostenitore.

**Prossimi passi**
- Capitolo 4.2: user flow e scenari delle storie ★.
- Capitoli 6–7, poi la seconda parte (8–16) e la terza (17–19). Consegna v2.0: 9 ottobre 2026.

## 01/10/2026 (pomeriggio) – Bot, recupero dei dati e PRD v1.4

**Fatto**
- Letti i codici del bot social (`pimpy67/social_effata`) e del calendario solidale (`pimpy67/calendario-solidale-uganda`).
- Revisione del collegamento bot–gestionale in 10 punti.
- **PRD v1.4** (tag `prd-v1.4`): user flow di AMM-01; nuove storie AMM-09 e VOL-04; decisioni FR-BOT-01…08, FR-COD-01, FR-FOTO-01, FR-COM-02, FR-INT-08, FR-CAN-03, FR-STO-01 in fase 1.

**Decisioni**
- Tutte le donazioni passano dal gestionale; Silvia segnala i bisogni, manda le prove e indirizza i padrini alla vetrina.
- Il bot diventa la porta d'ingresso già in fase 1: un solo caricamento pubblica sui social e alimenta il gestionale tramite API (mai database condiviso). Prima il tipo (richiesta di aiuto, aiuto consegnato, solo social), poi la categoria. Volontari riconosciuti dall'account Telegram collegato con un codice usa e getta.
- Foto: si caricano tutte, poi si scelgono e si ordinano quelle per i social (foglio provini); testi agganciati con didascalia o "Rispondi"; due livelli, pubbliche e riservate al padrino.
- Vetrina: richieste personali (adozioni, operazione, carrozzina, casa, terreni) e voci fisse (materassi, scarpe, animali, opere e sostegno della casa famiglia); consegne delle voci fisse assegnate a chi ha donato prima.
- Non esiste un archivio dei bambini: codici BAM/FAM/RIC generati dal gestionale; padrini importati da VERIF!CO in fase 1, bambini censiti poco alla volta, abbinamenti confermati da Silvia; avvio graduale con un primo villaggio.
- Calendario solidale: resta un sito a sé, card in vetrina, donazioni importate in automatico.

**Aperto**
- Satispay; formato dell'esportazione da VERIF!CO; chat autorizzata attuale del bot (gruppo o privata).
- Sicurezza del calendario: password dell'amministratore impostata sul server, posizione del database e backup.

**Prossimi passi**
- Capitolo 4.2: user flow di AMM-04, AMM-06, VOL-01…03, SOS-03, SOS-04, SOS-07.
- Capitoli 6–7, poi la seconda parte. Consegna v2.0: 9 ottobre 2026.
