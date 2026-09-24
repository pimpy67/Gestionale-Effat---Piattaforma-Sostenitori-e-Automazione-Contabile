**Product Requirements Document**

**PRD del Gestionale Effatà**

Piattaforma per Adottanti e Automazione Contabile

*Versione 3 – struttura allineata al PRD Template del docente*

Prima parte · Il cosa   |   Seconda parte · Il come   |   Terza parte · Tempi e valutazione

# Informazioni sul documento

*Origine: unione fra la nostra bozza e il template del prof*

| Campo | Valore |
| --- | --- |
| Prodotto | Gestionale Effatà – Piattaforma per Adottanti e Automazione Contabile |
| Team | ______________ (progetto individuale) |
| Autori | Andrea Pavan |
| Cliente reale | Effatà Italia ODV |
| Contesto | Progetto ITS – 2° anno. Progetto personale che segue la metodologia della traccia “ScuolaChill”. |
| Versione | 3.9 |
| Data | ____ / ____ / ________ |
| Stato | ☐ Bozza   ☐ In revisione   ☐ Validato |

## Storico delle versioni

| Versione | Data | Autore | Cosa è cambiato e perché |
| --- | --- | --- | --- |
| 2.0 |   | Andrea Pavan | Bozza iniziale: visione, archetipi, 4 user story, flusso dati, modello dati, stack, roadmap, change management. |
| 2.1 |   | Andrea Pavan | Versione guidata: sezioni mancanti rispetto alla traccia, note di revisione, spazi di lavoro. |
| 3.0 |   | Andrea Pavan | Riorganizzazione secondo il PRD Template del docente (tre parti), aggiunta delle sezioni nuove del template, doppi titoli. |
| 3.1 |   | Andrea Pavan | Domande ed esempi del template riscritti per Effatà in ogni sezione (riquadri gialli). |
| 3.2 |   | Andrea Pavan | Allegato finale “Brain dump iniziale” con intuizione di partenza e bozza del flusso dei dati; appendici riordinate. |
| 3.3 |   | Andrea Pavan | Brain dump iniziale inserito (BD.3), riordinato per temi (BD.4), punti da approfondire (BD.5); schede sostenitore, beneficiario e intervento (5.8); fonti in Appendice A. |
| 3.4 |   | Andrea Pavan | Prime decisioni: numeri dell’associazione, AS-IS, ruoli e permessi, adozioni e riaffido, interventi con più finanziatori, scadenza e archiviazione degli accessi, scheda famiglia, lingua e file di traduzione. |
| 3.5 |   | Andrea Pavan | Perimetro confermato in tre fasi (cap. 1.3, 17); orientamento tecnologico Ionic + React (PWA) e NestJS (cap. 9); milestone collegate al template; rischio React aggiunto. |
| 3.6 |   | Andrea Pavan | Testo 1.1 (business e tecnico); blocco 1 della fase 1: vista d’insieme, imputazione, checklist di rendicontazione, listino, Cassa sostegno Effatà, causale standard, carrello con bonifico; rendicontazione in fase 1, pagamento con carta in fase 2; perimetro marcato “in approfondimento”. |
| 3.7 |   | Andrea Pavan | Bot esistente (cap. 3.2), due sistemi indipendenti e contratto di integrazione (cap. 10.1, 11.5), dipendenze, dati verso servizi esterni (13.4), orientamento di deploy (16), nuovi rischi (19); date corrette al 24/09/2026. |
| 3.8 |   | Andrea Pavan | Blocchi 2 e 3 della fase 1: visibilità per sostenitore (FR-VIS-01), registrazione e collegamento ai dati storici (FR-REG-01/02/03), ricevute (FR-RIC-01), password e dati critici (FR-SEC-01/02); nuova dipendenza VERIF!CO; domande per l’associazione. |
| 3.9 |   | Andrea Pavan | Gestione delle modifiche riscritta: un solo documento (cosa, come, quando nel PRD, come da template); dopo la validazione il dettaglio tecnico vive nel codice (OpenAPI, migrazioni, configurazioni). Rimossi i riferimenti ai file separati in docs/. |
|   |   |   |   |
|   |   |   |   |

> **🧭 Dal template**
>
> - Il PRD cambierà durante l’anno. Ogni modifica va registrata qui, con la sua ragione. Un PRD che dice una cosa mentre il codice ne fa un’altra è peggio di nessun PRD.

## Gestione delle modifiche (Change Management)

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

> **✔ Regola aggiornata il 24/09/2026**
>
> **Un solo documento.** Con lo schema del template il PRD contiene già il **cosa** (prima parte), il **come** (seconda parte: architettura, API, dati, sicurezza, deployment) e il **quando** (terza parte: milestone). Non esistono file separati per architettura, schema del database, API o timeline: sarebbero copie destinate a divergere.
>
> **Ogni modifica al PRD:** 1) aggiornare il PRD e aggiungere una riga allo storico delle versioni, con il motivo; 2) aggiornare `docs/DIARIO.md`; 3) commit nel formato `update: descrizione (PRD vX.Y)`.
>
> **Dopo la validazione, il “come” di dettaglio vive nel codice**, generato o verificato automaticamente: la specifica OpenAPI/Swagger per le API, le migrazioni per lo schema del database, i file di configurazione e gli script per il deployment, le milestone e le issue di GitHub per i tempi.
>
> **Se codice e PRD divergono**, si decide quale dei due ha ragione: o si corregge il codice, o si aggiorna il PRD con una nuova versione. Un PRD che dice una cosa mentre il codice ne fa un’altra è peggio di nessun PRD (template del docente).

> **📄 Dalla tua bozza v2.0**
>
> **Versione originale (v2.0) – superata dalla regola qui sopra, conservata come riferimento.**
>
> Il PRD è il documento “master” dei requisiti (il COSA). I file in `/docs` descrivono il COME e il QUANDO: TIMELINE.md, SCHEMA_DATABASE.md, API_ENDPOINTS.md, ARCHITETTURA.md, DEPLOYMENT.md, RISCHI.md.
>
> Se cambia il PRD → aggiorna in cascata: nuove user story o AC → TIMELINE, SCHEMA_DATABASE, API_ENDPOINTS, RISCHI; cambio priorità → TIMELINE; cambio dati → SCHEMA_DATABASE e API_ENDPOINTS; cambio architettura o stack → ARCHITETTURA e DEPLOYMENT; nuovo rischio → RISCHI.
>
> Procedura: 1) modifica il PRD e incrementa la versione; 2) aggiorna i file in `/docs` impattati; 3) commit `update: [descrizione] (PRD v2.X)`; 4) notifica → timeline e piano cambiano.
>
> Esempio: aggiungere le notifiche push (nuova US) → +1–2 settimane in TIMELINE, tabelle `notifications` e `notification_subscriptions`, endpoint `POST /notifications/subscribe`, `GET /notifications`, `DELETE /notifications/:id`, scelta WebSocket o Redis Pub/Sub, nuovi rischi su scalabilità e supporto browser.
>
> Ricorda: PRD = cosa fare; docs/ = come e quando. Se il COSA cambia, cambiano anche COME e QUANDO.

# Come usare questo documento

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

Questa versione segue **lo schema del PRD Template del docente**: tre parti (il cosa, il come, tempi e valutazione) con i suoi titoli e le sue tabelle. Tutto il contenuto della nostra bozza è stato mantenuto e spostato nella sezione corrispondente.

### Doppi titoli

Quando il nostro titolo è diverso da quello del template, il titolo del template è riportato **tra parentesi**. Esempio: “Scelte tecnologiche con alternative considerate (Scelte tecnologiche)”. Sotto ogni titolo una riga grigia indica l’origine della sezione: nostra bozza, template del prof, o unione delle due.

### Legenda dei riquadri

> **🧭 Guida – cosa chiede il professore**
>
> - Requisiti della traccia e consigli 💡 del template, con le domande guida.

> **📄 Dalla tua bozza v2.0**
>
> Testo che avevi già scritto nella bozza v2.0.

> **⚠ Nota di revisione**
>
> - Problemi già individuati da correggere.

> **✔ Esempio di riferimento**
>
> Modelli di forma, da non copiare.

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Le domande e gli esempi in corsivo del template del prof, riscritti per Effatà. Sono le parti da sostituire con il tuo testo.

Come dice il template: i riquadri di consiglio vanno **cancellati prima della consegna**, e il testo definitivo sostituisce spazi vuoti e appunti.

## Corrispondenza fra template e questo documento

| Sezione del template | Capitolo qui | Origine |
| --- | --- | --- |
| Informazioni sul documento + Storico versioni | Informazioni sul documento | Unione |
| — (non presente) | Gestione delle modifiche | Nostra |
| Scopo e perimetro | 1. Visione del prodotto e obiettivi | Unione |
| Stakeholder | 2. Stakeholder | Template |
| Destinatari e contesto d’uso | 3. Contesto, assunzioni e archetipi | Unione |
| Panoramica e casi d’uso | 4. Panoramica e casi d’uso | Unione |
| Requisiti funzionali | 5. Requisiti funzionali | Unione |
| Requisiti non funzionali (+ impliciti) | 6. Requisiti non funzionali | Unione |
| Assunzioni, vincoli e dipendenze | 7. Assunzioni, vincoli e dipendenze | Template |
| Stima del carico | 8. Stima del carico | Unione |
| Scelte tecnologiche | 9. Scelte tecnologiche con alternative | Unione |
| Architettura | 10. Area 1 – Fondamenti di architettura | Unione |
| Le API | 11. Area 2 – Progettazione delle API | Unione |
| Persistenza e modello dei dati | 12. Area 3 – Persistenza e modellazione | Unione |
| Sicurezza e integrazione | 13. Area 4 – Sicurezza e integrazione | Unione |
| Qualità architetturale | 14. Area 5 – Qualità architetturale | Unione |
| Dimensionamento e costi | 15. Dimensionamento e costi | Unione |
| Piano di deployment | 16. Piano di deployment | Unione |
| Milestone | 17. Roadmap e MVP | Unione |
| Piano di valutazione | 18. Piano di valutazione | Template |
| — (non presente) | 19. Rischi | Nostra |
| — (non presente) | 20. Preparazione alla validazione | Nostra |
| Acceptance Criteria di questa PRD | 21. Acceptance Criteria di questa PRD | Template |
| — (non presente) | Appendici A, B e Allegato finale (brain dump iniziale) | Nostra |

## Il percorso passo per passo

1. **Brain dump** (Allegato finale, BD.3): a mano, senza ordine. Prima carta e penna, poi ricerca, solo alla fine l’AI.
2. **Numeri e AS-IS dell’associazione** (cap. 3) e **stakeholder** (cap. 2).
3. **Scopo e perimetro** (cap. 1): cosa è incluso e soprattutto cosa non lo è.
4. **User story, decisioni aperte, user flow** (cap. 4–5).
5. **Requisiti non funzionali** con ID e soglie, più l’intervista per i requisiti impliciti (cap. 6).
6. **Assunzioni, vincoli e dipendenze** (cap. 7).
7. **Seconda parte**: carico, scelte tecnologiche, le cinque aree, dimensionamento, deployment (cap. 8–16).
8. **Terza parte**: milestone, piano di valutazione, rischi (cap. 17–19).
9. **Controllo finale** con gli Acceptance Criteria del template (cap. 21) e le domande di validazione (cap. 20).

## Stato di avanzamento

| Cap. | Sezione | Stato iniziale | Fatto |
| --- | --- | --- | --- |
| 1 | Visione del prodotto e obiettivi (Scopo e perimetro) | DA ARRICCHIRE | ☐ |
| 2 | Stakeholder | MANCANTE | ☐ |
| 3 | Contesto, assunzioni e archetipi | PARZIALE | ☐ |
| 4 | Panoramica e casi d’uso | MANCANTE | ☐ |
| 5 | Requisiti funzionali | PARZIALE (4 storie su ~16) | ☐ |
| 6 | Requisiti non funzionali + impliciti | MANCANTE | ☐ |
| 7 | Assunzioni, vincoli e dipendenze | MANCANTE | ☐ |
| 8 | Stima del carico | MANCANTE | ☐ |
| 9 | Scelte tecnologiche | DA RIVEDERE (non deciso) | ☐ |
| 10 | Architettura | PARZIALE | ☐ |
| 11 | Le API | MANCANTE | ☐ |
| 12 | Persistenza e modello dei dati | PARZIALE | ☐ |
| 13 | Sicurezza e integrazione | PARZIALE | ☐ |
| 14 | Qualità architetturale | MANCANTE | ☐ |
| 15 | Dimensionamento e costi | MANCANTE | ☐ |
| 16 | Piano di deployment | PARZIALE | ☐ |
| 17 | Roadmap e MVP (Milestone) | DA RIVEDERE | ☐ |
| 18 | Piano di valutazione | MANCANTE | ☐ |
| 19 | Rischi | MANCANTE | ☐ |
| 20 | Preparazione alla validazione | MANCANTE | ☐ |
| 21 | Acceptance Criteria di questa PRD | DA VERIFICARE A FINE LAVORO | ☐ |

**Indice**

> *Indice: in VS Code usa il pannello **Outline** (Struttura); su GitHub il pulsante dell’indice in alto a destra del file.*

*(In Word: clic destro sull’indice → Aggiorna campo → Aggiorna intero sommario.)*

# Prima parte · Il cosa

*Cosa fa il Gestionale Effatà. Chi legge questa parte deve capire tutto senza sapere cos’è Node.js.*

> **🧭 Dal template**
>
> - Nella prima parte scrivi **cosa** fa il sistema, nella seconda **come** lo costruirai. Tienile separate.
> - Fra gli Acceptance Criteria del template c’è: “La prima parte non contiene scelte tecniche”.

# 1. Visione del prodotto e obiettivi (Scopo e perimetro)

**Stato:** **DA ARRICCHIRE**

*Origine: unione fra la nostra bozza e il template del prof*

## 1.1 Inquadramento e problema (Perché esiste il Gestionale Effatà)

> **📄 Dalla tua bozza v2.0**
>
> L’associazione Effatà Italia ODV gestisce progetti di solidarietà e adozioni a distanza in Uganda. Attualmente la gestione dei dati dei sostenitori, l’invio degli aggiornamenti (foto, certificati, pagelle dei bambini) e la rendicontazione contabile (preparazione dati per il bilancio su Verifico.it) richiedono un intenso lavoro manuale di data-entry e gestione file.

> **🧭 Dal template – due punti di vista, due o tre frasi ciascuno**
>
> - **Dal lato business**: quale problema risolve, e per chi.
> - **Dal lato tecnico**: cosa copre il sistema, in grandi linee (non con quali tecnologie).

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> **Dal lato business.** Quale problema risolve il Gestionale Effatà, e per chi? (Tesoriere, operatori sul campo, sostenitori.) Due o tre frasi.

> **✔ Testo di Andrea – 24/09/2026 (da rileggere)**
>
> **Dal lato business.** Oggi Effatà Italia gestisce con strumenti separati e molto lavoro manuale il rapporto con i propri sostenitori: gli estratti conto vengono inseriti riga per riga in VERIF!CO, i dati dei sostenitori sono spesso incompleti, molti bonifici arrivano senza una registrazione a monte e le foto dall’Uganda passano a mano da WhatsApp al bot. Per questo è difficile collegare ogni donazione al suo beneficiario e dimostrare a chi dona che l’aiuto è arrivato. Il Gestionale Effatà serve agli amministratori e ai volontari, ai 700–800 sostenitori e ai soci, e indirettamente ai circa 1.200 bambini e alle loro famiglie in Uganda: meno lavoro manuale, dati completi e trasparenza verso chi dona.

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> **Dal lato tecnico.** Cosa copre il sistema, in grandi linee? (Anagrafiche, adozioni, foto dal campo, donazioni, ricevute, esportazione contabile.) Due o tre frasi, senza nominare tecnologie.

> **✔ Testo di Andrea – 24/09/2026 (da rileggere)**
>
> **Dal lato tecnico.** Il sistema accompagna il sostenitore dall’iscrizione in poi: raccolta dei dati e del consenso privacy, spazio riservato con lo storico delle proprie donazioni e dei beneficiari, carrello delle donazioni. Riunisce in un unico punto di accesso, per i sostenitori e per l’associazione, informazioni oggi sparse fra il bot e il gestionale contabile, e le smista verso chi deve riceverle. I dati verso VERIF!CO passano con caricamenti massivi invece dell’inserimento a mano, e i dati storici vengono completati. La comunicazione diretta con i beneficiari e il pagamento con carta sono previsti in fasi successive.

## 1.2 Soluzione

> **📄 Dalla tua bozza v2.0**
>
> Un sistema integrato e modulare composto da: 1) Telegram Bot per operatori in Italia/Uganda (caricamento media e lettura estratti conto tramite AI); 2) Backend API Node.js/Express con elaborazione media, AI Vision e validazione; 3) Database relazionale normalizzato (MySQL/PostgreSQL/SQLite); 4) Portal Sostenitori Angular/Ionic web/PWA; 5) Esportazione e bridge contabile verso Verifico.it.

> **⚠ Nota di revisione**
>
> - **Conflitto con il template**: qui compaiono scelte tecniche (Node.js, Express, Angular, Ionic, MySQL). Nella stesura definitiva descrivi i componenti in termini funzionali (“un’area web per i sostenitori”, “un bot di messaggistica per gli operatori”) e sposta le tecnologie nel cap. 9. Il testo originale resta qui come riferimento.
> - Il componente 1 dice che il **bot legge gli estratti conto**, ma in US-201 è il **tesoriere** a caricarli: decidi il canale e rendi coerenti le due parti.
> - Manca il **pannello di amministrazione web**: da dove si creano sostenitori, bambini e adozioni?

## 1.3 Cosa è incluso e cosa non è incluso

*Origine: template del prof – sezione nuova, non presente nella nostra bozza*

> **🧭 Dal template**
>
> - La lista di cosa **non** è incluso è la più preziosa del documento. Ogni riga qui ti evita una settimana di discussioni più avanti.

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> **Cosa è incluso**
>
> • Esempio: gestione di sostenitori, bambini e adozioni da parte dell’Amministratore
>
> • Esempio: caricamento di foto e notizie dei bambini da parte degli operatori sul campo
>
> • …

> *(spazio per appunti)*

> **✔ Perimetro in tre fasi – confermato nella struttura il 24/09/2026, in approfondimento blocco per blocco**
>
> **Fase 1 – primo collaudo (incluso):** Dashboard di gestione con ruoli, permessi, impostazioni e vista d’insieme; schede di famiglie, bambini e interventi con adozioni e riaffido; listino dei costi, imputazione delle entrate e rendicontazione completa con checklist di prove; registrazione del sostenitore con consenso privacy e area riservata base con causale standard e carrello con checkout tramite bonifico; importazione del CSV della banca ed esportazione per VERIF!CO. Copre tutti i requisiti obbligatori della traccia (ruoli con controllo nel backend, CRUD, paginazione, dashboard aggregata, API esterna, HTTPS, OpenAPI/Postman, Dev/Prod, deploy pubblico).
>
> **Fase 2 – entro fine anno (incluso):** Bot integrato con il gestionale; pagamento con carta (es. Stripe, PayPal, Satispay); area soci; scadenza degli accessi con avvisi email; avviso al sostenitore a rendicontazione completata; recupero dei sostenitori storici.
>
> **Futuro (non incluso):** Chat con beneficiari e associazione; integrazione del gruppo WhatsApp; app nativa sugli store; accesso diretto dall’Uganda; interfaccia in inglese; OCR sui PDF degli estratti conto.

> **✔ Dettagli già decisi sul non incluso**
>
> • Caricamento diretto dei dati dall’Uganda da parte di Silvia o di volontari ugandesi (problemi tecnici di accesso a Telegram): obiettivo futuro, che l’architettura non deve impedire.
>
> • Interfaccia in inglese: prevista insieme all’accesso dall’Uganda.

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> **Cosa non è incluso**
>
> • Esempio: il Gestionale Effatà non sostituisce la contabilità ufficiale, che resta in VERIF!CO, né l’invio delle newsletter, che resta su Brevo
>
> • Esempio: non sostituisce Verifico.it per la contabilità, prepara solo i dati
>
> • …

> *(spazio per appunti)*

## 1.4 Obiettivi misurabili

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

> **🧭 Guida**
>
> - Scrivi 3–4 obiettivi misurabili (es. “ridurre da X a Y ore al mese la preparazione dei dati per Verifico”).
> - Questi obiettivi diventano le metriche del **Piano di valutazione** (cap. 18).

> *(spazio per appunti)*

# 2. Stakeholder

**Stato:** **MANCANTE**

*Origine: template del prof – sezione nuova, non presente nella nostra bozza*

> **🧭 Dal template**
>
> - Gli stakeholder non sono solo gli utenti. Sono anche chi approva, chi paga, chi manterrà il sistema. Chiediti chi resterebbe deluso se il sistema non funzionasse.
> - Nel tuo caso c’è uno stakeholder particolare: **i bambini e le loro famiglie**. Non usano il sistema, ma sono i soggetti dei dati più delicati (foto di minori).

| Stakeholder | Cosa fa | Cosa gli interessa | Come lo coinvolgete |
| --- | --- | --- | --- |
| Presidente / consiglio direttivo |   |   |   |
| Tesoriere / amministratore (ARC-001) |   |   |   |
| Operatori sul campo in Uganda (ARC-002) |   |   |   |
| Volontari in Italia |   |   |   |
| Sostenitori / donatori (ARC-003) |   |   |   |
| Bambini e famiglie (soggetti dei dati) |   |   |   |
| Commercialista / chi usa Verifico |   |   |   |
| Docente del corso | Valida il PRD |   | Presentazione e domande |
| Collaudatori reali | Usano il sistema come utenti reali |   | Intervista, collaudo |
| Chi manterrà il sistema dopo il progetto |   |   |   |
| Altri? |   |   |   |

# 3. Contesto, assunzioni e archetipi (Destinatari e contesto d’uso)

**Stato:** **PARZIALE**

*Origine: unione fra la nostra bozza e il template del prof*

## 3.1 I numeri dell’associazione (La scuola che avete immaginato)

> **🧭 Guida**
>
> - Il template chiede di descrivere la scuola immaginata. Tu hai un vantaggio: l’associazione è reale, quindi puoi usare **numeri veri**. Ogni numero con la sua **fonte**.
> - Dal template: questi dati tornano nella stima del carico, quindi scegli numeri che poi userai davvero.

> **⚠ Da verificare**
>
> - Dalle nostre chat sulla newsletter Brevo risultano circa **600 destinatari**: quanti sono sostenitori con adozione attiva, quanti donatori occasionali, quanti solo iscritti alla newsletter?

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Descrivi l’associazione per cui progetti. Che tipo di ente è (ODV, iscritta al RUNTS?), dove opera (sede in Italia, progetti in Uganda), come si organizza il lavoro (chi fa cosa, quando, con quali strumenti). Questi dati tornano nella stima del carico, quindi scegli numeri che poi userai davvero.

> *(spazio per appunti)*

| Grandezza | Valore | Fonte / motivazione |
| --- | --- | --- |
| Sostenitori con adozione a distanza attiva | 700–800 | Dato dell’associazione (settembre 2026) |
| Donatori occasionali (senza adozione) |   |   |
| Iscritti newsletter totali | ~600 (da verificare) | Lista Brevo |
| Bambini adottati in Uganda | ~1.200 | Dato dell’associazione (settembre 2026) |
| Relazione bambino – sostenitore | Un bambino: 1 sostenitore attivo. Un sostenitore: 1..N bambini (media 1,5–1,7) | Deciso (FR-ADO-01) |
| Tutti i bambini hanno un sostenitore? |   | Da chiedere |
| Famiglie seguite (una famiglia ha 1..N bambini) |   | Da chiedere |
| Interventi non di adozione all’anno (casette, animali, materassi, operazioni…) |   | Da chiedere |
| Amministratori / tesorieri |   |   |
| Volontari in Italia |   |   |
| Operatori sul campo in Uganda | Silvia (referente); oggi invia il materiale via WhatsApp | Brain dump |
| Donazioni ricevute al mese (media / picco, es. dicembre) |   |   |
| Foto e documenti caricati al mese |   |   |
| Estratti conto elaborati al mese (quante pagine?) |   |   |
| Newsletter inviate all’anno |   |   |
| Età media stimata dei sostenitori |   |   |
| Anni di storico da importare |   |   |
| Orari d’uso (Orario scolastico) – e differenza di fuso con l’Uganda | es. tesoriere la sera 20–22; operatori 8–17 ora locale (+1/+2 h rispetto all’Italia) |   |
| Connettività (Italia / Uganda) | es. fibra o 4G in Italia; rete mobile 3G/4G instabile in Uganda |   |

## 3.2 Come si lavora oggi (situazione AS-IS)

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

> **✔ Sistema esistente: il bot social di Effatà (bot.effataitalia.it)**
>
> Sviluppato da Andrea e in produzione. **Funzioni:** riceve foto e testi da Telegram, genera con l’AI i testi per Facebook, Instagram, LinkedIn, blog, Reel e YouTube Shorts, pubblica su Facebook e Instagram tramite le API di Meta, modera i commenti, offre una dashboard web e report mensili.
>
> **Tecnologie:** Node.js + Express; database SQLite e file su disco; Docker Compose su server Hostinger, con Traefik e certificati Let’s Encrypt per l’HTTPS; test automatici con Jest.
>
> **Dati oggi:** foto e testi in `/output/` e in `effata.db` (tabelle `drafts`, `meta_publications`, `moderation_queue`, `promotions`); i dati di bambini e sostenitori non hanno una struttura propria. SQLite non è cifrato.
>
> **Sicurezza:** dal 24/09/2026 le API `/api/*` richiedono un token (prima erano esposte senza autenticazione); la dashboard è protetta con Basic Auth; i webhook Meta sono verificati con firma.
>
> Documentazione tecnica di riferimento: `docs/bot/TECHNICAL-INTEGRATION.md`, verificata sul codice.

> **✔ Emerso dal brain dump**
>
> **Foto e storie:** ogni sera Silvia, in Uganda, invia via **WhatsApp** le foto della giornata (nuove adozioni, consegne di materassi, animali, casette). Non usa Telegram per motivi tecnici. La sera Andrea seleziona foto e informazioni e le passa al **bot Telegram** esistente, che genera i testi per i social e archivia i dati di bambini, riceventi e sostenitori.
>
> **Contabilità:** gli estratti conto vengono inseriti **a mano, riga per riga**, in VERIF!CO, passando dall’anagrafica alla contabilità. Le ricevute per la detrazione le invia VERIF!CO in automatico.
>
> **Sostenitori:** comunicano con l’associazione in un **gruppo WhatsApp chiuso**; i loro dati in VERIF!CO sono spesso incompleti. Molti chiamano Silvia, avviano l’adozione e fanno il bonifico senza registrarsi: i dati vanno recuperati dopo.

- Dove sono oggi i dati dei sostenitori (Excel, carta, email, WordPress)?
- Come arrivano oggi le foto dall’Uganda e come vengono inviate ai sostenitori?
- Quante ore al mese richiede oggi la preparazione dei dati per Verifico.it?
- Come vengono prodotte oggi le ricevute per la detrazione fiscale?

**✎ Appunti / risposte**

> *(spazio per appunti)*

## 3.3 Archetipi utente (Gli archetipi)

> **📄 Dalla tua bozza v2.0**
>
> **ARC-001 Amministratore / Tesoriere** – da desktop, valida donazioni, esporta per Verifico, gestisce gli abbinamenti. Competenze medio-alte. Uso settimanale/mensile.
>
> **ARC-002 Operatore sul campo / Volontario** – da smartphone, connettività limitata in Uganda, carica foto e notizie. Competenze base/intermedie (usa Telegram). Uso quotidiano/eventuale.
>
> **ARC-003 Sostenitore / Donatore** – da smartphone o PC, consulta l’adozione, scarica ricevute, guarda foto. Competenze base. Uso sporadico.

> **✔ Deciso il 24/09/2026 – ruoli nel sistema**
>
> **Amministratore:** gestisce tutto, è l’unico che vede i dati sensibili, configura regole e permessi dalla dashboard di gestione.
>
> **Volontario:** vede le informazioni non sensibili e fa solo le azioni abilitate dall’amministratore (es. caricare dati e foto, rispondere alle chat). Oggi il volontario che usa il bot è Andrea.
>
> **Socio:** ha un’area dedicata (quota, convocazioni, verbali, bilanci).
>
> **Sostenitore:** vede solo i propri beneficiari, donazioni e documenti.
>
> Una persona può avere **più ruoli** insieme. **Referente in Uganda:** ruolo futuro, non incluso ora.

Tabella nel formato del template (la colonna **Dispositivo principale** è nuova):

| ID | Archetipo | Contesto d’uso | Competenze digitali | Dispositivo principale | Frequenza d’uso |
| --- | --- | --- | --- | --- | --- |
| ARC-001 | Amministratore / Tesoriere | Validazione donazioni, export Verifico, abbinamenti | Medio-alte | es. PC in sede o a casa | Settimanale / mensile |
| ARC-002 | Operatore sul campo / Volontario | Mobilità, connessione limitata in Uganda, foto e notizie | Base / intermedie | es. smartphone Android | Quotidiana / eventuale |
| ARC-003 | Sostenitore / Donatore | Stato adozione, ricevute, foto | Base | es. smartphone, dal link della newsletter | Sporadica (1–2 volte al mese) |
| ARC-004? |   |   |   |   |   |

> **⚠ Nota di revisione**
>
> - **ARC-002 unisce due persone diverse**: volontario in Italia e operatore in Uganda hanno lingua, dispositivo, connessione e permessi diversi. Valuta di separarli (ARC-004).
> - L’operatore in Uganda probabilmente parla **inglese**: il bot deve essere in inglese? È un requisito da dichiarare.
> - Amministratore e tesoriere sono sempre la stessa persona? Se no, servono due ruoli.
> - Dal template: chi sono i collaudatori veri e che dispositivo usano? La risposta cambia interfaccia, usabilità e dimensionamento.

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> I collaudatori veri chi sono? Il tesoriere usa il PC in sede o a casa la sera? Il sostenitore apre la newsletter dallo smartphone e tocca il link? L’operatore carica le foto da un villaggio con rete debole? La risposta cambia l’interfaccia, i requisiti di usabilità e perfino il dimensionamento.

| Domanda di arricchimento | ARC-001 | ARC-002 | ARC-003 |
| --- | --- | --- | --- |
| Età e dimestichezza reale |   |   |   |
| Lingua |   |   |   |
| Obiettivo principale in una frase |   |   |   |
| Frustrazione principale oggi |   |   |   |
| Chi collauderà questo ruolo |   |   |   |

# 4. Panoramica e casi d’uso

**Stato:** **MANCANTE**

*Origine: unione fra la nostra bozza e il template del prof*

## 4.1 Il Gestionale Effatà in poche righe

*Origine: template del prof – sezione nuova, non presente nella nostra bozza*

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Racconta il Gestionale Effatà come lo spiegheresti al presidente dell’associazione in un minuto. Niente termini tecnici.

> *(spazio per appunti)*

## 4.2 User flow e scenari

> **🧭 Dal template – attenzione, è più esigente della nostra bozza**
>
> - Per **ogni ruolo** servono **almeno tre** storie principali, ciascuna con: user flow (passi numerati), scenario principale (con un personaggio e una situazione concreta), scenari alternativi (cosa succede quando qualcosa va storto).
> - Nel tuo dominio gli scenari alternativi naturali sono: connessione che cade in Uganda durante l’upload, codice bambino sbagliato, estratto conto che non quadra, sostenitore che dimentica la password.

> **✔ Modello di forma (dalla nostra bozza)**
>
> Flow US-101: 1) l’operatore apre la chat con il bot → 2) invia la foto → 3) il bot chiede il codice bambino → 4) l’operatore scrive `UG-102` → 5) il bot mostra nome e foto profilo per conferma → 6) conferma → 7) messaggio “Foto salvata”.
>
> Scenario alternativo: al passo 4 il codice non esiste → il bot risponde “Codice non trovato” e richiede il codice senza perdere la foto.

### Operatore sul campo (ARC-002)

| Voce | Contenuto |
| --- | --- |
| **Storia (ID e titolo)** | US-101 · Upload rapido foto bambino |
| **User flow (passi numerati)** | *es. 1. L’operatore apre la chat con il bot  2. Invia la foto  3. Scrive il codice del bambino  4. …* |
| **Scenario principale** | *Racconta il caso in cui tutto va bene, con un personaggio e una situazione concreta (es. un operatore che dopo la visita al villaggio manda le foto di tre bambini).* |
| **Scenari alternativi** | *Cosa succede quando qualcosa va storto? Connessione che cade a metà invio, codice bambino sbagliato, stessa foto mandata due volte…* |

| Voce | Contenuto |
| --- | --- |
| **Storia (ID e titolo)** | es. invio di una notizia testuale o di una pagella |
| **User flow (passi numerati)** | *es. 1. L’operatore apre la chat con il bot  2. Invia la foto  3. Scrive il codice del bambino  4. …* |
| **Scenario principale** | *Racconta il caso in cui tutto va bene, con un personaggio e una situazione concreta (es. un operatore che dopo la visita al villaggio manda le foto di tre bambini).* |
| **Scenari alternativi** | *Cosa succede quando qualcosa va storto? Connessione che cade a metà invio, codice bambino sbagliato, stessa foto mandata due volte…* |

| Voce | Contenuto |
| --- | --- |
| **Storia (ID e titolo)** |   |
| **User flow (passi numerati)** | *es. 1. L’operatore apre la chat con il bot  2. Invia la foto  3. Scrive il codice del bambino  4. …* |
| **Scenario principale** | *Racconta il caso in cui tutto va bene, con un personaggio e una situazione concreta (es. un operatore che dopo la visita al villaggio manda le foto di tre bambini).* |
| **Scenari alternativi** | *Cosa succede quando qualcosa va storto? Connessione che cade a metà invio, codice bambino sbagliato, stessa foto mandata due volte…* |

### Tesoriere / Amministratore (ARC-001)

| Voce | Contenuto |
| --- | --- |
| **Storia (ID e titolo)** | US-201 + US-202 · Importazione e conferma estratto conto |
| **User flow (passi numerati)** | *es. 1. Il tesoriere accede al pannello  2. Carica l’estratto conto del mese  3. Controlla le righe estratte  4. …* |
| **Scenario principale** | *Racconta il caso in cui tutto va bene (es. il tesoriere a fine mese importa l’estratto e conferma 40 donazioni in dieci minuti).* |
| **Scenari alternativi** | *Cosa succede quando qualcosa va storto? Saldo che non quadra, donatore non riconosciuto, AI non disponibile, estratto già caricato…* |

| Voce | Contenuto |
| --- | --- |
| **Storia (ID e titolo)** | es. US-401 · Esportazione per Verifico |
| **User flow (passi numerati)** | *es. 1. Il tesoriere accede al pannello  2. Carica l’estratto conto del mese  3. Controlla le righe estratte  4. …* |
| **Scenario principale** | *Racconta il caso in cui tutto va bene (es. il tesoriere a fine mese importa l’estratto e conferma 40 donazioni in dieci minuti).* |
| **Scenari alternativi** | *Cosa succede quando qualcosa va storto? Saldo che non quadra, donatore non riconosciuto, AI non disponibile, estratto già caricato…* |

| Voce | Contenuto |
| --- | --- |
| **Storia (ID e titolo)** | es. US-503 · Abbinare sostenitore e bambino |
| **User flow (passi numerati)** | *es. 1. Il tesoriere accede al pannello  2. Carica l’estratto conto del mese  3. Controlla le righe estratte  4. …* |
| **Scenario principale** | *Racconta il caso in cui tutto va bene (es. il tesoriere a fine mese importa l’estratto e conferma 40 donazioni in dieci minuti).* |
| **Scenari alternativi** | *Cosa succede quando qualcosa va storto? Saldo che non quadra, donatore non riconosciuto, AI non disponibile, estratto già caricato…* |

### Sostenitore (ARC-003)

| Voce | Contenuto |
| --- | --- |
| **Storia (ID e titolo)** | US-301 · Accesso area riservata |
| **User flow (passi numerati)** | *es. 1. Il sostenitore riceve la newsletter  2. Tocca “Vedi le nuove foto”  3. Fa il login  4. …* |
| **Scenario principale** | *Racconta il caso in cui tutto va bene, con un personaggio concreto (es. una sostenitrice di 65 anni che apre le foto dal telefono).* |
| **Scenari alternativi** | *Cosa succede quando qualcosa va storto? Password dimenticata, adozione chiusa, link aperto su un altro dispositivo, tentativo di vedere un altro bambino…* |

| Voce | Contenuto |
| --- | --- |
| **Storia (ID e titolo)** | es. US-302 · Scaricare la ricevuta fiscale |
| **User flow (passi numerati)** | *es. 1. Il sostenitore riceve la newsletter  2. Tocca “Vedi le nuove foto”  3. Fa il login  4. …* |
| **Scenario principale** | *Racconta il caso in cui tutto va bene, con un personaggio concreto (es. una sostenitrice di 65 anni che apre le foto dal telefono).* |
| **Scenari alternativi** | *Cosa succede quando qualcosa va storto? Password dimenticata, adozione chiusa, link aperto su un altro dispositivo, tentativo di vedere un altro bambino…* |

| Voce | Contenuto |
| --- | --- |
| **Storia (ID e titolo)** | es. US-303 · Storico delle mie donazioni |
| **User flow (passi numerati)** | *es. 1. Il sostenitore riceve la newsletter  2. Tocca “Vedi le nuove foto”  3. Fa il login  4. …* |
| **Scenario principale** | *Racconta il caso in cui tutto va bene, con un personaggio concreto (es. una sostenitrice di 65 anni che apre le foto dal telefono).* |
| **Scenari alternativi** | *Cosa succede quando qualcosa va storto? Password dimenticata, adozione chiusa, link aperto su un altro dispositivo, tentativo di vedere un altro bambino…* |

# 5. Requisiti funzionali: user story e acceptance criteria (Requisiti funzionali)

**Stato:** **DA RIVEDERE**

*Origine: unione fra la nostra bozza e il template del prof*

> **🧭 Guida – cosa chiede il professore**
>
> - Formula: **Come** [utente] **voglio** [azione] **così da** [beneficio]. AC nel formato **Dato che / Quando / Allora**.
> - La traccia dà 3 storie per ruolo con 2–3 AC ciascuna, e almeno un AC per storia riguarda ciò che **viene negato**.
> - Un AC per ogni condizione: separa le verifiche in AC-01, AC-02, AC-03.
> - Dal template: gli AC sono il minimo, puoi aggiungerne, non toglierne.

## 5.1 Riepilogo delle user story (Le user story della traccia)

Le storie della traccia ScuolaChill non si applicano al tuo dominio: al loro posto la tabella riepiloga le **tue** storie, nel formato del template.

| ID | Storia | AC aggiunti | Note |
| --- | --- | --- | --- |
| US-101 | Upload rapido foto bambino |   | Presente in bozza |
| US-201 | Parsing estratto conto via AI Vision |   | Presente in bozza |
| US-202 | Revisione e conferma importazione |   | Da scrivere |
| US-203 | Abbinamento donazione ↔ sostenitore |   | Da scrivere |
| US-204 | Importazione duplicata |   | Da scrivere |
| US-301 | Accesso area riservata sostenitore |   | Presente in bozza |
| US-302 | Scaricare le ricevute fiscali |   | Da scrivere |
| US-303 | Storico delle mie donazioni |   | Da scrivere |
| US-304 | Primo accesso e recupero password |   | Da scrivere |
| US-401 | Esportazione dati per Verifico.it |   | Presente in bozza |
| US-501 | Creare / modificare un sostenitore |   | Da scrivere |
| US-502 | Creare / modificare la scheda di un bambino |   | Da scrivere |
| US-503 | Abbinare sostenitore e bambino |   | Da scrivere |
| US-504 | Censire un operatore Telegram |   | Da scrivere |
| US-505 | Dashboard amministratore |   | Da scrivere |

## 5.2 M1 – Telegram Bot operativo

### US-101 – Upload rapido foto bambino

> **📄 Dalla tua bozza v2.0**
>
> Come Operatore sul campo (ARC-002) voglio inviare una foto e un messaggio al bot Telegram indicando il codice del bambino, così da aggiornare la scheda senza accedere al pannello web.
>
> AC: Dato che sono un operatore autorizzato con Telegram ID censito; Quando invio la foto associando il codice `UG-102`; Allora il sistema ridimensiona l’immagine, la salva nello storage e registra un record `Media` associato a `UG-102`; E invia conferma con l’ID della foto; E se il Telegram ID non è autorizzato l’operazione viene negata con errore di autorizzazione.

> **⚠ Da aggiungere**
>
> - Codice bambino **inesistente** o bambino con stato `completed`?
> - File non immagine o troppo grande?
> - La foto è **subito visibile** al sostenitore o passa da un’approvazione? (Foto sbagliate o inopportune di un minore.)
> - Connessione instabile: la stessa foto arriva due volte?

**✎ Appunti / risposte**

> *(spazio per appunti)*

## 5.3 M2 – Elaborazione estratti conto (AI Vision)

### US-201 – Parsing estratto conto via AI Vision

> **📄 Dalla tua bozza v2.0**
>
> Come Tesoriere (ARC-001) voglio caricare l’estratto conto PDF dell’associazione, così che il sistema estragga automaticamente i dati dei donatori evitando la digitazione manuale.
>
> AC: Dato che un estratto (PDF/immagine) viene caricato; Quando l’AI Vision lo processa; Allora estrae un array JSON con Data, Nome ordinante, Codice fiscale, Importo, Causale; E valida il codice fiscale (regex + checksum); E se entrate e uscite non quadrano con il saldo finale l’importazione diventa “Da revisionare manualmente” e l’operatore viene notificato.

> **⚠ Nota di revisione**
>
> - **Assunzione da verificare subito**: negli estratti conto italiani il codice fiscale dell’ordinante di un bonifico di norma non compare. Controlla un estratto reale di Effatà. Se manca, l’abbinamento va fatto in altro modo (nome, IBAN ordinante, codice nella causale…). Va anche in **Assunzioni** (cap. 7).
> - L’output dell’AI non deve mai diventare direttamente una donazione “verificata”: serve la **conferma del tesoriere** (US-202).
> - La verifica del saldo è ottima: è il controllo che rende affidabile l’AI. Tienila.

### Storie da scrivere per M2

| ID | Titolo | Domanda chiave da risolvere negli AC |
| --- | --- | --- |
| US-202 | Revisione e conferma importazione | Il tesoriere può correggere una riga? Chi conferma, e cosa succede alle righe scartate? |
| US-203 | Abbinamento donazione ↔ sostenitore | Come si abbina se il donatore non è riconosciuto? Si crea un nuovo sostenitore? |
| US-204 | Importazione duplicata | Stesso estratto caricato due volte? (AC negativo) |

## 5.4 M3 – Portale sostenitori

### US-301 – Accesso area riservata sostenitore

> **📄 Dalla tua bozza v2.0**
>
> Come Sostenitore (ARC-003) voglio accedere con le mie credenziali riservate alla mia dashboard, così da vedere gli aggiornamenti del bambino che ho adottato.
>
> AC: Dato che sono registrato con un’adozione attiva; Quando effettuo il login nella PWA; Allora vedo la scheda del bambino con foto e notizie recenti; E il sistema nega tassativamente l’accesso a bambini o donazioni di altri sostenitori; E una rotta non autorizzata (es. `/admin`) viene bloccata e reindirizzata al login con HTTP 403.

> **⚠ Nota di revisione**
>
> - L’ultimo AC mescola due livelli: il **backend** risponde con un codice HTTP, il **frontend** decide se reindirizzare. **401** se non sei autenticato, **403** se sei autenticato ma non hai il permesso.

> **✔ Esempio di riscrittura dell’AC**
>
> AC-03 · Dato che sono autenticato come Sostenitore, Quando richiedo all’API la scheda di un bambino non abbinato a me, Allora ricevo 403 e nessun dato del bambino.
>
> AC-04 · Dato che non sono autenticato, Quando richiedo una risorsa riservata, Allora ricevo 401 e il frontend mi porta alla pagina di login.

### Storie da scrivere per M3

| ID | Titolo | Domanda chiave da risolvere negli AC |
| --- | --- | --- |
| US-302 | Scaricare le ricevute fiscali | Per quale anno? Chi le genera e quando? Posso scaricare quella di un altro? (negato) |
| US-303 | Storico delle mie donazioni | Paginato? Raggruppato per anno? Mostra anche quelle non ancora verificate? |
| US-304 | Primo accesso e recupero password | Come riceve le credenziali il sostenitore? (API email esterna) |

## 5.5 M4 – Bridge contabile Verifico.it

### US-401 – Esportazione dati per Verifico.it

> **📄 Dalla tua bozza v2.0**
>
> Come Tesoriere (ARC-001) voglio esportare le donazioni verificate in formato CSV/Excel compatibile con Verifico.it, così da compilare il bilancio d’esercizio senza errori di data-entry.
>
> AC: Dato che esistono donazioni approvate e riconciliate nel mese; Quando seleziono il range di date e clicco “Esporta per Verifico”; Allora il sistema genera un CSV con Data, Categoria cassa, Causale, Importo, Codice fiscale; E esclude le donazioni “Non verificato” o con anomalie aperte.

> **⚠ Da verificare**
>
> - Verifico.it ha un **formato di importazione documentato**? Le colonne del CSV devono coincidere esattamente. (Va fra le **Dipendenze**, cap. 7.)
> - Nel diagramma compare un “Bot RPA” verso Verifico: automatizzare un sito senza API è fragile. Se il CSV basta, eliminalo.
> - Aggiungi un AC negativo: chi non è tesoriere tenta l’esportazione → negato.

## 5.6 M5 – Gestione anagrafiche (modulo mancante)

> **🧭 Guida**
>
> - È l’equivalente di DIR-01/02/03 della traccia: senza queste storie non esistono né sostenitori, né bambini, né abbinamenti.
> - Ispirati a DIR-03 AC-03: abbinare un bambino che ha già un sostenitore? Il sistema lo impedisce o lo gestisce esplicitamente? Diventa una **decisione aperta** (5.7).

| ID | Titolo | Domanda chiave da risolvere negli AC |
| --- | --- | --- |
| US-501 | Creare / modificare un sostenitore | Email duplicata? Campi obbligatori? Sostenitore senza account? |
| US-502 | Creare / modificare la scheda di un bambino | Quali dati di un minore sono davvero necessari? Chi li vede? |
| US-503 | Abbinare sostenitore e bambino (adozione) | Abbinamenti multipli? Chiusura adozione? Storico? |
| US-504 | Censire un operatore Telegram | Come si collega un Telegram ID a un utente? Come si revoca? |
| US-505 | Dashboard amministratore | Quali dati aggregati? Elenchi paginati? (equivalente di DIR-04) |

> **⚠ Attenzione alla numerazione**
>
> - L’esempio del Change Management usa “US-502 Notifiche push”: cambia l’ID dell’esempio per evitare confusione.

## 5.7 Decisioni aperte (Le decisioni lasciate aperte dalla traccia)

*Origine: template del prof – sezione nuova, non presente nella nostra bozza*

> **🧭 Dal template**
>
> - Ogni scelta lasciata aperta diventa un requisito con il suo ID, in questo formato:
> - **FR-[AREA]-[NN] · [Titolo]** (collegato a ID della storia). Cosa avete deciso, in modo verificabile. **Motivazione:** perché avete scelto così.
> - I punti del template (scala dei voti, trasferimento fra classi, verifica dopo lo svolgimento) sono specifici della scuola: qui sotto trovi gli **equivalenti nel tuo dominio**.

> **✔ Modello di forma**
>
> **FR-ADO-01 · Un bambino, più sostenitori** (collegato a US-503). Un bambino può avere al massimo N sostenitori attivi contemporaneamente; oltre, il sistema rifiuta l’abbinamento con errore esplicito. **Motivazione:** …

- [ ] Approvazione delle foto prima che il sostenitore le veda (US-101).
- [ ] Un bambino con più sostenitori, un sostenitore con più bambini (US-503).
- [ ] Chiusura di un’adozione: cosa resta visibile al sostenitore (US-503).
- [ ] Donatore non riconosciuto in un estratto conto (US-203).
- [ ] Estratto conto caricato due volte (US-204).
- [ ] Connessione che cade durante l’upload dal campo (US-101) – equivalente di “connessione che cade durante una verifica”.
- [ ] Fallimento del servizio esterno: AI non disponibile, email delle credenziali non inviata (US-201, US-304).
- [ ] Cancellazione di un sostenitore e diritto all’oblio GDPR (US-501).
- [ ] Lingua del bot e dell’area sostenitori.
- [ ] Foto di gruppo: regola operativa per il caricamento (nelle foto possono comparire altri membri della famiglia; il consenso sulla scheda famiglia deve coprire tutti i minori).
- [ ] Altre decisioni scoperte durante il lavoro.

### Decisioni già prese

> **✔ Deciso il 24/09/2026**
>
> **FR-ADO-01 · Un bambino, un solo sostenitore attivo** (US-503). Un bambino può avere nel tempo più adozioni, ma al massimo una attiva. Per riaffidarlo l’amministratore chiude l’adozione (data di fine e motivo) e ne apre una nuova; un tentativo di aprire una seconda adozione attiva viene impedito con errore esplicito. Motivazione: quando un sostenitore interrompe, il bambino viene riaffidato; lo storico serve a rendicontazione e ricevute.
>
> **FR-ADO-02 · Cosa passa con il riaffido** (US-503, US-301). Il nuovo sostenitore vede tutto lo storico del bambino (foto, pagelle, notizie) e nessun dato del sostenitore precedente (identità, donazioni, lettere, ricevute, messaggi). Motivazione: continuità per il bambino, riservatezza per il sostenitore (GDPR).
>
> **FR-ADO-03 · Cosa vede il sostenitore dopo il riaffido** (US-503, US-301). Il vecchio sostenitore vede le informazioni del bambino e le proprie fino alla data di chiusura, nulla di successivo.
>
> **FR-INT-01 · Finanziatori di un intervento** (US-503). Un intervento ha uno o più finanziatori, ciascuno con la propria quota; la somma delle quote non supera il costo. Nel caso normale c’è un solo finanziatore. Motivazione: prevedere subito il caso multiplo evita migrazioni del modello dati.
>
> **FR-ACC-01 · Scadenza dell’accesso per inattività** (US-301, US-304). Senza transazioni economiche per un periodo configurabile (predefinito 12 mesi) l’accesso viene disattivato, con avvisi email nei giorni configurati.
>
> **FR-ACC-02 · Archiviazione e ripristino.** L’account scaduto passa allo stato archiviato: niente accesso, dati conservati, ripristinabile con tutto lo storico. Tempo massimo di archiviazione da definire (cap. 13.4).
>
> **FR-ACC-03 · Impostazioni dell’accesso** (US-505). Dalla dashboard di gestione l’amministratore configura periodo di inattività, avvisi e modalità di ripristino (manuale o automatico al nuovo bonifico). Gli altri ruoli ricevono un diniego.
>
> **FR-RUO-01 · Permessi dei volontari.** Il volontario vede le informazioni non sensibili ed esegue solo le azioni abilitate dall’amministratore; le altre vengono negate dal backend con 403.
>
> **FR-RUO-02 · Dati sensibili solo all’amministratore.** Dati bancari e fiscali, dati sanitari, chat private e documenti di consenso sono accessibili solo agli amministratori; la regola non è configurabile. Motivazione: minimizzazione GDPR.
>
> **FR-RUO-03 · Area soci** (modulo M6). Il socio vede stato della quota, convocazioni, verbali e bilanci; chi non è socio riceve un diniego.
>
> **FR-DASH-01 · Vista d’insieme.** La dashboard mostra: sostenitori (attivi, archiviati, in scadenza); bambini con e senza sostenitore; donazioni del periodo; entrate non abbinate o non imputate; totale della Cassa sostegno Effatà; interventi per tipo e per stato (finanziati, realizzati, rendicontati) con i documenti mancanti. Ogni numero si apre in un elenco paginato.
>
> **FR-INT-02 · Imputazione delle entrate.** Ogni entrata confermata dall’estratto conto va imputata a un capitolo di progetto (adozioni, casetta, affitto, animali, operazione, sedia a rotelle…) e, dove previsto, a un intervento, che diventa una “cosa da fare”. Il capitolo può corrispondere all’ID_PROGETTO di VERIF!CO.
>
> **FR-INT-03 · Checklist di rendicontazione per tipo.** Ogni tipo di intervento ha un elenco di prove di realizzazione richieste, configurabile dall’amministratore: foto della consegna per materassi, scarpe e animali; iscrizione e foto per le adozioni; foto, contratto e fattura dove esistono, come per la casetta. Un intervento è “rendicontato” solo con tutte le prove caricate, che diventano visibili al donante nella sua area riservata.
>
> **FR-INT-04 · Costo dichiarato dell’intervento.** Ogni tipo di intervento ha un costo standard in un listino configurabile. La spesa coincide con il costo dichiarato e finanziato dal donante; non si registrano fatture di spesa. Il costo viene congelato nell’intervento al momento del finanziamento.
>
> **FR-INT-05 · Donazioni generiche.** Un’entrata senza destinazione specifica va nel capitolo “Cassa sostegno Effatà”, senza creare interventi.
>
> **FR-INT-06 · Imputazione guidata dalla causale.** La parte dell’entrata che corrisponde a interventi riconoscibili dalla causale (tipo e quantità secondo il listino) viene imputata a quegli interventi; tutto ciò che non corrisponde va in Cassa sostegno Effatà. L’AI può proporre l’imputazione leggendo la causale, ma l’amministratore conferma sempre. Esempio: 25 € con causale “materassi” → 2 materassi da 10 € + 5 € in cassa.
>
> **FR-SOS-01 · Causale standard.** Nell’area riservata il sostenitore trova la causale già compilata da copiare nel bonifico (es. `ADOZIONE UG-102`, `MATERASSI 2 FAM-045`).
>
> **FR-SOS-02 · Carrello solidale.** Il sostenitore sceglie interventi dal listino e li mette nel carrello; il checkout tramite bonifico crea un impegno e mostra IBAN e causale standard; il bonifico, quando arriva, viene abbinato all’impegno. L’adozione compare come “richiesta di adozione”, il bambino lo abbina l’amministratore. Il pagamento con carta è previsto in fase 2.
>
> **FR-VIS-01 · Ogni sostenitore vede solo ciò che ha donato** (US-301, FR-INT-01). Una famiglia o un beneficiario può ricevere da più sostenitori, ma ognuno vede solo le adozioni e gli interventi che ha finanziato, con foto, prove e documenti. Nelle foto possono comparire altri membri della famiglia (accettato); non vede le schede degli altri bambini, gli altri interventi, né donazioni e identità degli altri sostenitori. Negli interventi con più finanziatori vede la propria quota e lo stato, non gli altri finanziatori. Una richiesta API su dati non propri riceve 403.
>
> **FR-REG-01 · Registrazione libera.** Chiunque può registrarsi come sostenitore (anche dal menu di effataitalia.it) con consenso privacy (casella non preselezionata, data e versione dell’informativa salvate) e conferma dell’email; dopo la conferma l’account è attivo subito. Limite ai tentativi ripetuti contro le registrazioni automatiche.
>
> **FR-REG-02 · Disattivazione da parte dell’amministratore.** L’amministratore può disattivare o archiviare un account in qualsiasi momento, con le regole di FR-ACC-02.
>
> **FR-REG-03 · Collegamento ai dati storici.** Un nuovo account viene collegato a un sostenitore già esistente solo con una prova di identità: email verificata coincidente con quella in archivio, codice di invito monouso inviato ai contatti già noti, conferma dell’amministratore su un canale già in archivio, oppure bonifico con codice da un IBAN già noto. Mai sulla sola base di codice fiscale, nome o IBAN inseriti dall’utente. Principio: questi dati identificano una persona ma non dimostrano che sei tu.
>
> **FR-RIC-01 · Ricevute fiscali** (ex US-302). Le ricevute restano prodotte e inviate da VERIF!CO. Nell’area riservata: riepilogo annuale delle donazioni (non valido ai fini fiscali) e pulsante “Richiedi copia della ricevuta”, che crea una richiesta per l’amministratore. Caricamento dei PDF da valutare dopo la verifica con l’assistenza di VERIF!CO (DIP-12).
>
> **FR-SEC-01 · Password e accesso.** Password di almeno 12 caratteri, rifiutata se presente negli elenchi di password violate; salvata solo con un algoritmo di hashing dedicato (bcrypt o Argon2); blocco temporaneo dopo tentativi errati; recupero con link a scadenza e monouso; verifica in due passaggi obbligatoria per amministratori e volontari, facoltativa per sostenitori e soci.
>
> **FR-SEC-02 · Modifica dei dati critici.** Cambio email: conferma sulla nuova e avviso alla vecchia. Cambio IBAN o codice fiscale: avviso al sostenitore e conferma dell’amministratore prima che diventi effettivo. Gli altri dati si modificano liberamente.

**✎ Appunti / risposte**

> *(spazio per appunti)*

## 5.8 Schede informative: sostenitore, beneficiario, intervento (bozza)

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

> **🧭 Come leggere queste schede**
>
> - Sono una **prima proposta** ricavata dal brain dump (Allegato finale, BD.3–BD.4). Descrivono **quali informazioni** servono, non come sono salvate: il modello tecnico va al cap. 12.
> - Per ogni campo decidi tu se è **obbligatorio**, e cancella i campi che non servono: per il GDPR si raccoglie solo il minimo necessario (minimizzazione).
> - La colonna **Visibile a** indica chi può vedere il dato: A = amministratore, T = tesoriere, V = volontario, S = il sostenitore stesso.

### Scheda sostenitore

| Campo | Perché serve | Chi lo inserisce | Obbl.? | Visibile a / note privacy |
| --- | --- | --- | --- | --- |
| **Identità** |   |   |   |   |
| Tipo (persona / ente o azienda) | Le ricevute e la contabilità cambiano | Sostenitore |   |   |
| Nome e cognome / ragione sociale | Identificazione | Sostenitore |   |   |
| Codice fiscale / partita IVA | Ricevute per la detrazione, allineamento con VERIF!CO | Sostenitore |   | Dato personale: A, T, S |
| **Contatti** |   |   |   |   |
| Email | Accesso all’area riservata, comunicazioni | Sostenitore |   |   |
| Telefono / WhatsApp | Contatto diretto, gruppo WhatsApp | Sostenitore |   |   |
| Indirizzo e provincia | Ricevute; la provincia è già chiesta dal bot | Sostenitore |   |   |
| Lingua preferita | Sostenitori non italiani? | Sostenitore |   |   |
| **Rapporto con Effatà** |   |   |   |   |
| Ruoli (sostenitore, socio, volontario) | Una persona può averne più di uno | Amministratore |   |   |
| Data di registrazione e origine del dato | Autoregistrato / importato da VERIF!CO / inserito dall’admin | Sistema |   | Serve per il recupero dei dati storici |
| Quota associativa (se socio) | Anno e stato del pagamento | Tesoriere |   |   |
| Come ci ha conosciuto | Utile all’associazione | Sostenitore |   | Facoltativo |
| **Dati per l’abbinamento dei bonifici** |   |   |   |   |
| IBAN da cui dona (uno o più) | Abbinamento automatico dei bonifici; campo IBAN_MITTENTE di VERIF!CO | Sostenitore o tesoriere |   | Dato bancario: A, T, S |
| ID anagrafica in VERIF!CO | Collegamento fra i due gestionali | Tesoriere |   |   |
| **Consensi** |   |   |   |   |
| Consenso privacy (data, versione informativa) | Obbligo GDPR, prova del consenso | Sostenitore |   |   |
| Consenso a comunicazioni / newsletter | Separato dal consenso privacy | Sostenitore |   |   |
| Consenso a comparire nei post social | Il bot chiede il nome del padrino per i post | Sostenitore |   |   |
| **Collegamenti** |   |   |   |   |
| Interventi sostenuti | Adozioni, casette, animali, operazioni… | Sistema |   | S vede solo i propri |
| Storico donazioni | Dai movimenti bancari confermati | Sistema |   | S vede solo le proprie |

### Scheda beneficiario

| Campo | Perché serve | Chi lo inserisce | Obbl.? | Visibile a / note privacy |
| --- | --- | --- | --- | --- |
| **Identità** |   |   |   |   |
| Tipo (bambino, persona adulta, famiglia, comunità / scuola) | Una casetta va a una famiglia, un pozzo a una comunità | Amministratore |   |   |
| Codice (es. UG-102) | Identificativo usato dal bot e nelle comunicazioni | Sistema |   |   |
| Nome | Riconoscibilità per il sostenitore | Amministratore / Silvia |   | Minore: pubblicabile? Solo nome? |
| Data di nascita o età | Adozioni scolastiche, età per il sostenitore | Amministratore / Silvia |   | Al sostenitore solo l’età |
| Sesso | Da decidere se serve | Amministratore / Silvia |   |   |
| Villaggio / distretto | Rendicontazione per zona | Amministratore / Silvia |   | Mai la posizione esatta |
| **Contesto (per adozioni)** |   |   |   |   |
| Scuola e classe frequentata | Pagelle, progressi | Silvia |   |   |
| Famiglia / tutore di riferimento | Chi firma il consenso, chi riceve gli aiuti | Silvia |   | Dato personale di terzi |
| Referente locale | Chi segue il beneficiario (es. Silvia) | Amministratore |   |   |
| **Consensi** |   |   |   |   |
| Consenso del genitore/tutore per le foto | Obbligo per i minori: data, chi l’ha raccolto, documento | Silvia |   | Senza consenso niente foto |
| Consenso alla pubblicazione sui social | Diverso dal consenso a mostrare le foto al solo sostenitore | Silvia |   | Volto oscurato? |
| **Storico** |   |   |   |   |
| Interventi ricevuti | Collegamento a sostenitori e donazioni | Sistema |   |   |
| Documenti (pagelle, certificati, foto, storie) | Contenuti per il sostenitore | Operatore / bot |   | S vede solo i beneficiari che sostiene |
| Stato (attivo, concluso, trasferito…) | Fine del percorso | Amministratore |   |   |
| Informazioni sanitarie (solo se indispensabili) | Operazioni chirurgiche | Amministratore |   | **Dato sanitario: art. 9 GDPR** |

### Scheda famiglia

> **✔ Deciso il 24/09/2026**
>
> Una famiglia ha uno o più bambini, ciascuno adottato dal proprio sostenitore. Gli altri interventi (animali, materassi, casette…) vanno di solito alla famiglia, ognuno con il proprio sostenitore e progetto.

| Campo | Perché serve | Chi lo inserisce | Obbl.? | Visibile a / note privacy |
| --- | --- | --- | --- | --- |
| Codice famiglia | Identificativo usato nelle comunicazioni | Sistema |   |   |
| Cognome / nome di riferimento | Riconoscibilità | Amministratore / Silvia |   |   |
| Genitore o tutore di riferimento | Firma i consensi per i minori | Silvia |   | Dato personale di terzi |
| Villaggio / distretto | Rendicontazione per zona | Amministratore / Silvia |   | Mai la posizione esatta |
| Componenti (bambini) | Collegamento alle schede bambino | Sistema |   | Ogni sostenitore vede solo i propri beneficiari |
| Consensi firmati (foto, pubblicazione) | Obbligo per i minori | Silvia |   | Dato sensibile: solo amministratore |
| Interventi ricevuti | Storico degli aiuti alla famiglia | Sistema |   |   |

> **⚠ Da decidere**
>
> - Chi ha donato la mucca alla famiglia vede anche i bambini della famiglia adottati da altri? E chi adotta un bambino vede gli altri interventi ricevuti dalla sua famiglia?

### Scheda intervento (proposta: il collegamento fra le due)

> **⚠ Perché una terza scheda**
>
> - Il brain dump chiede di collegare **ogni donazione al beneficiario** e di **rendicontare le spese**. Una casetta può essere pagata da più sostenitori; un sostenitore può finanziare un’adozione e un’operazione. Il punto di collegamento naturale è l’**intervento**: “adozione scolastica di UG-102 per l’anno 2026”, “casetta per la famiglia X”, “mucca per la famiglia Y”.

| Campo | Perché serve | Chi lo inserisce | Obbl.? | Visibile a / note privacy |
| --- | --- | --- | --- | --- |
| Tipo di intervento | Adozione scolastica, casetta, affitto terreno, animale (mucca, maiale, capretta, gallina), materassi, scarpe, sedia a rotelle, operazione chirurgica… | Amministratore |   | Coincide con le categorie del bot? |
| Beneficiario/i | A chi va l’intervento | Amministratore |   |   |
| Sostenitore/i | Chi lo finanzia, con quale quota | Amministratore / sistema |   |   |
| Costo previsto e raccolto | Sapere se è coperto | Tesoriere |   |   |
| ID progetto in VERIF!CO | Imputazione contabile automatica (ID_PROGETTO) | Tesoriere |   |   |
| Spese sostenute (con giustificativi) | Rendicontazione delle uscite | Tesoriere / Silvia |   |   |
| Foto e storie di rendicontazione | Prova per il sostenitore; storie generate dal bot | Operatore / bot |   |   |
| Stato e date (avviato, in corso, completato) | Comunicazione al sostenitore | Amministratore |   |   |

# 6. Requisiti non funzionali

**Stato:** **MANCANTE**

*Origine: unione fra la nostra bozza e il template del prof*

> **🧭 Dal template**
>
> - Ogni requisito ha una **soglia**, una **condizione** e un **modo per verificarlo**, ed è collegato ad almeno una user story.
> - Famiglie da coprire: prestazioni, disponibilità, scalabilità, sicurezza, conformità, usabilità, ambientali, supporto, interazione. Se una famiglia resta vuota, scrivi perché non vi riguarda.
> - I requisiti trasversali della traccia (HTTPS, paginazione, OpenAPI, errori uniformi, Dev e Prod) sono obbligatori: riportali con il loro ID.

> **✔ Esempio del template adattato**
>
> NFR-01 · Prestazioni · Apertura della scheda bambino nel picco dopo la newsletter · meno di 2 s per il 95% delle richieste con N utenti nello stesso minuto · Test di carico · US-301.

Nella colonna **Requisito** trovi le categorie della nostra bozza, già assegnate alla famiglia del template.

| ID | Famiglia | Requisito | Soglia e condizione | Come si verifica | Storie |
| --- | --- | --- | --- | --- | --- |
| NFR-01 | Prestazioni | Tempo di risposta area sostenitori nel picco | es. < 2 s per il 95% delle richieste, N utenti nello stesso minuto | es. test di carico | es. US-301 |
| NFR-02 | Prestazioni | Tempo di elaborazione di un estratto conto |   |   |   |
| NFR-03 | Disponibilità | Disponibilità del servizio |   |   |   |
| NFR-04 | Disponibilità | Backup e ripristino |   |   |   |
| NFR-05 | Scalabilità | Crescita di sostenitori e foto |   |   |   |
| NFR-06 | Sicurezza | Tutto il traffico su HTTPS (trasversale) |   |   |   |
| NFR-07 | Sicurezza | Controllo ruoli nel backend |   |   |   |
| NFR-08 | Conformità | GDPR e dati di minori |   |   |   |
| NFR-09 | Conformità | Conservazione dei dati (per quanto tempo?) |   |   |   |
| NFR-10 | Usabilità | Accessibilità per sostenitori anziani |   |   |   |
| NFR-11 | Ambientale | Connettività limitata in Uganda |   |   |   |
| NFR-12 | Supporto | Manutenibilità e documentazione OpenAPI (trasversale) |   |   |   |
| NFR-13 | Interazione | Lingua: solo italiano in questa versione; testi in file di traduzione separati per aggiungere l’inglese con l’accesso dall’Uganda | Nessun testo dell’interfaccia scritto nel codice | Revisione del codice | Tutte |
| NFR-13b | Interazione | Errori in formato uniforme (trasversale) |   |   |   |
| NFR-14 | Interazione | Elenchi paginati (trasversale) |   |   |   |
| NFR-15 | Supporto | Ambienti Development e Production senza segreti nel codice (trasversale) |   |   |   |

## 6.2 Requisiti impliciti

*Origine: template del prof – sezione nuova, non presente nella nostra bozza*

> **🧭 Dal template, adattato**
>
> - Intervista per dieci minuti un utente reale. Una sola domanda: **“Cosa daresti per scontato che un’app di questo tipo faccia sempre, o non faccia mai?”**
> - Nel tuo caso intervista almeno un **sostenitore** e il **tesoriere**. Esempio di risposta: “Una donazione registrata non deve sparire, mai”.

| Chi avete intervistato | Cosa ha detto | Requisito che ne avete ricavato |
| --- | --- | --- |
| es. M.R. (sostenitrice) | es. “Una donazione registrata non deve sparire, mai” | es. NFR-… |
|   |   |   |
|   |   |   |
|   |   |   |

# 7. Assunzioni, vincoli e dipendenze

**Stato:** **MANCANTE**

*Origine: template del prof – sezione nuova, non presente nella nostra bozza*

> **🧭 Dal template**
>
> - **Assunzioni**: ciò che date per vero senza poterlo garantire. **Vincoli**: i limiti che non potete cambiare. **Dipendenze**: le cose esterne senza cui non potete andare avanti.
> - Le righe precompilate sono **proposte** emerse dalla nostra analisi: confermale, correggile o cancellale.

## 7.1 Assunzioni

| ID | Assunzione | Cosa succede se è falsa |
| --- | --- | --- |
| ASS-01 | L’associazione ha 700–800 sostenitori e ~1.200 bambini adottati (cap. 3.1) | Il dimensionamento va rifatto |
| ASS-02 | Gli estratti conto contengono i dati necessari all’abbinamento (codice fiscale?) |   |
| ASS-03 | Gli operatori in Uganda hanno uno smartphone con Telegram |   |
| ASS-04 | I sostenitori hanno un indirizzo email valido |   |
| ASS-05b | Il costo dichiarato di un intervento corrisponde alla spesa effettiva (FR-INT-04) | La rendicontazione economica va rivista |
| ASS-05 |   |   |

## 7.2 Vincoli

| ID | Vincolo | Da dove viene |
| --- | --- | --- |
| VIN-01 | Budget mensile limitato di un’ODV | Associazione |
| VIN-02 | Trattamento di dati di minori e dati fiscali | GDPR |
| VIN-03 | Formato di importazione imposto da Verifico.it | Verifico.it |
| VIN-04 | Sviluppatore singolo e tempi del corso ITS | Progetto didattico |
| VIN-05 | Requisiti trasversali della traccia (HTTPS, OpenAPI, Postman, Dev/Prod, deploy pubblico) | Traccia del progetto |
| VIN-06 |   |   |

## 7.3 Dipendenze

| ID | Dipendenza | Serve entro | Chi se ne occupa |
| --- | --- | --- | --- |
| DIP-01 | Estratti conto reali (anonimizzati) per test |   |   |
| DIP-02 | Formato ufficiale di importazione Verifico.it |   |   |
| DIP-03 | Token del bot Telegram |   |   |
| DIP-04 | Account e chiave del provider AI |   |   |
| DIP-05 | Account servizio email (Brevo, già in uso) | es. prima del collaudo | es. Andrea Pavan |
| DIP-06 | Server / dominio per il deploy |   |   |
| DIP-07 | Consenso dell’associazione a usare dati e foto reali nel collaudo |   |   |
| DIP-08 | Bot social esistente, con le API di integrazione protette da token (fase 2) | Fase 2 | Andrea Pavan |
| DIP-09 | API di Meta (Facebook, Instagram) per la pubblicazione | Fase 2 |   |
| DIP-10 | API di Anthropic (Claude) per i testi social e l’eventuale lettura delle causali |   |   |
| DIP-11 | Google Perspective e OpenAI Moderation (solo nel bot, per i commenti) | — |   |
| DIP-12 | Risposta dell’assistenza VERIF!CO: esportazione in blocco dei PDF delle ricevute? API disponibili? | Prima della fase 2 | Andrea Pavan |

# Seconda parte · Il come

*Come costruirai il Gestionale Effatà. Qui parli al docente, non al presidente dell’associazione.*

> **🧭 Dal template**
>
> - Ogni scelta tecnica va motivata e confrontata con almeno un’alternativa. “Lo conosciamo” è una motivazione valida, ma non può essere l’unica.

# 8. Stima del carico

**Stato:** **MANCANTE**

*Origine: unione fra la nostra bozza e il template del prof*

> **🧭 Guida**
>
> - Dalla traccia: utenti concorrenti normali e nei picchi, profilo di carico. Ogni numero deve discendere dal cap. 3.
> - Dal template: se dichiarate N sostenitori non potete dimensionare per pochi utenti senza spiegare perché.

## 8.1 Utenti concorrenti

> **⚠ Il tuo “picco delle 9:00”**
>
> - Nella traccia il picco è l’inizio di tre verifiche insieme. Nel tuo dominio è l’**invio della newsletter**: se ~600 persone ricevono “ci sono nuove foto”, quante fanno login nella prima ora? E nei primi 10 minuti?
> - L’equivalente di “fine quadrimestre” è il periodo delle **ricevute fiscali** (inizio anno) o la **campagna di Natale**.

| Situazione | Utenti concorrenti | Da dove viene il numero |
| --- | --- | --- |
| Uso normale durante la giornata |   |   |
| Prima ora dopo la newsletter (picco) |   |   |
| Periodo ricevute fiscali / Natale |   |   |

## 8.2 Profilo di carico

| Operazione | Frequente? | Pesante? | Critica? | Note |
| --- | --- | --- | --- | --- |
| Login e dashboard sostenitore |   |   |   |   |
| Visualizzazione foto |   |   |   |   |
| Upload foto dal bot (ridimensionamento) |   |   |   |   |
| Parsing estratto conto con AI |   |   |   |   |
| Generazione ricevute PDF |   |   |   |   |
| Esportazione CSV per Verifico |   |   |   |   |
| Dashboard amministratore |   |   |   |   |

## 8.3 Stima dello storage

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

(numero bambini) × (foto al mese per bambino) × (peso medio dopo il ridimensionamento) × 12 mesi, più PDF di estratti conto e ricevute.

**✎ Appunti / risposte**

> *(spazio per appunti)*

# 9. Scelte tecnologiche con alternative considerate (Scelte tecnologiche)

> **✔ Orientamento del 24/09/2026 – da confermare dopo aver scritto i requisiti**
>
> **Frontend: Ionic + React, pubblicato come PWA;** Capacitor per un’eventuale app sugli store in futuro. Alternative considerate: Ionic + Angular, React Native, Flutter, due frontend separati. Motivazione: un solo codice per PC e smartphone (i sostenitori usano soprattutto lo smartphone); React è oggetto del corso parallelo dell’ITS; la PWA evita nella fase 1 i costi e i vincoli degli store (account sviluppatore, revisioni, Mac per iOS).
>
> **Backend: Node.js con NestJS, in TypeScript.** Alternativa considerata: Express. Motivazione: struttura a livelli e dependency injection già integrate (cap. 14.2); stesso linguaggio del frontend, con definizioni dei dati condivisibili.
>
> Punto da verificare: la dashboard amministratore (tabelle, filtri, paginazione) va resa bene anche su PC con i layout responsive di Ionic.

**Stato:** **DA RIVEDERE**

*Origine: unione fra la nostra bozza e il template del prof*

> **📄 Dalla tua bozza v2.0**
>
> Frontend: Angular / Ionic (PWA). Backend: Node.js (Express) con Knex.js / TypeORM. Database: PostgreSQL o MySQL (SQLite in locale/test). AI: OpenAI GPT-4o / Anthropic Claude 3.5 Sonnet / Google Gemini. Deployment: Docker Compose su VPS Linux con Nginx e certbot (SSL).

> **⚠ Nota di revisione**
>
> - Il PRD deve mostrare che hai **deciso**: ogni “/” e ogni “o” va eliminato. Una scelta per riga.
> - Servono almeno un’alternativa scartata e i criteri (competenze, ecosistema, costi, requisiti non funzionali).
> - SQLite nei test e PostgreSQL in produzione può nascondere differenze: se lo tieni, motivalo.
> - Per l’AI indica un **modello specifico e attuale**, verificando il nome sul sito del provider: quello in bozza è superato.
> - Confronta la VPS con un PaaS come **Railway**, che hai già usato per CarPro.
> - Il template chiede anche **Provider cloud**, **Servizi cloud** e **Regione**: la regione conta per il GDPR (dati in UE?).

| Area | Scelta | Alternativa considerata | Perché avete scelto così |
| --- | --- | --- | --- |
| Backend | Node.js + NestJS (TypeScript) – orientamento | Express | Vedi riquadro sopra |
| Accesso ai dati (ORM / query builder) |   |   |   |
| Frontend | Ionic + React come PWA – orientamento | Ionic + Angular; React Native; Flutter | Vedi riquadro sopra |
| Database |   |   |   |
| Provider cloud |   |   |   |
| Servizi cloud (VM, container, PaaS, DB gestito) |   |   |   |
| Regione |   |   |   |
| Storage media |   |   |   |
| Servizio esterno: provider AI e modello |   |   |   |
| Servizio esterno: email |   |   |   |
| Libreria bot Telegram |   |   |   |
| Generazione PDF (ricevute) |   |   |   |
| Internazionalizzazione | File di traduzione separati | Testi scritti nel codice | Deciso il 23/09: aggiungere l’inglese in futuro senza riscrivere l’interfaccia (NFR-13) |
| Autenticazione |   |   |   |

# 10. Area 1 – Fondamenti di architettura (Architettura)

**Stato:** **DA RIVEDERE**

*Origine: unione fra la nostra bozza e il template del prof*

> **🧭 Guida – cosa chiede il professore**
>
> - Architettura complessiva e **suddivisione in componenti**, con un diagramma.
> - **Livelli** riferiti al tuo gestionale; **dipendenze** fra livelli; come la struttura riduce l’**accoppiamento** e rende il sistema **testabile**.

## 10.1 Diagramma dei componenti

> **📄 Dalla tua bozza v2.0**
>
> Operatore → Telegram Bot; Sostenitore → Web Portal (PWA) con login JWT; entrambi → Backend Node.js (Controller API, Media Processor, Validation Layer) via HTTP REST / Webhooks → AI Vision (Claude/OAI), Database relazionale, Cloud Media Storage; Database → Verifico.it (Esportazione CSV / Bot RPA).

> **⚠ Nota di revisione**
>
> - Mancano il pannello di amministrazione web e il servizio email esterno.
> - La freccia Database → Verifico suggerisce che il DB parli con Verifico: è il backend che genera il file.
> - Da ridisegnare (draw.io, Excalidraw, Mermaid) e inserire come immagine.

> **✔ Aggiornato il 24/09/2026 – due sistemi indipendenti**
>
> **Fonte unica di verità.** Il gestionale è proprietario dei dati (interventi, bambini e famiglie, sostenitori, consensi, prove di rendicontazione). Il bot è proprietario dei contenuti social (bozze, testi generati, pubblicazioni, moderazione dei commenti, promozioni).
>
> I due sistemi **non condividono database né cartelle**: dialogano solo tramite API REST autenticate con token, su HTTPS (contratto al cap. 11.5). Il bot non conserva dati di bambini e sostenitori: tiene solo l’ID dell’intervento.

```text
GESTIONALE (proprietario dei dati)        BOT (proprietario dei contenuti social)
  ├── Interventi                             ├── Bozze
  ├── Bambini e famiglie                     ├── Testi generati
  ├── Sostenitori                            ├── Pubblicazioni
  └── Consensi e prove                       └── Moderazione commenti, promozioni
          ▲                                         │
          └──────── API REST + token (HTTPS) ───────┘
```

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Inserisci qui il diagramma. Deve mostrare i componenti principali (bot, area sostenitori, pannello amministratore, backend, database, storage, servizi esterni) e come comunicano.

> *(spazio per appunti)*

## 10.2 Livelli e responsabilità (I livelli)

> **✔ Vincolo emerso il 24/09/2026**
>
> Il caricamento dei dati non dipende dal bot. Le funzioni “carica foto”, “crea scheda beneficiario”, “registra intervento” stanno nel livello applicativo e sono esposte dalle API; il bot Telegram è uno dei canali che le usa. Domani un’app o una pagina web leggera per l’Uganda userà le stesse API senza riscrivere la logica.

> **🧭 Domanda chiave**
>
> - Il bot Telegram è solo un **altro canale di presentazione**, come il portale web: deve chiamare gli stessi servizi applicativi, non scrivere direttamente sul database. Così la logica “salva foto per il bambino X” esiste in un solo punto.

| Livello | Cosa fa nel Gestionale Effatà | Esempio concreto |
| --- | --- | --- |
| Presentation / API (REST + webhook bot) |   |   |
| Application / Business |   |   |
| Data access |   |   |
| Infrastruttura (AI, email, storage, Telegram) – livello aggiuntivo |   |   |

## 10.3 Direzione delle dipendenze, accoppiamento e testabilità (Le dipendenze fra i livelli)

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Chi può conoscere chi, e in quale direzione? (Es. il servizio che salva una foto conosce l’interfaccia del repository, non il database.) Spiega come questa struttura riduce l’accoppiamento e rende il sistema testabile.

**✎ Appunti / risposte**

> *(spazio per appunti)*

# 11. Area 2 – Progettazione e realizzazione delle API (Le API)

**Stato:** **MANCANTE**

*Origine: unione fra la nostra bozza e il template del prof*

> **🧭 Guida – cosa chiede il professore**
>
> - **Risorse** REST e route; GET, POST, PUT, PATCH, DELETE; **CRUD completo** sulle entità principali.
> - **Codici di stato** e **formato uniforme** degli errori; **validazione** e **paginazione**.
> - **OpenAPI/Swagger** e collezione **Postman**. Nel PRD basta il **contratto** delle API principali.

## 11.1 Mappa delle risorse (Le risorse)

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Elenca le risorse REST principali. Es. `/supporters`, `/children`, `/adoptions`, `/donations`.

| Risorsa / route | Verbi | Ruoli ammessi | Note |
| --- | --- | --- | --- |
| /auth/login |   |   |   |
| /supporters |   |   |   |
| /children |   |   |   |
| /adoptions |   |   |   |
| /donations |   |   |   |
| /bank-imports |   |   |   |
| /media |   |   |   |
| /receipts |   |   |   |
| /exports/verifico |   |   |   |
| /me/... |   |   |   |
| /telegram/webhook |   |   |   |

> **🧭 Domande da decidere**
>
> - Quando **PUT** e quando **PATCH**? (Es. chiudere un’adozione cambiando solo lo stato.)
> - Confermare un’importazione AI: PATCH sullo stato o azione dedicata?
> - DELETE su un sostenitore: cancellazione vera o disattivazione? Diritto all’oblio?

## 11.2 Il contratto delle API principali

*Origine: unione fra la nostra bozza e il template del prof*

| Verbo | Route | Chi può chiamarla | Payload di esempio | Risposte previste |
| --- | --- | --- | --- | --- |
| POST | /api/supporters | Amministratore | { "firstName": "…", "email": "…" } | 201, 400, 403, 409 |
| GET |   |   |   |   |
| PUT |   |   |   |   |
| PATCH |   |   |   |   |
| DELETE |   |   |   |   |
|   |   |   |   |   |

> **✔ Esempio di contratto con paginazione (dalla versione guidata)**
>
> `GET /children/{id}/media?page=1&pageSize=20` · Ruoli: Amministratore, oppure Sostenitore abbinato. Risposte: 200 elenco paginato · 401 · 403 bambino non abbinato · 404 bambino inesistente.

```text
{
  "items": [ { "id": "…", "type": "photo", "caption": "…", "createdAt": "…" } ],
  "page": 1, "pageSize": 20, "totalItems": 57
}
```

## 11.5 Contratto di integrazione con il bot (fase 2)

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

```text
IL BOT CHIEDE AL GESTIONALE (token di servizio, HTTPS)
  GET  /api/v1/interventi?stato=da-rendicontare   → cosa c’è da documentare
  GET  /api/v1/interventi/{id}/dati-pubblicabili   → solo i dati coperti da consenso
  POST /api/v1/interventi/{id}/prove               → allega le foto scelte come prova
 
IL BOT AVVISA IL GESTIONALE
  POST /api/v1/webhooks/bot/pubblicazione          → {draft_id, intervento_id, piattaforma, url}
 
TUTTO IL RESTO RESTA NEL BOT
  testi generati, bozze, pubblicazioni, moderazione dei commenti, promozioni
```

> **🧭 Perché è fatto così**
>
> - L’endpoint dei **dati pubblicabili** è il “cancello del consenso”: il bot non riceve mai un dato che non è autorizzato a pubblicare (es. mai la località esatta; il nome del padrino solo con il suo consenso).
> - Nel bot l’unica modifica strutturale è la colonna `intervento_id` nella tabella `drafts`.
> - Da definire: cosa succede se il webhook di pubblicazione non arriva (ritentativi dal bot? riconciliazione periodica?).

## 11.3 Errori, validazione e paginazione

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> **Formato uniforme degli errori.** Valuta lo standard **RFC 9457 (Problem Details)** o un formato tuo, motivando. Come restituisci gli errori **campo per campo**? Il template chiede un **esempio** di risposta di errore.

> *(spazio per appunti)*

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> **Validazione degli input.** Dove avviene, con quale libreria e quali regole.

> *(spazio per appunti)*

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> **Paginazione.** Offset o cursore? Parametri, dimensione di default e massima, formato della risposta.

> *(spazio per appunti)*

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> **Documentazione e verifica.** OpenAPI a mano o generata dal codice? La collezione Postman copre almeno ogni AC negativo?

> *(spazio per appunti)*

# 12. Area 3 – Persistenza e modellazione (Persistenza e modello dei dati)

**Stato:** **DA RIVEDERE**

*Origine: unione fra la nostra bozza e il template del prof*

> **🧭 Guida – cosa chiede il professore**
>
> - Modello relazionale con **entità, relazioni, cardinalità** e diagramma ER; accesso ai dati e **query parametrizzate**; **identificatori**; differenza fra **DB, dominio e API**; **normalizzazione** e letture aggregate.

## 12.1 Entità attuali

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

> **📄 Dalla tua bozza v2.0**
>
> `Users` (id, email, password_hash, role [admin|sostenitore|volontario], telegram_id, created_at)
>
> `Supporters` (id, user_id, first_name, last_name, tax_code, address, phone, notes)
>
> `Children` (id, code_name, birth_date, location, bio, status [active|completed])
>
> `Adoptions` (id, supporter_id, child_id, start_date, monthly_amount, status)
>
> `Donations` (id, supporter_id, adoption_id, amount, donation_date, payment_method, tax_code_extracted, raw_causale, verified)
>
> `Media` (id, child_id, donation_id, file_path, file_type [photo|pdf|letter], caption, uploaded_by, created_at)

> **⚠ Nota di revisione**
>
> - `Donations` **mescola dati grezzi e validati**: valuta tabelle di staging (`BankImports`, `BankImportRows`).
> - Le **ricevute fiscali** non hanno un’entità propria.
> - `Supporters.user_id` nullable per i donatori che non faranno mai login?
> - `verified` booleano o più stati (importata, da revisionare, verificata, scartata)?
> - Mancano `updated_at` ed eventuale soft delete; `uploaded_by` va dichiarato come chiave esterna.

## 12.2 Relazioni, cardinalità e diagramma ER (Diagramma ER)

| Relazione | Cardinalità | Motivazione |
| --- | --- | --- |
| Users – Supporters |   |   |
| Supporters – Children (tramite Adoptions) |   |   |
| Adoptions – Donations |   |   |
| Children – Media |   |   |
| BankImports – BankImportRows |   |   |
| Donations – Receipts |   |   |

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Inserisci qui il diagramma entità-relazioni con le cardinalità (es. un sostenitore ha 0..N adozioni, un bambino ha 0..N foto). Strumenti: dbdiagram.io, draw.io, Mermaid.

> *(spazio per appunti)*

## 12.3 Identificatori

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Come vengono generati gli ID, e perché? Numeri incrementali, UUID, altro?

> **🧭 Domanda chiave**
>
> - Con ID sequenziali un sostenitore può provare `/children/58` dopo `/children/57`. Il backend deve bloccarlo comunque, ma ID non indovinabili (UUID) sono una difesa in più. ID interno e ID pubblico possono essere diversi.
> - Il codice `UG-102` è un ID o un attributo di business? Può cambiare?

**✎ Appunti / risposte**

> *(spazio per appunti)*

## 12.4 DB, dominio e API: dove differiscono (Tre modelli diversi)

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Per ogni entità principale: come è fatta nel database, nel dominio e nell’API, e dove differiscono e perché. Esempio nel template: il Voto. Esempio per Effatà: il Bambino (prima riga).

| Entità | Nel database | Nel dominio | Esposta dall’API | Dove differiscono e perché |
| --- | --- | --- | --- | --- |
| Bambino | `birth_date`, `location` esatta | Età calcolata | Solo età, niente località esatta (al sostenitore) | Minimizzazione GDPR sui dati di minori |
| Utente |   |   |   |   |
| Sostenitore |   |   |   |   |
| Donazione |   |   |   |   |

## 12.5 Normalizzazione e letture aggregate

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Come è normalizzato il modello? Dove serve una lettura denormalizzata, per esempio lo storico donazioni per anno del sostenitore o la dashboard dell’Amministratore (totali per mese, adozioni attive, anomalie aperte)? Vista SQL o query aggregata nel repository?

**✎ Appunti / risposte**

> *(spazio per appunti)*

## 12.6 Accesso ai dati

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Strategia di accesso ai dati e uso delle query parametrizzate contro la SQL injection. Con la libreria scelta come le garantisci? C’è un punto in cui scrivi SQL a mano?

**✎ Appunti / risposte**

> *(spazio per appunti)*

# 13. Area 4 – Sicurezza e integrazione

**Stato:** **DA RIVEDERE**

*Origine: unione fra la nostra bozza e il template del prof*

> **🧭 Guida – cosa chiede il professore**
>
> - **HTTPS**; **autenticazione** (token, contenuto, profilo); **ruoli** e dove viene applicato il controllo (mai solo nel frontend); almeno una **API esterna** e il suo fallimento; **configurazioni e segreti**.

> **📄 Dalla tua bozza v2.0**
>
> Controllo granulare degli accessi: ciascun sostenitore può vedere esclusivamente i dati e i media del bambino a lui abbinato.
>
> Nessun dato bancario sensibile (es. IBAN completo) viene inviato ai modelli AI se non strettamente necessario per la riconciliazione.

## 13.1 Autenticazione e token

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Come si ottiene il token, cosa contiene, come viaggia il profilo utente (es. ruolo e id del sostenitore)?

- Claims del token: quali dati ci metti e quali **non** ci metti?
- Durata, refresh token, logout. Dove lo conserva il frontend?
- Il bot non ha login: l’identità è il Telegram ID. Telefono perso: come si revoca?
- Come verifichi che le chiamate al webhook arrivino davvero da Telegram?

**✎ Appunti / risposte**

> *(spazio per appunti)*

## 13.2 Matrice delle autorizzazioni (Chi può fare cosa)

Segna ✅ (permesso), ❌ (negato) o “solo propri”. Ogni ❌ deve avere un AC negativo e un test.

*Le celle già compilate derivano dalle decisioni del 24/09/2026 (FR-RUO-01/02/03, FR-ACC-03). “Se abilitato” = permesso configurabile dall’amministratore.*

| Operazione | Amministratore | Volontario | Socio | Sostenitore |
| --- | --- | --- | --- | --- |
| Creare / modificare sostenitore | ✅ | se abilitato | ❌ | solo sé stesso |
| Creare / modificare beneficiario e famiglia | ✅ | se abilitato | ❌ | ❌ |
| Abbinare adozione / chiudere e riaffidare | ✅ | se abilitato | ❌ | ❌ |
| Caricare foto e documenti | ✅ | se abilitato | ❌ | ❌ |
| Vedere scheda e foto di un bambino | ✅ | ✅ (dati non sensibili) | ❌ | solo propri (fino alla chiusura) |
| Vedere dati bancari e fiscali | ✅ | ❌ | ❌ | solo propri |
| Vedere dati sanitari | ✅ | ❌ | ❌ | ❌ |
| Leggere le chat private | ✅ | ❌ | ❌ | solo proprie |
| Rispondere alle chat | ✅ | se abilitato | ❌ | solo proprie |
| Caricare estratto conto / confermare donazioni | ✅ |   | ❌ | ❌ |
| Esportare per VERIF!CO | ✅ |   | ❌ | ❌ |
| Consultare l’area soci | ✅ | ❌ | ✅ | ❌ |
| Configurare impostazioni e permessi | ✅ | ❌ | ❌ | ❌ |
| Ripristinare un account archiviato | ✅ | ❌ | ❌ | ❌ |

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Spiega dove viene fatto rispettare questo controllo, e come verifichi il vincolo “solo propri”. Ricorda che il frontend non basta mai.

> *(spazio per appunti)*

## 13.3 API esterne e gestione dei fallimenti (L’API esterna)

> **🧭 Nota positiva**
>
> - Il template chiede una API esterna: tu ne hai diverse. È un punto di forza, ma per ognuna devi dire cosa succede se non risponde.

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Quale servizio usate, per cosa, e cosa succede quando non risponde? (Es. Brevo per l’email con le credenziali del sostenitore: se non risponde, l’account viene creato lo stesso e l’invio ritentato?)

| Servizio esterno | Uso | Se fallisce o è lento… | Timeout / retry |
| --- | --- | --- | --- |
| Telegram Bot API |   |   |   |
| Provider AI Vision |   |   |   |
| Servizio email (Brevo?) |   |   |   |
| Storage media (se esterno) |   |   |   |

## 13.4 Privacy e dati di minori

> **✔ Aggiornato il 24/09/2026 – dati che oggi escono verso servizi esterni (dal bot)**
>
> **Anthropic (Claude):** foto e testi delle storie, per generare i contenuti social.
>
> **Meta:** foto e testi pubblicati su Facebook e Instagram.
>
> **Google Perspective e OpenAI Moderation:** i commenti degli utenti dei social, per la moderazione.
>
> Per ciascuno vanno documentati: finalità, base giuridica, dove sono trattati i dati, se il fornitore li conserva, e il consenso quando riguardano minori.

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

> **⚠ Punto delicato – il prof lo chiederà**
>
> - Base giuridica e consenso per le foto dei bambini: chi lo raccoglie e come viene registrato?
> - Cosa inviate esattamente all’AI? Potete mascherare IBAN e altri dati? Il provider conserva i dati? In quale paese?
> - Dove sono ospitati database e foto (UE o no)? Per quanto tempo conservate estratti conto e foto?

**✎ Appunti / risposte**

> *(spazio per appunti)*

## 13.5 Configurazione e segreti

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Dove vivono connection string e segreti, e come cambiano fra Development e Production?

| Segreto / configurazione | Development | Production |
| --- | --- | --- |
| Connection string database |   |   |
| Chiave firma JWT |   |   |
| Token bot Telegram |   |   |
| Chiave API provider AI |   |   |
| Chiave API email |   |   |

# 14. Area 5 – Qualità architetturale

**Stato:** **MANCANTE**

*Origine: unione fra la nostra bozza e il template del prof*

> **🧭 Guida – cosa chiede il professore**
>
> - **Organizzazione del codice**, **design pattern**, **testabilità**, **Development/Production**. (Deployment e migrazioni sono al cap. 16, come nel template.)

## 14.1 Organizzazione del codice

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Struttura di progetti, moduli e cartelle del Gestionale Effatà, con le motivazioni. Disegna l’albero di backend e frontend: per livello o per funzionalità?

> *(spazio per appunti)*

## 14.2 Design pattern (Dependency inversion e IoC)

> **🧭 Il template chiede esplicitamente dependency inversion e IoC**
>
> - Hai già tre candidati perfetti: il **provider AI** (OpenAI, Anthropic o Google dietro un’unica interfaccia), il **servizio email** e i **repository** del database. I servizi applicativi dipendono dall’interfaccia, non dall’implementazione concreta.
> - In Node.js non c’è un container IoC “di serie” come in Spring o ASP.NET: decidi se usarne uno (es. awilix, tsyringe, InversifyJS) o fare **iniezione manuale** in un unico punto di composizione. Motiva la scelta.
> - Altri spunti: come applichi autenticazione e controllo ruoli a tutte le route senza ripeterli?

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Dove applicate dependency inversion e IoC, e a cosa servono nel Gestionale Effatà?

| Pattern / principio | Dove lo applico | Problema che risolve |
| --- | --- | --- |
| Dependency inversion |   |   |
| IoC / Dependency injection |   |   |
|   |   |   |
|   |   |   |

## 14.3 Testabilità

> **🧭 Candidati ideali**
>
> - La validazione del **codice fiscale** e la **quadratura del saldo** sono funzioni pure: perfette per test unitari.
> - Grazie alla dependency inversion, nei test l’AI viene **sostituita** da una finta implementazione con JSON prefissato: niente costi e risultati stabili.

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Cosa testerete, e come separate database e API esterne (AI, email, Telegram) per sostituirli nei test?

| Tipo di test | Cosa copre | Strumento |
| --- | --- | --- |
| Unitari |   |   |
| Integrazione (API + DB di test) |   |   |
| Autorizzazione (AC negativi) |   |   |
| Collezione Postman |   |   |

## 14.4 Development e Production

| Aspetto | Development | Production |
| --- | --- | --- |
| Database |   |   |
| Segreti |   |   |
| Log e dettaglio errori |   |   |
| Provider AI |   |   |
| Invio email |   |   |
| Bot Telegram (bot di test separato?) |   |   |
| Swagger UI esposto? |   |   |

# 15. Dimensionamento e costi

**Stato:** **MANCANTE**

*Origine: unione fra la nostra bozza e il template del prof*

| Componente | Servizio | Taglia (CPU, RAM, storage) | Istanze | Costo mensile stimato |
| --- | --- | --- | --- | --- |
| Backend |   |   |   |   |
| Database |   |   |   |   |
| Storage dei file (foto, PDF) |   |   |   |   |
| Backup |   |   |   |   |
| API AI (costo per pagina × pagine/mese) |   |   |   |   |
| Servizio email (Brevo) |   |   |   |   |
| Dominio e certificato |   |   |   |   |
| **Totale** |   |   |   |   |

> **🧭 Domanda che ti farà quasi certamente il prof**
>
> - Chi paga questi costi? Il budget di un’ODV è un vincolo reale (VIN-01) e un ottimo criterio per le scelte del cap. 9.

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> **Strategia di scalabilità.** Verticale o orizzontale? Manuale o automatica?

> *(spazio per appunti)*

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> **Se la stima si rivela sbagliata.** Cosa fate se i sostenitori collegati dopo la newsletter sono il doppio? E se sono la metà?

> *(spazio per appunti)*

# 16. Piano di deployment

> **✔ Orientamento del 24/09/2026 – da confermare nel cap. 9**
>
> Il gestionale può stare sullo **stesso server Hostinger** del bot, come container separato dietro lo stesso Traefik (HTTPS già automatico), con un **database proprio**, per esempio PostgreSQL, più adatto di SQLite a molti utenti contemporanei. Costi e competenze sono già noti. Da valutare: risorse del server sufficienti per entrambi, backup separati, isolamento fra i due sistemi.

**Stato:** **DA RIVEDERE**

*Origine: unione fra la nostra bozza e il template del prof*

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Come il Gestionale Effatà arriva sul cloud scelto. Come si passa da una versione alla successiva. Come vengono gestite nel tempo le modifiche allo schema del database.

> **📄 Dalla tua bozza v2.0**
>
> Containerizzazione Docker e Docker Compose su VPS Linux, Nginx come reverse proxy e certbot per SSL.

> **⚠ Da completare**
>
> - Come arriva il codice sul server: a mano, script, pipeline CI/CD (es. GitHub Actions)? Come si passa da una versione alla successiva?
> - Come vengono applicate le **migrazioni** del database a ogni rilascio? E se una fallisce?
> - Backup di database e foto: frequenza, dove, e hai mai provato un **ripristino**?
> - Il webhook Telegram richiede un URL HTTPS pubblico: coerente con Nginx?
> - Come il sistema diventa raggiungibile pubblicamente per il collaudo.

**✎ Appunti / risposte**

> *(spazio per appunti)*

# Terza parte · Tempi e valutazione

*Quando sarà pronto, e come capirai che funziona.*

# 17. Roadmap e MVP (Milestone)

**Stato:** **DA RIVEDERE**

*Origine: unione fra la nostra bozza e il template del prof*

> **📄 Dalla tua bozza v2.0**
>
> Settimane 1–2: analisi ER e setup DB/API · 3–4: bot Telegram e upload media · 5–6: parser AI OCR e validation layer · 7–8: frontend PWA e bridge Verifico.

> **⚠ Nota di revisione**
>
> - Otto settimane per bot, AI, PWA, pannello admin ed export sono molte per una persona sola: definisci un **MVP**.
> - L’OCR con AI è il modulo più **rischioso**: valuta di spostarlo in fondo o renderlo opzionale, con l’inserimento manuale come alternativa.
> - Autenticazione, ruoli e paginazione conviene averli pronti fin dalle prime settimane.

> **🧭 Dal template**
>
> - Stima il tempo di ogni fase come se tutto andasse bene. Poi aggiungi un margine. Non va mai tutto bene.

## 17.1 Milestone

| Milestone | Cosa è pronto | Data prevista | Responsabile |
| --- | --- | --- | --- |
| PRD validato | Questo documento (consegna), poi presentazione e validazione | Consegna: 09/10/2026 | Andrea Pavan |
| Prima versione in cloud | Fase 1 online e raggiungibile pubblicamente |   | Andrea Pavan |
| Collaudo con utenti reali | Collaudo della fase 1 con amministratore, volontari e alcuni sostenitori |   | Andrea Pavan |
| Fase 2 completata | Funzionalità della fase 2, eventuale secondo collaudo | Entro fine anno scolastico | Andrea Pavan |
|   |   |   |   |
|   |   |   |   |

## 17.2 Priorità e MVP

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

| Priorità | Funzionalità (US) | Motivazione |
| --- | --- | --- |
| Fase 1 – primo collaudo | Dashboard di gestione con ruoli, permessi, impostazioni e vista d’insieme; schede di famiglie, bambini e interventi con adozioni e riaffido; listino dei costi, imputazione delle entrate e rendicontazione completa con checklist di prove; registrazione del sostenitore con consenso privacy e area riservata base con causale standard e carrello con checkout tramite bonifico; importazione del CSV della banca ed esportazione per VERIF!CO | Copre tutti i requisiti obbligatori della traccia; risolve i problemi più urgenti (dati incompleti dei sostenitori, inserimento manuale in VERIF!CO) |
| Fase 2 – entro fine anno | Bot integrato con il gestionale; pagamento con carta (es. Stripe, PayPal, Satispay); area soci; scadenza degli accessi con avvisi email; avviso al sostenitore a rendicontazione completata; recupero dei sostenitori storici | Si appoggia sui dati e sui ruoli della fase 1 |
| Futuro – non incluso | Chat con beneficiari e associazione; integrazione del gruppo WhatsApp; app nativa sugli store; accesso diretto dall’Uganda; interfaccia in inglese; OCR sui PDF degli estratti conto | Vincoli tecnici e di costo; vedi cap. 1.3 |

# 18. Piano di valutazione

**Stato:** **MANCANTE**

*Origine: template del prof – sezione nuova, non presente nella nostra bozza*

> **🧭 Dal template**
>
> - Come capirai che il sistema funziona e che la soluzione ha un impatto positivo?
> - Collega le metriche agli **obiettivi misurabili** del cap. 1.4. Le righe sono proposte da confermare.

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Come capirete che il Gestionale Effatà funziona, e come validerete che sta avendo un impatto positivo sul lavoro dell’associazione?

| Metrica | Obiettivo | Come la misurate | Quando |
| --- | --- | --- | --- |
| Sostenitori che completano il primo accesso senza aiuto | es. 90% | Osservazione durante il collaudo | Collaudo |
| Donazioni perse o duplicate | 0 | Confronto fra estratto conto e donazioni registrate | Primo mese |
| Righe estratte dall’AI corrette senza modifiche |   | Confronto con la revisione del tesoriere |   |
| Ore al mese per la preparazione dati Verifico |   | Confronto con la situazione AS-IS (cap. 3.2) |   |
|   |   |   |   |

# 19. Rischi

**Stato:** **MANCANTE**

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

| Rischio | Probabilità | Impatto | Mitigazione |
| --- | --- | --- | --- |
| L’estratto conto non contiene i dati attesi (es. CF) |   |   |   |
| L’AI estrae dati errati |   |   |   |
| Formato Verifico.it diverso dal previsto |   |   |   |
| Connessione in Uganda insufficiente |   |   |   |
| Violazione di dati di minori |   |   |   |
| Tempi di sviluppo insufficienti |   |   |   |
| Documentazione generata con l’AI non allineata al codice | Alta | Medio | Verifica di ogni affermazione sul codice (tabella di verifica in docs/bot/TECHNICAL-INTEGRATION.md) |
| API del bot esposte senza autenticazione | — | Alto | Risolto il 24/09/2026: token obbligatorio sulle rotte /api/* |
| Cambi nelle API esterne (versioni Meta, modelli AI ritirati) | Media | Medio | Accesso ai servizi esterni isolato in moduli dedicati; verifica periodica di versioni e modelli |
| Poca esperienza con React all’inizio dello sviluppo | Media | Medio | Partire dalle schermate più semplici; struttura del frontend semplice; appoggio al corso parallelo; fase 1 limitata al perimetro minimo |
|   |   |   |   |

# 20. Preparazione alla validazione

**Stato:** **MANCANTE**

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

Il prof validerà il PRD con domande “come farebbe un cliente”. Se non sai rispondere, la sezione collegata non è pronta.

1. Perché un progetto diverso da quello proposto, e come copre gli stessi requisiti (tre ruoli, CRUD, autorizzazioni, dashboard aggregata)?

> *(spazio per appunti)*

2. Quanti utenti concorrenti prevedi nel picco, e da quali numeri lo ricavi?

> *(spazio per appunti)*

3. Cosa succede se il provider AI non risponde durante un’importazione?

> *(spazio per appunti)*

4. Come impedisci a un sostenitore di vedere il bambino di un altro? Dove sta quel controllo nel codice?

> *(spazio per appunti)*

5. Perché quel database e non l’alternativa?

> *(spazio per appunti)*

6. Come gestisci il consenso per le foto dei minori?

> *(spazio per appunti)*

7. Quanto costa al mese il sistema all’associazione?

> *(spazio per appunti)*

8. Cosa succede se la stima di carico è sbagliata del doppio?

> *(spazio per appunti)*

9. Come aggiungi una colonna al database quando il sistema è già in produzione?

> *(spazio per appunti)*

10. Chi hai intervistato per i requisiti impliciti, e cosa ne hai ricavato?

> *(spazio per appunti)*

11. Quale parte è stata progettata con l’AI e quale da te? (Ricorda la nota del prof su Patrick.)

> *(spazio per appunti)*

# 21. Acceptance Criteria di questa PRD

**Stato:** **DA VERIFICARE A FINE LAVORO**

*Origine: template del prof – sezione nuova, non presente nella nostra bozza*

Checklist finale del template, da spuntare prima della consegna.

- [ ] Ogni parte rappresentata dal template ha tutte le sezioni richieste senza saltare nessun punto.
- [ ] Avete deciso tutti i punti che la traccia e gli esempi lasciano aperti (cap. 5.7).
- [ ] Ogni requisito non funzionale ha una soglia e una condizione.
- [ ] Ogni NFR è collegato ad almeno una user story.
- [ ] Avete inserito i requisiti impliciti emersi da interviste che avete fatto.
- [ ] Assunzioni, vincoli e dipendenze sono separati e scritti.
- [ ] I numeri della stima del carico sono coerenti con l’associazione descritta e con il dimensionamento.
- [ ] Ogni scelta tecnica ha almeno un’alternativa scartata e una motivazione.
- [ ] La prima parte non contiene scelte tecniche.
- [ ] Lo storico delle versioni è aggiornato.
- [ ] Aggiuntivo: i riquadri di guida e le note di revisione sono stati cancellati, e il documento sta fra 15 e 25 pagine.

# Appendice A – Ricerca: link e fonti

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

Annota le fonti consultate prima di discuterne con l’AI: documentazione, normativa Terzo Settore e GDPR, formato Verifico.it, esempi di gestionali per ODV.

| Argomento | Link / fonte | Cosa ho imparato |
| --- | --- | --- |
| VERIF!CO – caricamento massivo movimenti | supporto.veryfico.it (Menu Contabilità) | Tracciato master: campi obbligatori, IBAN_MITTENTE, ID_PROGETTO |
| VERIF!CO – sito | www.veryfico.it |   |
| Benchmark: Alice for Children (app MyAlice) | aliceforchildren.it |   |
| Benchmark: Ai.Bi. Amici dei Bambini | www.aibi.it |   |
| Bot Telegram esistente | bot.effataitalia.it |   |
| Sito dell’associazione | effataitalia.it |   |
| Export estratto conto UniCredit (CSV/Excel) |   |   |
| GDPR – categorie particolari (art. 9) e minori |   |   |
|   |   |   |
|   |   |   |
|   |   |   |
|   |   |   |

# Appendice B – Domande da fare all’associazione

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

Tutto ciò che non puoi decidere da solo va chiesto al cliente reale. Annota risposte e data.

| Domanda | Risposta | Data |
| --- | --- | --- |
| Tutti i ~1.200 bambini hanno un sostenitore? |   |   |
| Quante famiglie seguite? Quanti bambini per famiglia in media? |   |   |
| Quanti interventi non di adozione all’anno, per tipo? |   |   |
| Un export di esempio dell’estratto conto UniCredit (CSV/Excel), anonimizzato |   |   |
| Quale versione di VERIF!CO usate (Maxi, Premium, Mini)? |   |   |
| I progetti sono già censiti in VERIF!CO (ID_PROGETTO)? |   |   |
| Come vengono raccolti oggi i consensi per le foto dei bambini? |   |   |
| Quanti soci? Quota annuale e scadenza? |   |   |
| Per gli inviti ai sostenitori storici: contatti più affidabili via email o via WhatsApp? |   |   |
| VERIF!CO (assistenza): si possono esportare in blocco i PDF delle ricevute, e con quale nome dei file? Esiste un’API? |   |   |
|   |   |   |
|   |   |   |
|   |   |   |
|   |   |   |

# Allegato finale – Brain dump iniziale

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

> **🧭 A cosa serve questo allegato**
>
> - Raccoglie il **punto di partenza** del progetto: l’intuizione iniziale, la prima bozza del flusso dei dati e il brain dump libero.
> - Non fa parte del PRD da validare: è la traccia del metodo seguito (prima carta e penna, poi ricerca, poi AI). Utile se in validazione ti chiedono come sei arrivato alle scelte.
> - Il contenuto va **smistato** nei capitoli del PRD; qui resta la versione originale, senza correzioni.

## BD.1 L’intuizione da cui è partito tutto

> **📄 Dalla tua bozza v2.0**
>
> **Inquadramento e problema.** L’associazione Effatà Italia ODV gestisce progetti di solidarietà e adozioni a distanza in Uganda. Attualmente la gestione dei dati dei sostenitori, l’invio degli aggiornamenti (foto, certificati, pagelle dei bambini) e la rendicontazione contabile (preparazione dati per il bilancio su Verifico.it) richiedono un intenso lavoro manuale di data-entry e gestione file.
>
> **Soluzione.** Un sistema integrato e modulare composto da:
>
> 1. **Telegram Bot** – interfaccia veloce per gli operatori in Italia/Uganda per il caricamento di media e la lettura degli estratti conto tramite AI.
> 2. **Backend API (Node.js/Express)** – core applicativo con elaborazione media, AI Vision per OCR estratti conto e validazione algoritmica dei dati.
> 3. **Database relazionale (MySQL/PostgreSQL/SQLite)** – struttura dati normalizzata per sostenitori, adozioni, donazioni e logistica media.
> 4. **Portal Sostenitori (Frontend Angular/Ionic)** – area riservata web/PWA per consultare lo stato dell’adozione, i media e lo storico donazioni/ricevute.
> 5. **Esportazione & Bridge contabile** – modulo per formattare e trasferire le entrate contabili verso Verifico.it.

## BD.2 Bozza iniziale del flusso dei dati (Data Flow Diagram)

> **⚠ Bozza da modificare**
>
> - Questo è il diagramma della bozza v2.0, riportato così com’era. Verrà modificato in base al progetto finale: la versione definitiva andrà al **cap. 10.1** (diagramma dei componenti).
> - Già emerso: mancano pannello amministratore e servizio email; la freccia Database → Verifico va dal backend; il “Bot RPA” è da valutare.

```text
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

Modifiche da apportare man mano:

> *(spazio per appunti)*

## BD.3 Brain dump libero (testo originale)

*Testo originale di Andrea, riportato senza correzioni. Il materiale di ricerca incollato (documentazione VERIF!CO, Alice for Children) è riassunto e le fonti sono nell’Appendice A.*

IL GESTIONALE Effata affiancherà e se possibile comunicherà con il gestionale amministrativo attualmente in uso https://www.veryfico.it/ vuole essere uno strumento che potrebbe in futuro essere utilizzato direttamente anche in uganda per l'inserimento dati e archiviazione nuovi bambini adottati o altri progetti come case costruite, affitto terreni, donazioni di animali di cortile mucca, maiale, capretta, gallina o donazione di materassi o scarpe, sedie a rotelle, pagamento di operazioni chirurgiche.Il contesto è di estrema poverta e scarsissime risorse econiomiche e tecnologiche. Utile per rendicontare le spese dei progetti che ogni donazione fatta in italia colegarla con il beneficiario tenerne traccia e poterlo comunicare.

Quindi l'idea di un portale con chiave di accesso personale da dare a ciascun sostenitore (padrino dei bambini adottati ma anche donante per un operazione chirurgica di un bamnìbini, o l'acquisto di una carozzina, o   l'affitto di un terren0 o acquisto e costruzione di una casetta) potrebbe anche esserte collegato come accesso riservato dal menu del sito esistente di effata https://effataitalia.it/ quindi una password per accedere allo spazio riservato... spazio che si puo entrare come amministratori, come volontari, come soci, come sostenitori - qui dovrebbe essere caricata tutta la informazione di quel utente/donante con l'associazione quindi dal bonifico fatto, alle foro che dimostarno la rendicontazione o le pagelline e le foto dei bambini adottati alle ricevute per la detrazione fiscale (queste attualmente vengono spedite in automatico dal gestionale verifico agli avente diritto).

attualmente esiste un bot telegram https://bot.effataitalia.it/ [segue la guida del bot: vedi la tabella “Bot Telegram esistente” qui sotto]

l'idea è mettere assieme e migliorare questi sistemi di raccolta dati quindi con il bot le immagini, i post, ma inserire dati del bambino o del ricevente la donazione con dati del sostenitore/padrino. attualmente non è pensato un accesso diretto del beneficiario ugandese (soprattutto per problematiche tecnologiche  ed economiche ma potrebbe esserlo per il futuro con uno smartphone dati ai ragazzi piu grandi) - pero si per archiviare e rendere disponobiliontutte le informazioni ai sostenitori. quindi uno spazio dedicato per ogni utente dove riporre lo storico con i beneficiari e con l'associazione... potrebbe essere anche una chat box con il bambino/famiglia e una con l'associazione... tutto da vedere e costruire.

Altra parte importante l'integrazione se possibile con Verifico.. attualmente tutti gli estratti conto sono inseriti nel gestionale amministrativo di Verifico a mani riga per riga e passando da anagrafica a contabilita all'0interno di verifico... verificare se possibile usare i dati dio esportazione della banca (per esempio unicredit) in csv o excel per modificarli nel formato che li riceve verifico: [segue la documentazione VERIF!CO “Caricamento massivo dei movimenti”: vedi la tabella “Tracciato master” qui sotto]

... in modo da poter caricare i dati dei sostenitori e donanti che fanno bonifici leggendo direttamente dagli estratti conto scaricati in formato csv o excel o pdf dalla banca tramite tecnologie come l'OCR o piu avanzate per automatizzate questa operazione che adesso viene fatta manualmenbte ma mantenedo la garanzia assoluta di riservatezza e privacy dei dati. Il primo passo per un sosteniotore sarebbe quello di registrarsi come amico/sostenitore o socio di Effata e firmare un consenso dati alla privacy e gli si viene dato un accesso a questo spazio riservato... che tra l'altro potrebbe non solo essere un accesso riservato al portale di Effata ma adirittura un app di Effata da scaricare. Attualmente i sostenitori fanno parte di un gruppo chiuso whatsapp ma potremmo vedere se ci sono altri modi o se possibile integrare anche questo gruppo e come.. attualmente Silvia in uganda tutte le sere invia le foto di quello che ha fatto ogni giorno quindi una nuova adozuiione o la consegna di materassi o animali o casette in base alle donazioni... poi io di sera seleziono le foro e informazioni e lke passo al bot telegram archiviando dati dei bambini o riceventi e dei sosteniotori con mail e dati... il problema resterebbe l'inserimento di tutti i sosteniotori storici presenti nel gruppo whatsapp di cui abbiamo i dati del gestionale verifico ma spesso sono incompleti per questo l'idea di farsi dare un autorizzazione privacy e dare loro l'accesso al nuovo portale/app dove loro stessi inseriscono i dati potrebbe essere una soluzione... per esempio anche altra ong ha un sistema del genere... [segue una ricerca su Alice for Children / app MyAlice: vedi la sintesi qui sotto]

poi sempre tornando afgli estratti conto se con ocr riusciamo a creare delle tabelle tali da poter importare in verifico.. attualmenet abbiamo tanti buchi perche i sostenitori chiamano silvia in uganda ed iniziamo l'adozione fanno il bonifico senzsa avere una registarzione a monte e ci sono tutti i dati da recuperare... l'intento è quello di provare a dare risposta a tutto questo organizzando e archiviando e comunicando e facilitando ed automatizzando e implementando la IA nella nostra struttura e in questo gestionale tutto da inventare.

### Bot Telegram esistente (bot.effataitalia.it) – funzionalità attuali

| Funzione | Cosa fa oggi |
| --- | --- |
| /start, /help | Istruzioni d’uso nel bot |
| /categoria | Scelta della categoria della storia (es. Adozioni scolastiche, Animali domestici, Costruzione casette) |
| Invio foto e testo | Una o più foto e il testo della storia; conferma di ricezione; rifiuta le foto duplicate |
| /genera | Genera con l’AI i testi per Facebook, Instagram, LinkedIn, blog, Reel/TikTok, YouTube Shorts |
| Domande extra | Per alcune categorie: nome del bambino, nome del sostenitore/padrino/madrina, provincia (“-” per saltare) |
| Pubblicazione | Instagram post e Storie subito; Facebook come bozza; blog WordPress come bozza; altri canali solo testo |
| /bozze | Pubblica le bozze su Facebook e sul canale Telegram con un tocco |
| Dashboard web | Card per storia: Visualizza, Zip, Prendo in carico, Segna pubblicato, “Chi sei?” |
| /status, /reset | Materiale in attesa; ricomincia da capo |
| /report-mese, /report-anno | Riepilogo delle storie per categoria |

### VERIF!CO – Tracciato master per il caricamento massivo dei movimenti bancari

Fonte: supporto.veryfico.it, Menu Contabilità → Caricamento massivo dei movimenti. Tracciati in formato Excel scaricabili da Contabilità → Importazione movimenti. Esistono anche tracciati specifici per PayPal, Stripe e Satispay.

| Campo | Obbl. | Contenuto |
| --- | --- | --- |
| IMPORTO_MOVIMENTO | Sì | Per cassa (Premium/Mini): positivo = entrata, negativo = uscita. Per competenza (Maxi): solo positivi |
| DATA_MOVIMENTO | Sì | Formato gg/mm/aaaa |
| TIPO_PAGAMENTO | Sì | Codice: 1 Online/PayPal, 2 Bonifico, 3 POS, 4 Carta, 5 Addebito/accredito C/C, 6 Assegno, 7 Bollettino, 8 RI.BA., 9 Contanti, 11 Satispay, 12 Bonifico ricorrente |
| IBAN_MITTENTE |   | Aggancia al movimento l’anagrafica che ha quell’IBAN |
| IBAN_DESTINATARIO |   | Aggancia il conto bancario dell’associazione |
| DESCRIZIONE_MOVIMENTO | Sì | Descrizione del movimento contabile |
| ID_PROGETTO |   | ID numerico del progetto in VERIF!CO |
| ID_RACCOLTAFONDI |   | ID numerico della raccolta fondi |
| ID_5PER1000 |   | ID numerico del 5×1000 |
| ID_CESPITE |   | ID numerico del cespite |

### Benchmark citato: Alice for Children – app MyAlice (sintesi)

ONG italiana con sostegni a distanza in Kenya. Offre ai donatori un’app personale in cui: vedere scheda, foto e storia del bambino; scambiare letterine, foto e video con il bambino; ricevere notifiche di report periodici (pagelle, progressi medici); scaricare le ricevute fiscali, rinnovare la quota e prenotare videochiamate. Citata anche Ai.Bi. (Amici dei Bambini), che usa un’area riservata sul sito e comunicazioni via email/WhatsApp. Da verificare direttamente sulle fonti (Appendice A).

## BD.4 Brain dump riordinato per temi e impatto sul PRD

Ogni idea del brain dump è stata assegnata a un tema e al capitolo del PRD dove andrà scritta. Colonna Impatto: **Conferma** (già previsto), **Cambia** (il PRD attuale va modificato), **Nuovo** (non previsto), **Futuro** (candidato a “non incluso” / visione).

| Tema | Cosa hai scritto (sintesi) | Dove va nel PRD | Impatto |
| --- | --- | --- | --- |
| 1. Visione e contesto | Contesto di estrema povertà e scarse risorse tecnologiche. In futuro il sistema potrebbe essere usato direttamente in Uganda per inserire dati. | Cap. 1.1, 3.1, 1.3 | Nuovo / Futuro |
| 2. Rapporto con VERIF!CO | Il gestionale affianca VERIF!CO e, se possibile, comunica con lui. Le ricevute per la detrazione sono già inviate in automatico da VERIF!CO. | Cap. 1.3, 5.4 (US-302), 7.3 | Cambia |
| 3. Beneficiari e tipi di intervento | Non solo bambini adottati: case costruite, affitto terreni, animali (mucca, maiale, capretta, gallina), materassi, scarpe, sedie a rotelle, operazioni chirurgiche. | Cap. 5, 12 (modello dati) | Cambia – forte |
| 4. Rendicontazione | Collegare ogni donazione fatta in Italia al beneficiario, tracciarla e comunicarla; rendicontare le spese dei progetti con foto di prova. | Cap. 1, 5 (nuovo modulo), 12 | Nuovo |
| 5. Area riservata | Portale con accesso personale, raggiungibile dal menu del sito effataitalia.it; possibile app da scaricare. | Cap. 1.2, 9, 10 | Conferma / Cambia |
| 6. Ruoli | Amministratori, volontari, soci, sostenitori. In futuro forse i beneficiari (ragazzi più grandi con smartphone). | Cap. 3.3, 13.2 | Cambia |
| 7. Contenuti per il sostenitore | Bonifici fatti, foto di rendicontazione, pagelle e foto dei bambini, ricevute fiscali: tutto lo storico con beneficiari e associazione. | Cap. 5.4 | Conferma / Nuovo |
| 8. Bot Telegram esistente | Esiste già (categorie, foto, testi AI per i social, pubblicazione, dashboard, report). Idea: unirlo e migliorarlo, aggiungendo i dati di beneficiario e sostenitore. | Cap. 1.2, 3.2, 5.2, 10 | Cambia – non si parte da zero |
| 9. Flusso reale di oggi | Silvia in Uganda ogni sera manda le foto della giornata; Andrea la sera seleziona e passa tutto al bot, archiviando dati di bambini, riceventi e sostenitori. | Cap. 3.2 (AS-IS), 3.3, 4.2 | Cambia – archetipi |
| 10. Comunicazione | Chat con bambino/famiglia e con l’associazione; gruppo WhatsApp chiuso dei sostenitori da integrare o sostituire. | Cap. 1.3, 5.7 | Futuro |
| 11. Estratti conto → VERIF!CO | Oggi inserimento manuale riga per riga. Idea: export CSV/Excel della banca (es. UniCredit) o PDF con OCR, trasformati nel tracciato di importazione VERIF!CO. | Cap. 5.3, 5.5, 7, 9 | Cambia – forte |
| 12. Registrazione e privacy | Primo passo: il sostenitore si registra come amico/sostenitore o socio, firma il consenso privacy e riceve l’accesso; inserisce lui stesso i propri dati. | Cap. 5 (nuova US), 13.4 | Nuovo |
| 13. Dati storici incompleti | Sostenitori storici nel gruppo WhatsApp; dati in VERIF!CO spesso incompleti. | Cap. 5, 7, 16, 19 | Nuovo |
| 14. Bonifici senza registrazione | I sostenitori chiamano Silvia, parte l’adozione e fanno il bonifico senza registrazione: dati da recuperare dopo. | Cap. 5.3 (US-203), 5.7 | Conferma – più grave |
| 15. Benchmark | Alice for Children (app MyAlice), Ai.Bi. | Cap. 1 (nuova sottosezione) | Nuovo |
| 16. IA nella struttura | IA già usata dal bot per i testi social; OCR o tecnologie più avanzate per gli estratti conto. | Cap. 9, 13.3 | Conferma |

### Le scoperte più importanti

- **Il tracciato VERIF!CO cambia US-401.** Le colonne scritte in bozza (Data, Categoria cassa, Causale, Importo, Codice fiscale) non corrispondono al tracciato reale. Il file di esportazione deve seguire il tracciato master: IMPORTO_MOVIMENTO, DATA_MOVIMENTO, TIPO_PAGAMENTO, DESCRIZIONE_MOVIMENTO e i campi facoltativi.
- **IBAN_MITTENTE risolve il problema del codice fiscale.** VERIF!CO aggancia l’anagrafica tramite l’IBAN di chi fa il bonifico: salvare l’IBAN nella scheda sostenitore permette l’abbinamento automatico, e il codice fiscale nell’estratto conto non serve più.
- **Con il CSV della banca forse l’AI non serve.** Se UniCredit esporta CSV/Excel, la lettura è deterministica (nessun errore di interpretazione, nessun dato inviato a terzi). L’AI/OCR resta per i PDF o per suggerire progetto e sostenitore dalla causale. Rischio e costi scendono molto.
- **ID_PROGETTO collega contabilità e rendicontazione.** Se ogni intervento del gestionale conosce l’ID del progetto in VERIF!CO, la donazione arriva in contabilità già imputata al progetto giusto.
- **Il bambino diventa “beneficiario” e serve un’entità “intervento”.** Il modello attuale (Children, Adoptions) non regge casette, animali, operazioni. Serve: Sostenitore → Donazione → Intervento → Beneficiario, con le spese e le foto di rendicontazione legate all’intervento.
- **Operazioni chirurgiche = dati sanitari.** Per il GDPR sono “categorie particolari” (art. 9): richiedono tutele maggiori. Da decidere cosa conservare e chi lo vede.
- **Gli archetipi cambiano.** Oggi l’operatore del bot sei tu in Italia; Silvia in Uganda manda il materiale. Ci sono anche soci e volontari come ruoli distinti.
- **Il perimetro è diventato molto ampio.** Bisogna separare con decisione ciò che serve al collaudo ITS (MVP) dalla visione futura.

## BD.5 Punti da approfondire, in ordine

Li affrontiamo uno alla volta in chat. Dopo ogni punto, la decisione va scritta nel capitolo indicato.

- [ ] Perimetro: cosa deve funzionare al collaudo ITS e cosa è visione futura → cap. 1.3, 17.2
- [ ] Persone e ruoli reali: amministratori, volontari, soci, sostenitori, Silvia, tu → cap. 2, 3.3
- [ ] Beneficiari e tipi di intervento: il modello concettuale → cap. 5, 12
- [ ] Dall’estratto conto a VERIF!CO: formato della banca, IBAN, ID progetto → cap. 5.3, 5.5, 7
- [ ] Rendicontazione e spese di progetto → cap. 5 (nuovo modulo)
- [ ] Registrazione, consenso privacy e recupero dei sostenitori storici → cap. 5, 13.4, 19
- [ ] Bot esistente: tecnologia attuale e cosa riusare → cap. 3.2, 9, 10
- [ ] Area riservata: sito WordPress, web o app → cap. 9, 10
- [ ] Comunicazione: chat e gruppo WhatsApp → cap. 1.3, 5.7
- [ ] Privacy di minori e dati sanitari → cap. 13.4

**✎ Appunti / risposte**

> *(spazio per appunti)*
