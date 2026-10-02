**Product Requirements Document**

**PRD del Gestionale Effatà**

Piattaforma Sostenitori e Automazione Contabile

*Versione 1.6 – versione di lavoro, struttura allineata al PRD Template del docente*

Prima parte · Il cosa   |   Seconda parte · Il come   |   Terza parte · Tempi e valutazione

# Informazioni sul documento

*Origine: unione fra la nostra bozza e il template del docente*

| Campo | Valore |
| --- | --- |
| Prodotto | Gestionale Effatà – Piattaforma Sostenitori e Automazione Contabile |
| Team | ______________ (progetto individuale) |
| Autori | Andrea Pavan |
| Cliente reale | Effatà Italia ODV |
| Contesto | Progetto ITS – 2° anno. Progetto personale che segue la metodologia della traccia “ScuolaChill”. |
| Versione | 1.6 |
| Data | ____ / ____ / ________ |
| Stato | ☐ Bozza   ☐ In revisione   ☐ Validato |

## Storico delle versioni

| Versione | Data | Autore | Cosa è cambiato e perché |
| --- | --- | --- | --- |
| 0.x | 23–24/09/2026 | Andrea Pavan | Bozze di lavoro (numerate internamente da 2.0 a 3.11 nella cronologia di git): bozza iniziale; struttura sul PRD Template del docente; brain dump; prime decisioni su numeri, ruoli, adozioni, interventi, accessi; perimetro in tre fasi; blocchi 1–3 della fase 1; bot esistente e contratto di integrazione; nome del prodotto. |
| 1.0 | 24/09/2026 | Andrea Pavan | Prima versione condivisa con il docente. Capitolo 1 in forma definitiva; flusso rovesciato (prima la registrazione, poi la donazione); simpatizzanti; donante e avente diritto alla detrazione; quietanza e ringraziamenti; canali di entrata; rapporto con VERIF!CO; sanatoria dei dati pregressi in fase 2; OCR non previsto. Gli altri capitoli sono ancora in versione di lavoro. |
| 1.1 | 29/09/2026 | Andrea Pavan | Capitoli 2 (Stakeholder) e 3 (Destinatari e contesto d’uso) in forma definitiva; numeri di amministratori, volontari e soci; VERIF!CO Maxi (solo entrate nel file di caricamento); requisito di passaggio di consegne (NFR-16) e rischio di dipendenza da una sola persona. |
| 1.2 | 30/09/2026 | Andrea Pavan | Capitolo 4.1 in forma definitiva; richieste di sostegno precise nel carrello (uniche o per quantità, costo per richiesta); carrello con preferiti, ricerca e condivisione; pagamento con carta anticipato in fase 1 (bonifico come ultima scelta); chi paga per primo e credito solidale con scadenza a 3 mesi; durata e rinnovo dell’adozione; preferenze di comunicazione; caricamento massivo in VERIF!CO. |
| 1.3 | 01/10/2026 | Andrea Pavan | Capitolo 5 in forma definitiva: 23 user story per amministratore, volontario, sostenitore e socio, con i loro acceptance criteria, e decisioni riordinate per area. Nuove decisioni: consenso della famiglia con modulo unico (FR-CON-01), visibilità dei dati configurabile (FR-RUO-04), compleanno (FR-ADO-05), casa famiglia Effatà come progetto distinto (FR-INT-07), chiusura annuale per le certificazioni (FR-VER-03), obiettivi e andamento (FR-DASH-02), filtri, report e scadenze (FR-REP-01), ricerca (FR-REP-02), impostazioni configurabili (FR-IMP-01), quota associativa (FR-SOC-01). Modifiche: estratto conto mensile; anagrafiche verso VERIF!CO già in fase 1; vetrina riservata agli utenti registrati; credito solidale a 1 mese, poi alla casa famiglia; proposta di imputazione con l’AI in fase 2; uscite e fornitori restano in VERIF!CO. Requisiti impliciti dalle prime quattro interviste e NFR-17/18/19; capitolo 1 aggiornato. |
| 1.4 | 01/10/2026 | Andrea Pavan | Il bot social diventa la porta d’ingresso del materiale di Silvia già in fase 1: un solo caricamento pubblica sui social e alimenta il gestionale tramite API (FR-BOT-01…08), con riconoscimento dei volontari tramite Telegram. Tutte le donazioni passano dal gestionale; Silvia segnala i bisogni, manda le prove e indirizza i padrini alla vetrina. Vetrina con richieste personali e voci fisse (FR-CAT-01, FR-INT-08); casa famiglia divisa in opere e sostegno (calendario solidale, importato in automatico: FR-CAN-03). Non esiste un archivio digitale dei bambini: codici BAM/FAM/RIC generati dal gestionale (FR-COD-01), recupero dei padrini da VERIF!CO e censimento progressivo dei bambini in fase 1 (FR-STO-01, AMM-09). Foto pubbliche e riservate al padrino (FR-FOTO-01); consenso a comparire nei post (FR-COM-02). Nuove storie AMM-09 e VOL-04; aggiornate AMM-01, AMM-02, AMM-04, VOL-01, VOL-02, SOS-01, SOS-03, SOS-07, SOS-09; user flow di AMM-01. |
| 1.5 | 02/10/2026 | Andrea Pavan | Capitolo 4.2 in forma definitiva: user flow, scenario principale e scenari alternativi delle nove storie principali. Accesso ospite di 7 giorni a tutta la vetrina con la sola email, tramite il link promozionale della referente (FR-REG-05); dati raccolti per fasi (ospite, registrazione, prima donazione), con codice fiscale facoltativo e indirizzo non più richiesto (FR-REG-01, FR-FIS-01). Voci fisse senza conteggio delle unità: ogni consegna rendiconta le donazioni in attesa (FR-INT-08). Adozione distinta dall’anno scolastico, che si chiude con la prova di fine anno (FR-ADO-06). Ricerca del beneficiario nel bot filtrata per tipo di invio (FR-BOT-05); foglio provini e domanda sulle informazioni sanitarie (FR-BOT-04). Caricamento in VERIF!CO: anagrafiche prima dei movimenti, tracciato Stripe collegato tramite l’email, destinazione contabile tramite i Progetti, versamenti di Stripe come giroconto (FR-INT-02, FR-VER-01/02). Recupero dei padrini dal 2025 con la regola dei 180 € (FR-STO-01). Numeri dell’associazione da VERIF!CO (solo totali), 10 soci, Satispay tramite Stripe. Aggiornate AMM-04, AMM-06, AMM-09, VOL-01, VOL-02, VOL-03, SOS-01, SOS-02, SOS-03, SOS-04, SOS-07. |
| 1.6 | 02/10/2026 | Andrea Pavan | Capitoli 6, 7, 8 e 9 in forma definitiva. Requisiti non funzionali NFR-01…20 con soglia, verifica e storie: disponibilità 99%, backup notturni con copia esterna, conservazione per 10 anni, accessibilità provata con tre sostenitori sopra i 60 anni, risposte al bot entro 1 s (NFR-20). Assunzioni, vincoli e dipendenze completi (ASS-09, VIN-06/07, scadenze e responsabili di tutte le dipendenze). Stima del carico: picco di 50 utenti nello stesso minuto dopo la newsletter, circa 5 GB di dati all’anno. Scelte tecnologiche decise, una per riga: NestJS, Prisma, Ionic + React PWA, PostgreSQL 16, VPS Hostinger a Parigi con Docker Compose, Brevo, Stripe, Claude solo nel bot (Sonnet 5.5 e Haiku 4.5). Nuovo rischio sulla sicurezza del server. |
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
> **Numerazione delle versioni.** La versione cambia solo quando cambiano le decisioni, non a ogni ritocco. **Versione intermedia (1.1, 1.2…):** una per sessione di lavoro che aggiunge o cambia requisiti, perimetro o scelte, con una riga nello storico e il motivo. **Versione principale (2.0, 3.0…):** alle tappe, cioè la consegna del 9 ottobre (2.0) e la versione validata dal docente. **Correzioni minori** (refusi, formattazione, riformulazioni): nessun cambio di versione, solo un commit `docs: descrizione`.
>
> **Ogni nuova versione:** 1) aggiornare il PRD e lo storico; 2) aggiornare `docs/DIARIO.md`; 3) commit `update: descrizione (PRD vX.Y)` e tag git `prd-vX.Y`.
>
> **Dopo la validazione, il “come” di dettaglio vive nel codice**, generato o verificato automaticamente: la specifica OpenAPI/Swagger per le API, le migrazioni per lo schema del database, i file di configurazione e gli script per il deployment, le milestone e le issue di GitHub per i tempi.
>
> **Il codice segue il PRD.** Ogni comportamento del sistema deve corrispondere a quanto scritto nel PRD. Se durante lo sviluppo emerge che un requisito va cambiato (un vincolo tecnico, una richiesta dell’associazione, un errore di analisi), **prima si aggiorna il PRD** con una nuova versione e il motivo, **poi si modifica il codice**. Se invece il codice fa qualcosa di diverso dal PRD senza che ci sia stata una decisione, è un difetto del codice e va corretto. Un PRD che dice una cosa mentre il codice ne fa un’altra è peggio di nessun PRD (template del docente).

# Come usare questo documento

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

Questa versione segue **lo schema del PRD Template del docente**: tre parti (il cosa, il come, tempi e valutazione) con i suoi titoli e le sue tabelle. Tutto il contenuto della nostra bozza è stato mantenuto e spostato nella sezione corrispondente.

### Doppi titoli

Quando il nostro titolo è diverso da quello del template, il titolo del template è riportato **tra parentesi**. Esempio: “Scelte tecnologiche con alternative considerate (Scelte tecnologiche)”. Sotto ogni titolo una riga grigia indica l’origine della sezione: nostra bozza, template del docente, o unione delle due.

### Legenda dei riquadri

> **🧭 Guida – cosa chiede la traccia**
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
> Le domande e gli esempi in corsivo del template del docente, riscritti per Effatà. Sono le parti da sostituire con il tuo testo.

Come dice il template: i riquadri di consiglio vanno **cancellati prima della consegna**, e il testo definitivo sostituisce spazi vuoti e appunti.

## Corrispondenza fra template e questo documento

| Sezione del template | Capitolo qui | Origine |
| --- | --- | --- |
| Informazioni sul documento + Storico versioni | Informazioni sul documento | Unione |
| — (non presente) | Gestione delle modifiche | Nostra |
| Scopo e perimetro | 1. Scopo e perimetro | Definitivo |
| Stakeholder | 2. Stakeholder | Definitivo |
| Destinatari e contesto d’uso | 3. Destinatari e contesto d’uso | Definitivo |
| Panoramica e casi d’uso | 4. Panoramica e casi d’uso | Definitivo |
| Requisiti funzionali | 5. Requisiti funzionali | Definitivo |
| Requisiti non funzionali (+ impliciti) | 6. Requisiti non funzionali | Definitivo |
| Assunzioni, vincoli e dipendenze | 7. Assunzioni, vincoli e dipendenze | Definitivo |
| Stima del carico | 8. Stima del carico | Definitivo |
| Scelte tecnologiche | 9. Scelte tecnologiche con alternative | Definitivo |
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
| — (non presente) | 20. Domande di verifica (autovalutazione) | Nostra |
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
| 1 | Scopo e perimetro | DEFINITIVO (v1.0) | ☑ |
| 2 | Stakeholder | DEFINITIVO (v1.1, aggiornato v1.5) | ☑ |
| 3 | Destinatari e contesto d’uso | DEFINITIVO (v1.1, aggiornato v1.5) | ☑ |
| 4 | Panoramica e casi d’uso | DEFINITIVO (4.1 v1.2; 4.2 v1.5) | ☑ |
| 5 | Requisiti funzionali | DEFINITIVO (v1.5) | ☑ |
| 6 | Requisiti non funzionali + impliciti | DEFINITIVO (v1.6; manca l’intervista a un sostenitore) | ☑ |
| 7 | Assunzioni, vincoli e dipendenze | DEFINITIVO (v1.6) | ☑ |
| 8 | Stima del carico | DEFINITIVO (v1.6) | ☑ |
| 9 | Scelte tecnologiche | DEFINITIVO (v1.6) | ☑ |
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
| 20 | Domande di verifica (autovalutazione) | MANCANTE | ☐ |
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

# 1. Scopo e perimetro

## 1.1 Perché esiste il Gestionale Effatà

**Dal lato business.** Oggi Effatà Italia gestisce con strumenti separati e molto lavoro manuale il rapporto con i propri sostenitori: gli estratti conto vengono inseriti riga per riga in VERIF!CO, i dati dei sostenitori sono spesso incompleti, molti bonifici arrivano senza una registrazione a monte e le foto dall’Uganda passano a mano da WhatsApp al bot. Per questo è difficile collegare ogni donazione al suo beneficiario e dimostrare a chi dona che l’aiuto è arrivato. Il Gestionale Effatà serve agli amministratori e ai volontari, ai 700–800 sostenitori e ai soci, e indirettamente ai circa 1.200 bambini e alle loro famiglie in Uganda: meno lavoro manuale, dati completi e trasparenza verso chi dona. L’obiettivo di fondo è rovesciare il flusso di oggi: prima la persona si registra, con i suoi dati, i consensi e le informazioni per la detrazione, poi parte l’adozione o la donazione, già corretta e tracciabile fin dal primo bonifico.

**Dal lato tecnico.** Il sistema accompagna la persona dalla registrazione in poi: raccolta dei dati e del consenso privacy, spazio riservato con lo storico delle proprie donazioni e dei beneficiari, carrello solidale con richieste di sostegno precise e pagamento con carta o bonifico. Riunisce in un unico punto di accesso, per i sostenitori e per l’associazione, informazioni oggi sparse fra il bot e il gestionale contabile, e le smista verso chi deve riceverle. I dati verso VERIF!CO passano con caricamenti massivi invece dell’inserimento a mano, e i dati storici vengono completati. La comunicazione diretta con i beneficiari è prevista in futuro.

## 1.2 Cosa è incluso

**Fase 1 – prima versione in cloud e primo collaudo**

- **Gestione dell’associazione:** dashboard per amministratori e volontari, con ruoli, permessi configurabili e visibilità dei dati non sensibili decisa dall’amministratore; vista d’insieme con i numeri principali, le anomalie, l’andamento mese per mese e il confronto con gli obiettivi annuali per capitolo (previsionale); ricerca di persone e beneficiari; elenchi filtrabili ed esportabili in Excel; sezione Scadenze; “Cose da fare” per i volontari.
- **Anagrafiche:** simpatizzanti, sostenitori, famiglie e bambini; adozioni a distanza con riaffido e storico; consenso della famiglia con un modulo unico caricato nella scheda famiglia e applicato automaticamente a foto, pubblicazione e compleanno.
- **Richieste di sostegno:** richieste personali per un beneficiario preciso (adozione scolastica, adozione in casa famiglia, operazione, carrozzina, costruzione casa, affitto terreno agricolo, acquisto terreno edificabile), con foto, storia e costo propri; voci fisse sempre presenti (materassi, scarpe, animali, opere e sostegno della casa famiglia); le richieste nascono dal bot o dal gestionale e l’amministratore le approva.
- **Collegamento con il bot social:** un solo caricamento del materiale di Silvia pubblica sui social e porta foto, testi e prove nel gestionale; il bot riconosce ogni volontario e ne rispetta i permessi.
- **Recupero dei dati esistenti:** importazione dei padrini da VERIF!CO e degli indizi già raccolti dal bot; censimento progressivo dei bambini e abbinamento padrino–bambino confermato dalla referente.
- **Interventi e rendicontazione:** imputazione delle entrate ai capitoli (compresi la casa famiglia Effatà e la Cassa sostegno Effatà), checklist delle prove di realizzazione.
- **Area riservata:** accesso ospite di 7 giorni alla vetrina con la sola email; registrazione con email, password e presa visione dell’informativa privacy (chi si registra è simpatizzante, diventa sostenitore con la prima donazione); dati del donante e dell’avente diritto alla detrazione; preferenze di comunicazione; verifica in due passaggi; storico delle donazioni e di ciò che si è sostenuto, con la rendicontazione; riepilogo annuale.
- **Carrello solidale:** vetrina riservata agli utenti registrati, con ricerca e filtri fra le richieste aperte, quelle sostenute di recente e le voci fisse, più il collegamento al calendario solidale; preferiti; condivisione di una richiesta su WhatsApp; pagamento con carta (tramite un fornitore di pagamenti) o, come ultima scelta, con bonifico e caricamento della quietanza; credito solidale quando una richiesta è già stata sostenuta da altri.
- **Comunicazioni automatiche:** conferma della donazione con il ringraziamento (non valida ai fini fiscali), ringraziamento alla chiusura di un’adozione, promemoria per i bonifici in attesa di quietanza, email settimanali del credito solidale.
- **Contabilità:** importazione mensile dell’estratto conto UniCredit e importazione automatica delle donazioni del calendario solidale, conferma delle donazioni, quadrature e preparazione dei file per il caricamento massivo in VERIF!CO (movimenti e anagrafiche nuove o modificate); checklist di chiusura annuale per le certificazioni.

**Fase 2 – entro la fine dell’anno scolastico**

- Altri metodi di pagamento (PayPal, Satispay) e pagamento ricorrente con carta.
- Rinnovo delle adozioni con promemoria.
- Area soci: richiesta di adesione, quota associativa con storico e pagamento, convocazioni con risposta di partecipazione, verbali e bilanci.
- Scadenza degli accessi inattivi, con avvisi via email.
- Avvisi al sostenitore per nuove foto e interventi rendicontati; email per il compleanno del bambino; pulsante “Scrivi un messaggio” verso l’associazione.
- Proposta automatica dell’imputazione delle causali libere con l’AI, sempre confermata dall’amministratore.
- Inviti personali ai padrini storici per collegarsi al proprio storico, ritorno delle anagrafiche complete verso VERIF!CO; raccolta graduale dei moduli di consenso delle famiglie attuali.
- Invito a registrarsi per i donatori delle campagne esterne.
- Spazio informativo: collegamenti ai contenuti pubblicati sul sito dell’associazione (newsletter, informative, volantini, eventi, 5×1000).

## 1.3 Cosa non è incluso

- **Contabilità ufficiale e certificazioni fiscali:** restano in VERIF!CO, comprese uscite, fornitori e bilancio. Il gestionale prepara i dati delle entrate e delle anagrafiche, ma non produce documenti fiscali: le certificazioni per la detrazione sono inviate da VERIF!CO una volta l’anno.
- **Newsletter:** creazione e invio restano in VERIF!CO.
- **Pubblicazione sui social:** resta al bot esistente, che il gestionale integra senza sostituirlo.
- **Pubblicazione di contenuti informativi:** resta sul sito dell’associazione; il gestionale vi rimanda con collegamenti.
- **Spese effettive dei progetti:** la spesa di un intervento coincide con il costo dichiarato nel listino; non si registrano fatture di spesa.
- **Lettura automatica (OCR) degli estratti conto in PDF:** non prevista, perché la banca fornisce gli estratti conto in formato CSV/Excel, leggibili in modo esatto.
- **Chat** fra sostenitori, famiglie e associazione, e integrazione del **gruppo WhatsApp**.
- **App sugli store** (Apple, Google): il sistema è una web app installabile dal browser.
- **Accesso diretto dall’Uganda** per Silvia e i volontari locali, e interfaccia in **inglese**.

*Gli obiettivi misurabili del progetto sono nel capitolo 18, Piano di valutazione.*

# 2. Stakeholder

| Stakeholder | Cosa fa | Cosa gli interessa | Come lo coinvolgiamo |
| --- | --- | --- | --- |
| **Presidente e amministratore** (i due soci fondatori di Effatà Italia ODV; l'amministratore può coincidere con il tesoriere registrato in VERIF!CO, da verificare) | Decidono le priorità, approvano il progetto e i costi, gestiscono anagrafiche e contabilità | Trasparenza verso i donatori, sostenibilità economica, meno lavoro manuale, dati corretti | Presentazione del PRD, approvazione del perimetro, verifica dei formati VERIF!CO, collaudo della fase 1 |
| **Volontari in Italia** (circa 12) | Caricano dati e foto secondo i permessi ricevuti; oggi pubblicano le storie con il bot | Strumenti semplici e compiti chiari | Configurazione dei permessi, collaudo |
| **Silvia, referente in Uganda** | Ogni sera invia foto e notizie via WhatsApp; è il primo contatto di molti sostenitori; è tutore dei bambini della casa famiglia; custodisce negli appunti cartacei il collegamento fra padrini e bambini | Continuare a usare WhatsApp; meno richieste di dati mancanti | Consultata sul nuovo flusso: indirizza i padrini alla vetrina invece di gestire le donazioni; compila gli elenchi dei bambini per villaggio; conferma gli abbinamenti; in futuro accesso diretto |
| **Sostenitori** (circa 700 padrini, oltre 1.000 donatori in archivio) **e simpatizzanti** | Donano, adottano, seguono i beneficiari | Vedere dove va la propria donazione, detrazione fiscale, riservatezza | Intervista per i requisiti impliciti; collaudo con alcuni sostenitori reali |
| **Soci** (10) | Gli associati registrati dal 23/05/2023: presidente, tesoriere e 8 volontari; l'associazione intende aprire l'adesione, con quota associativa, a chi vorrà partecipare | Quote, assemblee, documenti | Area soci in fase 2 |
| **Bambini e famiglie in Uganda** (circa 1.200 bambini) | Ricevono adozioni e interventi; non usano il sistema | Tutela della privacy e uso corretto di foto e dati | Consensi raccolti dal genitore o tutore tramite la referente; minimizzazione dei dati |
| **Donatori delle campagne esterne** | Donano tramite piattaforme come GoFundMe | Semplicità e fiducia | Invito alla registrazione (fase 2) |
| **Commercialista** | Usa VERIF!CO per contabilità e bilancio | Dati corretti e conformi (detrazioni, commissioni) | Verifica del formato di importazione e delle regole fiscali |
| **Docente del corso** | Valida il PRD | Rispetto della traccia e del metodo, scelte motivate | Presentazione e domande; repository condivisa |
| **Collaudatori reali** | Usano il sistema durante il collaudo | Facilità d'uso | Collaudo della fase 1 |
| **Chi manterrà il sistema** | Andrea Pavan, come volontario; con la possibilità di affidarlo ad altri sviluppatori | Codice comprensibile, documentazione aggiornata, costi contenuti | README, documentazione nel codice (OpenAPI, test), account di servizio intestati all'associazione |

VERIF!CO, UniCredit, Brevo e Hostinger non sono stakeholder ma **fornitori**: compaiono fra le dipendenze del capitolo 7.

# 3. Destinatari e contesto d'uso

## 3.1 L'associazione

Effatà Italia Charity Organisation ODV è un'organizzazione di volontariato con sede in Italia che sostiene bambini e famiglie in condizioni di estrema povertà in Uganda: adozioni a distanza, costruzione di casette, affitto di terreni, animali da cortile, materassi, scarpe, sedie a rotelle, operazioni chirurgiche. È guidata dai due soci fondatori (presidente e amministratore); gli associati sono 10 e i volontari in Italia circa dodici; in Uganda l'attività è seguita da una referente locale, Silvia. La contabilità, le anagrafiche e la newsletter sono gestite con VERIF!CO; la comunicazione con i sostenitori passa oggi da un gruppo WhatsApp; le storie dei beneficiari vengono pubblicate sui social tramite un bot sviluppato internamente.

| | Valore | Fonte |
| --- | --- | --- |
| Sostenitori | Circa 700 padrini con un’adozione (690 nel 2025); 1.067 anagrafiche in VERIF!CO (1.021 persone, 46 enti) | VERIF!CO, ottobre 2026 |
| Donazioni | 2025: circa 567.000 € di erogazioni liberali in circa 1.850 movimenti; 2026, fino a settembre: circa 208.000 € | VERIF!CO, ottobre 2026 |
| Quota di adozione | 180 € per anno scolastico, senza rate | Associazione, ottobre 2026 |
| Dati delle anagrafiche | Codice fiscale 99,6%, email 71%, cellulare 31%, indirizzo 3%; nessun IBAN | VERIF!CO, ottobre 2026 |
| Bambini adottati | circa 1.200 (1,5–1,7 per sostenitore; un solo sostenitore attivo per bambino) | Associazione, settembre 2026 |
| Famiglie seguite | *da verificare* | |
| Interventi non di adozione all'anno | *da verificare* | |
| Soci | 10 associati (presidente, tesoriere e 8 volontari, dal 23/05/2023); adesione con quota da aprire ad altri in futuro | VERIF!CO, ottobre 2026 |
| Amministratori | 2 (presidente e amministratore, soci fondatori; l'amministratore può coincidere con il tesoriere) | Associazione, settembre 2026 |
| Volontari in Italia | circa 12 | Associazione, settembre 2026 |
| Referente in Uganda | 1 (Silvia); oggi invia il materiale via WhatsApp | Associazione |
| Iscritti alla newsletter | *da verificare in VERIF!CO* | |
| Canali delle donazioni | Conto UniCredit; campagne esterne (es. GoFundMe); calendario solidale (sito calendario.effataitalia.it, carta e Satispay tramite Stripe, dal 2026) | Associazione, ottobre 2026 |
| Archivio dei bambini | Non esiste un elenco digitale né un codice dei bambini: in VERIF!CO ci sono i padrini e, nelle note di 248 anagrafiche, il nome del bambino; il collegamento padrino–bambino è negli appunti cartacei della referente | Associazione, ottobre 2026 |
| Gestionale contabile | VERIF!CO Maxi (contabilità per competenza; piano dei conti attuale dal 2025) | Associazione, settembre 2026 |
| Estratto conto | Esportazione CSV/Excel, caricata ogni mese | Associazione, ottobre 2026 |
| Orari d'uso | Amministratori e volontari soprattutto la sera; sostenitori in qualsiasi momento, con picchi dopo l'invio della newsletter e a inizio anno (detrazioni) | Stima |
| Connettività | Buona in Italia; debole e costosa in Uganda (rilevante solo per l'accesso futuro dall'Uganda) | Associazione |

## 3.2 Gli archetipi

| ID | Archetipo | Contesto d'uso | Competenze digitali | Dispositivo principale | Frequenza d'uso |
| --- | --- | --- | --- | --- | --- |
| ARC-001 | **Amministratore** (presidente e amministratore) | Imputa le entrate, abbina le donazioni, rendiconta, prepara i dati per VERIF!CO, configura regole e permessi | Medio-alte: usa VERIF!CO e i fogli di calcolo | PC | Settimanale, più intensa a ogni importazione mensile e nella chiusura annuale (gennaio–febbraio) |
| ARC-002 | **Volontario** (circa 12) | Carica foto e dati dei beneficiari secondo i permessi ricevuti; spesso la sera, a partire dal materiale inviato da Silvia | Base o intermedie: usa WhatsApp e Telegram | PC la sera, smartphone | Settimanale o quotidiana |
| ARC-003 | **Sostenitore e simpatizzante** | Si registra, dona o adotta, carica la quietanza, guarda foto e aggiornamenti; arriva spesso da un link nell'email o su WhatsApp | Base; molti sostenitori non sono giovani | Smartphone | Sporadica: 1–2 volte al mese, di più dopo una newsletter o una nuova foto |
| ARC-004 | **Socio** | Oltre a quanto fa il sostenitore, consulta quote e documenti associativi (fase 2) | Base | Smartphone o PC | Occasionale |

Una persona può avere più ruoli insieme (per esempio sostenitore e socio, oppure volontario e socio). La referente in Uganda non è per ora un utente del sistema: il suo accesso diretto è previsto in futuro (cap. 1.3).

## 3.3 Come si lavora oggi e come si lavorerà

**Oggi.** Molti sostenitori contattano Silvia, l'adozione parte, e il bonifico arriva spesso senza una registrazione a monte: i dati vanno ricostruiti dopo. Silvia invia ogni sera foto e notizie nel gruppo WhatsApp; un volontario le seleziona e le passa al bot, che genera i contenuti social e manda il ringraziamento al padrino. Gli estratti conto vengono inseriti a mano, riga per riga, in VERIF!CO, che invia poi le certificazioni per la detrazione. Le offerte del calendario solidale arrivano su un sito separato.

**Domani.**

1. Silvia manda nel gruppo WhatsApp foto e storia di un bisogno; il volontario le trascina nel bot, che pubblica sui social e crea la richiesta in bozza nel gestionale; l'amministratore la approva e la richiesta va in vetrina.
2. Silvia non gestisce più la donazione: manda al padrino interessato il collegamento della richiesta, oppure il link promozionale che per 7 giorni apre tutta la vetrina con la sola email.
3. Per donare la persona si registra come simpatizzante (nome, cognome, email, password) e alla prima donazione indica il codice fiscale ed eventualmente l'avente diritto alla detrazione.
4. Sceglie la richiesta o la voce fissa dal carrello e paga con carta o Satispay, oppure con bonifico e causale standard caricando la quietanza: parte la conferma di donazione con il ringraziamento.
5. Quando Silvia manda le foto dell'aiuto consegnato, il volontario le carica nel bot: escono sui social e diventano la rendicontazione che il sostenitore vede nella sua area.
6. All'importazione mensile dell'estratto conto la donazione viene confermata e passa a VERIF!CO; a inizio anno VERIF!CO invia a tutti la certificazione per la detrazione.

Il bot social resta lo strumento con cui i volontari pubblicano; il suo collegamento con il gestionale è descritto nel capitolo 5.6 (FR-BOT) e nel capitolo 11.5, la sua struttura attuale nel documento `docs/bot/TECHNICAL-INTEGRATION.md`.

# 4. Panoramica e casi d’uso

## 4.1 Il Gestionale Effatà in poche righe

Il Gestionale Effatà è lo spazio online dell’associazione, raggiungibile dall’area riservata del sito o installabile sul telefono come un’app. Chiunque voglia avvicinarsi a Effatà si registra come simpatizzante e trova le informazioni sull’associazione; con la prima donazione diventa sostenitore.

Il cuore è un “carrello solidale”, come nei negozi online, ma al posto dei prodotti ci sono richieste di sostegno vere: l’adozione scolastica di un bambino preciso, l’accoglienza di un bambino con disabilità nella casa famiglia Effatà, una carrozzina, una capretta o delle galline per una famiglia, un terreno, una casetta, delle scarpe. Ogni richiesta ha le foto e la storia che Silvia ci manda dall’Uganda, le stesse che pubblichiamo sui social e sul blog, e il suo costo. Il sostenitore sceglie, paga con la carta oppure con un bonifico caricando la ricevuta della banca, e riceve subito la lettera di ringraziamento. Se nel frattempo qualcun altro ha già sostenuto la stessa richiesta, la sua donazione diventa un credito da usare per un’altra.

Da quel momento, nella sua area, segue ciò che ha sostenuto: l’iscrizione a scuola, le foto della consegna, i documenti, lo storico delle sue donazioni. Ognuno vede solo ciò che ha donato lui.

Per l’associazione, amministratori e volontari lavorano sugli stessi dati, ciascuno con i permessi che gli spettano; i soci trovano i documenti della vita associativa. I dati arrivano completi fin dall’inizio e passano a VERIF!CO in un’unica operazione, senza essere ricopiati a mano.

## 4.2 User flow e scenari

Per ogni storia principale (★ nel capitolo 5) sono descritti il percorso passo per passo, uno scenario concreto e gli scenari alternativi. Nomi, codici e importi sono di fantasia. Le storie del volontario VOL-01 e VOL-02 si svolgono nel bot; tutte le altre nel gestionale web.

### Amministratore (ARC-001)

| Voce | Contenuto |
| --- | --- |
| **Storia** | AMM-01 · Pubblicare una richiesta di sostegno |
| **User flow** | 1. Silvia manda nel gruppo WhatsApp foto e testi di un bisogno. 2. Il volontario trascina tutto nel bot e sceglie 🆘 Richiesta di aiuto, poi la categoria (es. adozione scolastica). 3. Il bot legge dal messaggio di Silvia il nome del bambino e chiede al gestionale i candidati, solo fra i bambini senza sostenitore: se ne resta uno chiede la conferma, altrimenti li mostra con codice, età, villaggio e foto profilo e il volontario tocca quello giusto; “Cerca fra tutti” allarga la ricerca, “Nessuno: è nuovo” lo propone come nuovo. 4. Il bot propone il costo di listino; il volontario lo conferma o indica l’importo scritto da Silvia. 5. Il bot chiede al gestionale se la famiglia ha il modulo di consenso. 6. Nel foglio provini, l’anteprima numerata delle foto, il volontario tocca le foto per i social nell’ordine della storia. 7. Il bot pubblica i post e invia al gestionale tutte le foto (le scelte come pubbliche, le altre come riservate al padrino), i testi agganciati e il testo proposto per la vetrina. 8. Il gestionale crea la richiesta in bozza; l’amministratore la trova nell’email riassuntiva del giorno. 9. L’amministratore corregge se serve testo, foto, copertina, costo, oppure la rimanda al volontario con una nota, e la approva. 10. La richiesta compare in vetrina come “aperta” con il suo codice (RIC-0042); Silvia ne manda il collegamento ai padrini interessati. |
| **Scenario principale** | Martedì sera Silvia scrive nel gruppo: “Grace, 7 anni, vorrebbe andare a scuola”, con venti foto. Marta, volontaria, le trascina nel bot; delle tre Grace in archivio solo una non ha un sostenitore, BAM-0215, e Marta conferma guardando la foto profilo. Sceglie otto foto per i social, nell’ordine del racconto. Il post esce, la bozza arriva nel gestionale. Mercoledì mattina l’amministratore riceve l’email “1 bozza da approvare”, cambia la foto di copertina e approva. Giovedì una sostenitrice apre il collegamento ricevuto da Silvia e sostiene Grace con la carta. |
| **Scenari alternativi** | **Più candidati:** il bot li mostra con età, villaggio e foto profilo, il volontario sceglie. **Bambino non in archivio:** il volontario lo propone come nuovo (nome, età, famiglia, villaggio); l’amministratore conferma la scheda insieme alla richiesta e il gestionale assegna il codice. **Famiglia senza modulo di consenso:** il bot non pubblica sui social, le foto arrivano comunque al gestionale ma restano non visibili e la bozza non si può approvare finché il modulo non è caricato. **Bozza da correggere:** l’amministratore la corregge o la rimanda al volontario con una nota. **Gestionale non raggiungibile:** il post esce, il bot mette l’invio in coda, ritenta ogni 10 minuti e avvisa il volontario quando è arrivato. **Volontario senza permesso:** il bot non mostra il bottone 🆘. **Costo da cambiare dopo un pagamento:** non si può più; storia e foto restano modificabili. **Nessun sostenitore dopo 30 giorni:** la richiesta compare fra le segnalazioni. |

| Voce | Contenuto |
| --- | --- |
| **Storia** | AMM-04 · Importare l’estratto conto e confermare le donazioni |
| **User flow** | 1. All’inizio del mese l’amministratore scarica da UniCredit l’estratto del mese precedente (CSV o Excel); la sezione Scadenze glielo ricorda entro il giorno 10. 2. Nel gestionale apre “Contabilità → Importa estratto conto” e carica il file. 3. Il gestionale ignora le uscite e scarta i movimenti già importati. 4. Per ogni entrata cerca la corrispondenza: una donazione dichiarata con quietanza (stesso importo, data vicina, causale standard) passa a “confermata”; un versamento di Stripe viene collegato ai pagamenti con carta e Satispay già registrati, compresi quelli del calendario solidale; un IBAN già noto viene abbinato al suo sostenitore; un nome nella causale che corrisponde a un sostenitore diventa una proposta di abbinamento. 5. Il gestionale mostra il riepilogo, per esempio “58 confermate · 3 versamenti Stripe quadrati · 6 da abbinare · 1 anomalia”. 6. Per ogni entrata da abbinare l’amministratore conferma la proposta con un clic, oppure collega l’entrata a un sostenitore esistente (e l’IBAN viene ricordato), crea un’anagrafica da completare o la mette nella Cassa sostegno. 7. Le anomalie restano nella vista d’insieme finché l’amministratore non le risolve. 8. Le donazioni confermate sono pronte per i file di VERIF!CO (AMM-06). |
| **Scenario principale** | Il 5 novembre l’amministratore carica l’estratto di ottobre: 72 righe. In un minuto il gestionale conferma 58 donazioni dichiarate e quadra i 3 versamenti di Stripe. Restano 6 bonifici da IBAN sconosciuti: 4 sono di padrini storici, riconosciuti dal nome nella causale, e li collega con un clic; 1 è di una persona nuova, di cui crea l’anagrafica da completare; 1 ha la causale “offerta” e va nella Cassa sostegno. In un quarto d’ora ottobre è chiuso. |
| **Scenari alternativi** | **File già caricato** o periodo che si sovrappone: le righe già presenti vengono riconosciute e non si duplicano. **Formato del file sbagliato** (non CSV/Excel, o colonne diverse da quelle attese): errore chiaro, nulla viene importato. **Quietanza senza bonifico:** la donazione dichiarata non si trova nel mese e diventa un’anomalia; l’amministratore aspetta il mese successivo oppure annulla la donazione e riapre la richiesta. **Versamento di Stripe che non torna** (es. un rimborso o una commissione diversa): anomalia, con la differenza indicata. **Importo diverso dalla quietanza:** se è maggiore, la differenza va nella Cassa sostegno; se è minore, l’amministratore riceve una segnalazione. **Estratto non importato entro il giorno 10:** il promemoria resta in Scadenze. **Volontario** che prova a importare: operazione negata. |

| Voce | Contenuto |
| --- | --- |
| **Storia** | AMM-06 · Preparare il caricamento in VERIF!CO |
| **User flow** | 1. Chiuso l’estratto del mese (AMM-04), l’amministratore apre “Contabilità → Prepara VERIF!CO” e sceglie il mese. 2. Il gestionale controlla le quadrature: esclude le donazioni ancora “dichiarate” o con anomalie aperte e dice quante sono; se i totali non tornano, blocca e mostra la differenza. 3. File 1, anagrafiche: i sostenitori nuovi o modificati nel mese, con il codice fiscale e un’email uguale a quella usata nei pagamenti. 4. File 2, bonifici: il tracciato master, una riga per ogni bonifico confermato, con importo, data, causale, IBAN del mittente e progetto. 5. File 3, pagamenti con carta e Satispay: il tracciato Stripe, una riga per ogni pagamento (calendario compreso), con l’email del donatore e il progetto. 6. Il gestionale indica l’ordine di caricamento, prima le anagrafiche e poi i movimenti, e ricorda che i versamenti di Stripe sull’estratto si registrano come giroconto, non come donazioni. 7. L’amministratore carica i file in VERIF!CO da “Contabilità → Importazione movimenti” e segna nel gestionale il mese come “caricato”. 8. Da quel momento ogni correzione su quel mese resta tracciata, e il gestionale avvisa che va riportata anche in VERIF!CO. |
| **Scenario principale** | Il 6 novembre, chiuso ottobre, l’amministratore prepara i file: 4 anagrafiche nuove, 61 bonifici, 9 pagamenti con carta. I totali tornano. Carica le anagrafiche in VERIF!CO, poi i due file dei movimenti, e segna ottobre come caricato. In tutto dieci minuti, senza ricopiare nulla. |
| **Scenari alternativi** | **Totali che non tornano:** l’esportazione resta bloccata finché la differenza non viene risolta (NFR-17). **Mese già caricato:** il gestionale avvisa prima di rigenerare i file, per evitare doppi caricamenti. **Email usata da più anagrafiche:** il gestionale la segnala prima di generare il file Stripe, perché VERIF!CO collegherebbe il pagamento alla persona sbagliata. **Donatore senza codice fiscale:** la donazione entra nei file, ma il donatore finisce nell’elenco di chi non riceverà la certificazione (FR-VER-03). **Volontario:** operazione negata. |

### Volontario (ARC-002)

| Voce | Contenuto |
| --- | --- |
| **Storia** | VOL-01 · Caricare le prove di realizzazione |
| **User flow** | 1. Silvia manda nel gruppo WhatsApp le foto di un aiuto consegnato, per esempio l’iscrizione a scuola di Grace. 2. Il volontario le trascina tutte nel bot, con i testi di Silvia agganciati come didascalia o con “Rispondi”. 3. Il bot chiede il tipo, ✅ Aiuto consegnato, poi la categoria: adozione scolastica. 4. Il bot legge “Grace” dal messaggio e chiede al gestionale i candidati solo fra i bambini con un intervento pagato e prove mancanti: ne resta uno, BAM-0215, e il volontario conferma. 5. Il gestionale manda le voci mancanti della checklist dell’anno scolastico (iscrizione, foto con la divisa, prova di fine anno); Claude propone “Iscrizione”, il volontario conferma con un tocco. 6. Il bot controlla il consenso della famiglia. 7. Il volontario sceglie nel foglio provini le foto per i social, nell’ordine della storia; il bot pubblica il post, con il nome della madrina solo se ha acconsentito. 8. Il gestionale riceve tutte le foto: la voce “Iscrizione” risulta completata e la madrina vede subito le foto nella sua area. 9. Con la prova di fine anno (pagella, lavori di fine anno o quaderni) l’anno scolastico diventa “rendicontato”; l’adozione resta attiva. |
| **Scenario principale** | Giovedì sera Silvia manda sei foto di Grace a scuola con il quaderno nuovo. Luca, volontario, le trascina nel bot e sceglie ✅ Aiuto consegnato → Adozione scolastica. Il bot propone una sola bambina, Grace (BAM-0215, adozione pagata, manca l’iscrizione), e Luca conferma; poi conferma la voce “Iscrizione” proposta da Claude e sceglie tre foto per i social. Il post esce con “Grazie a Maria R. di Treviso”; pochi minuti dopo la madrina trova nella sua area le sei foto con le parole di Silvia. |
| **Scenari alternativi** | **Voce fissa:** per una consegna di materassi il volontario sceglie ✅ Aiuto consegnato → Materassi e, se vuole, la famiglia; tutte le donazioni per i materassi ancora da rendicontare ricevono le foto di quella consegna, senza contare i pezzi (FR-INT-08). **Nessun intervento pagato per quel bambino:** con “Cerca fra tutti” il volontario lo trova, le foto vanno nella scheda come aggiornamento e l’amministratore riceve una segnalazione. **Famiglia senza modulo di consenso:** foto archiviate, nessun post; il sostenitore vede solo “consegna avvenuta” con la data. **Foto di bambini diversi nello stesso messaggio:** invii separati. **Gestionale non raggiungibile:** coda e nuovo tentativo ogni 10 minuti. **Prova caricata per errore:** l’amministratore la nasconde. **Volontario senza permesso:** il bot non mostra ✅. |

| Voce | Contenuto |
| --- | --- |
| **Storia** | VOL-02 · Aggiornare la scheda di un bambino |
| **User flow** | 1. Silvia manda nel gruppo foto o notizie di un bambino adottato: Grace che gioca, la pagella del primo trimestre, “Grace sta bene, ha imparato a leggere”. 2. Il volontario trascina tutto nel bot e sceglie ✅ Aiuto consegnato, categoria adozione scolastica. 3. Il bot cerca solo fra i bambini con un’adozione attiva e propone Grace (BAM-0215); il volontario conferma. 4. Fra le voci della checklist il volontario tocca “Nessuna: solo aggiornamento”. 5. Se c’è un testo, il bot chiede “Contiene informazioni sulla salute?”. 6. Nel foglio provini il volontario sceglie le foto per i social, se vuole pubblicarne; se non ne sceglie nessuna, il bot non pubblica nulla. 7. Il gestionale aggiunge foto, pagella e notizie alla scheda di Grace, con i testi di Silvia agganciati; le foto non scelte per i social sono riservate alla madrina, che vede tutto subito. |
| **Scenario principale** | Domenica sera Silvia manda tre foto di Grace che gioca con le compagne e scrive “Ha imparato a leggere”. Marta le carica dal bot come aggiornamento, risponde “No” alla domanda sulla salute e sceglie una foto per i social. La madrina trova nella sua area le tre foto con la frase di Silvia. |
| **Scenari alternativi** | **Notizia sulla salute** (es. “Grace è stata in ospedale”): con “Sì” il testo va nel campo sanitario, visibile solo all’amministratore, e non esce sui social. **Bambino senza padrino:** il contenuto resta nella scheda e lo vedrà il prossimo padrino (FR-ADO-02). **Famiglia senza modulo di consenso:** foto archiviate ma non visibili, nessun post. **Volontario senza permesso di aggiornare le schede:** il bot non gli mostra l’opzione. **Gestionale non raggiungibile:** coda e nuovo tentativo. |

| Voce | Contenuto |
| --- | --- |
| **Storia** | VOL-03 · Consultare le cose da fare (gestionale web) |
| **User flow** | 1. Il volontario apre il gestionale dal PC o dal telefono e va su “Cose da fare”. 2. Vede solo le voci consentite dai suoi permessi, dalla più vecchia: anni scolastici senza prova di fine anno; interventi pagati con prove mancanti (es. casa senza le foto della costruzione); richieste in bozza da completare; bambini senza aggiornamenti da 6 mesi. 3. Tocca “Prendo in carico” su una voce: gli altri volontari vedono il suo nome accanto. 4. Chiede a Silvia il materiale mancante e lo carica dal bot; quando arriva, la voce sparisce da sola dall’elenco. |
| **Scenario principale** | Lunedì sera Marta apre “Cose da fare”: 7 voci. La più vecchia è l’anno scolastico di Joseph, senza prova di fine anno da due mesi. La prende in carico e scrive a Silvia su WhatsApp; giovedì arrivano le foto dei quaderni di Joseph, Marta le carica dal bot e la voce scompare. |
| **Scenari alternativi** | **Voce già presa** da un altro volontario: la vede, ma non la può prendere; l’amministratore può riassegnarla. **Elenco lungo:** filtri per tipo e per villaggio, e pagine. **Presa in carico senza novità da 30 giorni:** la voce torna libera e l’amministratore riceve una segnalazione. **Voce fuori dai propri permessi:** il volontario non la vede. |

### Simpatizzante e sostenitore (ARC-003)

| Voce | Contenuto |
| --- | --- |
| **Storia** | SOS-03 · Scegliere una richiesta di sostegno |
| **User flow** | 1. Una persona scrive a Silvia che vorrebbe aiutare; Silvia le manda il link promozionale della vetrina, oppure il collegamento di una richiesta precisa. 2. Chi non ha un account lascia solo l’email, prende visione dell’informativa privacy e riceve un link per entrare: per 7 giorni è ospite e vede tutta la vetrina, con le sole foto pubbliche e senza poterle scaricare. Chi è registrato accede come sempre. 3. Nella vetrina trova le richieste personali aperte (foto, storia, costo), le voci fisse e la card “Adotta un giorno” del calendario solidale, e filtra per tipo e costo. 4. Mette nel carrello una richiesta, oppure una voce fissa indicando “quanti” (es. 3 materassi × 10 € = 30 €) solo per calcolare l’importo. 5. Può salvare una richiesta nei preferiti o condividerla su WhatsApp. 6. Al 5° giorno l’ospite riceve un promemoria; per donare si registra (nome, cognome, email, password) e ritrova il carrello. |
| **Scenario principale** | Sabato Paolo scrive a Silvia che vorrebbe dare una mano, ma non sa come. Silvia gli manda il link promozionale. Paolo lascia l’email, entra e gira la vetrina: le adozioni, poi i materassi e gli animali. Mette nel carrello due galline e l’affitto di un terreno per la famiglia di Moses, e condivide la richiesta del terreno con la moglie. Lunedì si registra e passa al pagamento (SOS-04). |
| **Scenari alternativi** | **Richiesta già sostenuta:** mostra “Sostenuto ✓”, non è più acquistabile e vengono proposte richieste simili. **Carrello lasciato a metà:** alla chiusura della sessione il contenuto passa nei preferiti. **Famiglia senza modulo di consenso:** la richiesta non compare nella vetrina. **Accesso ospite scaduto:** la persona può chiedere un nuovo link con la stessa email. **Ospite che prova a donare o a scaricare una foto:** gli viene chiesto di registrarsi; le foto non si scaricano. |

| Voce | Contenuto |
| --- | --- |
| **Storia** | SOS-04 · Donare con carta |
| **User flow** | 1. La sostenitrice, o l’ospite che ha appena completato la registrazione, apre il carrello: per esempio l’adozione di Grace, 180 €. 2. Sceglie “Paga con carta”. Il gestionale chiede solo i dati mancanti per la certificazione (codice fiscale ed eventuale avente diritto diverso), spiegando a cosa servono. 3. Legge e accetta la regola “Come funziona la tua donazione”: la donazione si conclude solo con il pagamento, e se un altro paga prima nasce un credito solidale. 4. Paga sulla pagina sicura di Stripe, con carta o Satispay; i dati della carta non passano mai dal gestionale. 5. Torna al gestionale: la donazione è confermata e la richiesta passa a “Sostenuto ✓”. 6. Riceve subito l’email di conferma con il ringraziamento, con l’indicazione che non vale ai fini fiscali e che la certificazione arriverà dall’associazione entro marzo. 7. Nella sua area trova Grace con lo stato “pagato”. |
| **Scenario principale** | Martedì sera Laura riceve da Silvia il link promozionale, lascia l’email e gira la vetrina. Si innamora della storia di Grace, la mette nel carrello, si registra, inserisce il codice fiscale e paga con la carta. Dopo un minuto riceve l’email di ringraziamento, e nella sua area vede Grace con la scritta “Pagato”. |
| **Scenari alternativi** | **Carta rifiutata o pagamento abbandonato:** nulla viene registrato, la richiesta resta disponibile e si può riprovare. **Un altro ha pagato la stessa richiesta un attimo prima:** la donazione diventa un credito solidale di 180 € per un’altra adozione, e Laura riceve un messaggio che lo spiega. **Conferma di Stripe che non arriva al gestionale:** il controllo periodico con Stripe la recupera e la registra una sola volta. **Codice fiscale non valido:** errore chiaro prima del pagamento. **Codice fiscale non indicato:** si può donare lo stesso, con l’avviso che non arriverà la certificazione. **Voce fissa** (3 materassi, 30 €): stesso percorso, senza “Sostenuto ✓”, perché le voci fisse restano sempre disponibili. |

| Voce | Contenuto |
| --- | --- |
| **Storia** | SOS-07 · Seguire ciò che ho sostenuto |
| **User flow** | 1. La madrina entra nella sua area quando vuole, dal link nell’email di conferma, oppure dall’avviso “Ci sono novità per Grace” (fase 2). 2. Vede Grace con l’anno scolastico 2026 e la sua checklist: ✓ iscrizione · ✓ foto con la divisa · ☐ prova di fine anno. 3. Apre la sequenza di foto, pubbliche e riservate, ognuna con il testo di Silvia, più le notizie e le pagelle intermedie, dalla più recente. 4. Può scaricare una foto per sé, con l’avviso che ritrae una minore e non va pubblicata né condivisa. 5. Quando arriva la prova di fine anno vede “Anno scolastico 2026 completato”; con il rinnovo comincia l’anno successivo. 6. Per una voce fissa (es. 3 materassi) vede “In attesa di consegna” e poi, alla consegna, le foto con “Consegnato”. |
| **Scenario principale** | A novembre Laura riceve l’email “Grace ha ricevuto la divisa”. Apre il link, vede le tre foto con le parole di Silvia (“È felicissima, l’ha indossata subito”) e ne scarica una da tenere sul telefono. |
| **Scenari alternativi** | **Famiglia senza modulo di consenso:** Laura vede stati e date (“divisa consegnata il 12/11”), ma non le foto. **Adozione chiusa:** vede i contenuti fino alla data di chiusura, nulla dopo. **Bambino non suo**, aperto da un altro collegamento: accesso negato. **Padrino storico non ancora abbinato:** vede le proprie donazioni e il messaggio “Stiamo ritrovando il tuo bambino: presto vedrai le sue foto”. |

# 5. Requisiti funzionali

Le user story descrivono ciò che ogni ruolo deve poter fare, nel formato **Come** [ruolo] **voglio** [azione] **così da** [beneficio]. Ogni storia ha i suoi acceptance criteria nel formato **Dato che / Quando / Allora**, uno per condizione, e almeno uno riguarda ciò che **viene negato**. Le regole che le storie lasciano aperte sono decise nel capitolo 5.6 con un identificativo **FR-[AREA]-[NN]**.

Le storie segnate con ★ sono le principali di ogni ruolo: per ciascuna il capitolo 4.2 descrive user flow, scenario principale e scenari alternativi.

Il materiale che la referente manda dall’Uganda entra nel gestionale soprattutto dal bot social, che i volontari già usano: un solo caricamento pubblica sui social e alimenta richieste, schede e rendicontazione (FR-BOT-01…08). Le stesse operazioni si possono fare anche dalle schermate del gestionale.

## 5.1 Riepilogo delle user story

| ID | Ruolo | Storia | Fase | AC |
| --- | --- | --- | --- | --- |
| AMM-01 ★ | Amministratore | Pubblicare una richiesta di sostegno | 1 | 6 |
| AMM-02 | Amministratore | Gestire famiglie e bambini | 1 | 7 |
| AMM-03 | Amministratore | Chiudere e riaffidare un’adozione | 1 | 5 |
| AMM-04 ★ | Amministratore | Importare l’estratto conto e confermare le donazioni | 1 | 9 |
| AMM-05 | Amministratore | Imputare le entrate | 1 | 5 |
| AMM-06 ★ | Amministratore | Preparare il caricamento in VERIF!CO | 1 | 9 |
| AMM-07 | Amministratore | Vedere tutto: numeri, andamento, anomalie | 1 | 6 |
| AMM-08 | Amministratore | Configurare permessi e impostazioni | 1 | 6 |
| AMM-09 | Amministratore | Recuperare padrini e bambini già seguiti | 1 | 6 |
| VOL-01 ★ | Volontario | Caricare le prove di realizzazione | 1 | 8 |
| VOL-02 ★ | Volontario | Aggiornare la scheda di un bambino | 1 | 8 |
| VOL-03 ★ | Volontario | Consultare le cose da fare | 1 | 6 |
| VOL-04 | Volontario | Usare il bot collegato al gestionale | 1 | 6 |
| SOS-01 | Ospite e simpatizzante | Entrare e registrarsi | 1 | 8 |
| SOS-02 | Sostenitore | Completare i miei dati | 1 | 5 |
| SOS-03 ★ | Ospite, simpatizzante e sostenitore | Scegliere una richiesta di sostegno | 1 | 9 |
| SOS-04 ★ | Sostenitore | Donare con carta | 1 | 5 |
| SOS-05 | Sostenitore | Donare con bonifico | 1 | 7 |
| SOS-06 | Sostenitore | Usare il credito solidale | 1 | 6 |
| SOS-07 ★ | Sostenitore | Seguire ciò che ho sostenuto | 1 | 9 |
| SOS-08 | Sostenitore | Storico e riepilogo annuale | 1 | 6 |
| SOS-09 | Sostenitore | Preferenze e dati sensibili | 1 | 6 |
| SOC-01 | Socio | Aderire e gestire la mia quota | 2 | 7 |
| SOC-02 | Socio | Consultare convocazioni e verbali | 2 | 4 |
| SOC-03 | Socio | Consultare i bilanci | 2 | 2 |

## 5.2 Amministratore

### AMM-01 · Pubblicare una richiesta di sostegno ★

**Come** Amministratore **voglio** pubblicare nel carrello solidale una richiesta con foto, storia e costo **così da** trovare un sostenitore per quel bambino o quel progetto.

- **AC-01** · **Dato che** un volontario abilitato ha preparato una richiesta in bozza, dal bot o dal gestionale, **Quando** la approvo, **Allora** la richiesta riceve il suo codice (es. RIC-0042) e compare nella vetrina con stato “aperta”, con le sole foto pubbliche. (FR-COD-01, FR-FOTO-01)
- **AC-02** · **Dato che** la famiglia del beneficiario non ha il modulo di consenso caricato, **Quando** provo ad approvare la richiesta, **Allora** il sistema lo impedisce e me lo segnala. (FR-CON-01)
- **AC-03** · **Dato che** sono un Volontario o un Sostenitore, **Quando** provo a pubblicare una richiesta, **Allora** l’operazione viene negata.
- **AC-04** · **Dato che** una richiesta ha già ricevuto un pagamento, **Quando** provo a modificarne il costo, **Allora** l’operazione viene negata; storia e foto restano modificabili. (FR-INT-04)
- **AC-05** · **Dato che** una richiesta è aperta da più di 30 giorni senza sostenitori, **Quando** apro la vista d’insieme, **Allora** la trovo fra le segnalazioni. (FR-IMP-01)
- **AC-06** · **Dato che** apro una bozza, **Quando** la controllo, **Allora** posso correggere testo, foto, copertina, ordine e costo proposto dal volontario, oppure rimandarla al volontario con una nota.

**Regole collegate.** Pubblicare significa rendere visibile la richiesta nella vetrina del gestionale; la pubblicazione sui social resta al bot. Le bozze da approvare arrivano all’amministratore anche con un’email riassuntiva giornaliera, disattivabile (FR-IMP-01). Il flusso dal bot è descritto nel capitolo 4.2.

### AMM-02 · Gestire famiglie e bambini

**Come** Amministratore **voglio** creare e aggiornare famiglie e bambini con i loro consensi **così da** avere un archivio completo e conforme.

- **AC-01** · **Dato che** sono autenticato come Amministratore, **Quando** creo una famiglia con i suoi bambini, **Allora** ogni bambino riceve automaticamente un codice univoco (es. BAM-0102) ed è collegato alla famiglia. (FR-COD-01)
- **AC-02** · **Dato che** invio dati incompleti o non validi, **Quando** confermo, **Allora** ricevo l’indicazione puntuale dei campi errati e nulla viene salvato.
- **AC-03** · **Dato che** esiste già un bambino con lo stesso nome e la stessa data di nascita, **Quando** ne creo uno nuovo, **Allora** il sistema mi avvisa del possibile doppione e decido io se proseguire.
- **AC-04** · **Dato che** un bambino esce dal programma, **Quando** lo segnalo con data e motivo, **Allora** non viene cancellato, passa allo stato “uscito dal programma” e il suo storico resta consultabile.
- **AC-05** · **Dato che** sono un Volontario, **Quando** consulto una scheda, **Allora** non vedo i dati sensibili (dati sanitari, modulo di consenso) e non posso creare famiglie o bambini. (FR-RUO-02)
- **AC-06** · **Dato che** sono un Sostenitore, **Quando** consulto la scheda del bambino che sostengo, **Allora** vedo nome, età, scuola, distretto e foto, ma non il cognome né il luogo esatto in cui vive. (FR-RUO-04)
- **AC-07** · **Dato che** la famiglia ha il modulo di consenso caricato, **Quando** il sostenitore consulta la scheda, **Allora** vede giorno e mese del compleanno, senza l’anno; senza consenso non lo vede. (FR-ADO-05)

**Regole collegate.** Solo l’amministratore crea famiglie e bambini; il volontario può proporre un bambino nuovo dal bot, e l’amministratore lo conferma (VOL-04). Il volontario aggiorna foto, pagelle e notizie (VOL-02). I codici li genera il gestionale: non esiste un codice precedente da conservare (FR-COD-01). La casa famiglia è registrata come una famiglia, con la referente come tutore. Nessun bambino viene cancellato: si archivia. Dati obbligatori: nome, data di nascita, famiglia, villaggio; facoltativi: cognome, scuola e classe (cap. 5.7).

### AMM-03 · Chiudere e riaffidare un’adozione

**Come** Amministratore **voglio** chiudere un’adozione e affidare il bambino a un nuovo sostenitore **così da** garantirgli continuità.

- **AC-01** · **Dato che** un bambino ha un’adozione attiva, **Quando** la chiudo indicando data e motivo, **Allora** il bambino torna disponibile e posso preparare per lui una nuova richiesta di sostegno.
- **AC-02** · **Dato che** un bambino ha già un’adozione attiva, **Quando** provo ad aprirne una seconda, **Allora** il sistema lo impedisce con un errore esplicito. (FR-ADO-01)
- **AC-03** · **Dato che** il bambino è stato riaffidato, **Quando** il nuovo sostenitore apre la sua scheda, **Allora** vede tutto lo storico del bambino e nessun dato del sostenitore precedente. (FR-ADO-02)
- **AC-04** · **Dato che** la mia adozione è stata chiusa, **Quando** accedo all’area riservata, **Allora** vedo le informazioni del bambino fino alla data di chiusura e nulla di successivo. (FR-ADO-03)
- **AC-05** · **Dato che** chiudo un’adozione, **Quando** confermo, **Allora** il sostenitore riceve un’email di ringraziamento per il sostegno dato, con l’invito a scoprire un’altra richiesta. (FR-RING-01)

### AMM-04 · Importare l’estratto conto e confermare le donazioni ★

**Come** Amministratore **voglio** caricare ogni mese l’estratto conto della banca e confermare le donazioni **così da** verificare ciò che è stato dichiarato.

- **AC-01** · **Dato che** carico il file CSV/Excel dell’estratto conto, **Quando** l’importazione termina, **Allora** le donazioni dichiarate ritrovate passano a “confermate” e le altre entrate compaiono nell’elenco “da abbinare”. (FR-DON-02)
- **AC-02** · **Dato che** un’entrata proviene da un IBAN sconosciuto, **Quando** la collego a un sostenitore, **Allora** il sistema salva quell’IBAN nella sua scheda e lo riconosce automaticamente nelle importazioni successive.
- **AC-03** · **Dato che** una donazione dichiarata con quietanza non compare nell’estratto del periodo, **Quando** l’importazione termina, **Allora** viene segnalata come anomalia nella vista d’insieme.
- **AC-04** · **Dato che** nell’estratto c’è un versamento cumulativo del fornitore dei pagamenti con carta, **Quando** lo importo, **Allora** viene collegato ai pagamenti con carta e Satispay già registrati e non genera nuove donazioni; per VERIF!CO è un giroconto (FR-VER-02).
- **AC-05** · **Dato che** ricarico un estratto conto già importato, oppure due file con periodi sovrapposti, **Quando** confermo, **Allora** i movimenti già presenti non vengono duplicati.
- **AC-06** · **Dato che** sono un Volontario, **Quando** provo a caricare un estratto conto, **Allora** l’operazione viene negata.
- **AC-07** · **Dato che** ogni giorno il gestionale importa le donazioni del calendario solidale, **Quando** l’importazione termina, **Allora** ogni giorno adottato compare come donazione confermata, imputata al sostegno della casa famiglia, con l’anagrafica del donatore, e i versamenti del fornitore delle carte tornano con le quadrature. (FR-CAN-03)
- **AC-08** · **Dato che** un’entrata proviene da un IBAN sconosciuto ma la causale contiene il nome di un sostenitore, **Quando** l’importazione termina, **Allora** il gestionale mi propone l’abbinamento e io lo confermo con un clic; senza conferma l’entrata resta da abbinare.
- **AC-09** · **Dato che** è il giorno 10 del mese e l’estratto del mese precedente non è stato importato, **Quando** apro la sezione Scadenze, **Allora** trovo il promemoria dell’importazione. (FR-REP-01, FR-IMP-01)

**Regole collegate.** Un’entrata da IBAN sconosciuto si collega a un sostenitore esistente, a una nuova anagrafica da completare oppure alla Cassa sostegno Effatà. Il nome nella causale produce solo una proposta, mai un abbinamento automatico. Le uscite presenti nell’estratto vengono ignorate: la contabilità resta in VERIF!CO (cap. 1.3). Il formato del file UniCredit va verificato su una copia anonimizzata (DIP-01).

### AMM-05 · Imputare le entrate

**Come** Amministratore **voglio** imputare ogni entrata a un intervento, a una raccolta fondi o alla Cassa sostegno **così da** sapere a cosa serve ogni euro.

- **AC-01** · **Dato che** un’entrata ha una causale standard o proviene dal carrello, **Quando** viene confermata, **Allora** è imputata automaticamente alla richiesta corrispondente.
- **AC-02** · **Dato che** un’entrata ha una causale libera, **Quando** la imputo a mano a uno o più interventi, **Allora** la parte che non corrisponde a nessun intervento va nella Cassa sostegno Effatà. (FR-INT-05, FR-INT-06)
- **AC-03** · **Dato che** un’entrata proviene da una campagna esterna, **Quando** la imputo, **Allora** viene collegata alla raccolta fondi corrispondente. (FR-CAN-01)
- **AC-04** · **Dato che** un’imputazione è già stata esportata verso VERIF!CO, **Quando** la correggo, **Allora** la modifica resta registrata con chi e quando, e il sistema segnala che va riportata anche in VERIF!CO. (NFR-17)
- **AC-05** · **Dato che** sono un Volontario, **Quando** provo a imputare un’entrata, **Allora** l’operazione viene negata.

**Regole collegate.** In fase 1 l’imputazione automatica avviene solo con la causale standard o con il pagamento dal carrello; le causali libere si imputano a mano. La proposta automatica dell’imputazione con l’AI è in fase 2. Prima dell’esportazione le correzioni sono libere, dopo sono tracciate.

### AMM-06 · Preparare il caricamento in VERIF!CO ★

**Come** Amministratore **voglio** generare ogni mese i file per il caricamento massivo in VERIF!CO **così da** non ricopiare più movimenti e anagrafiche a mano.

- **AC-01** · **Dato che** esistono donazioni confermate nel periodo scelto, **Quando** genero i file, **Allora** ottengo i bonifici nel tracciato master e i pagamenti con carta e Satispay nel tracciato Stripe, una riga per pagamento, con solo importi positivi e il progetto o la raccolta fondi. (FR-VER-01, FR-VER-02)
- **AC-02** · **Dato che** nel periodo si sono registrati nuovi sostenitori o qualcuno ha modificato i propri dati, **Quando** genero i file, **Allora** ottengo anche il file delle anagrafiche da creare o aggiornare in VERIF!CO, con codice fiscale ed email uguale a quella usata nei pagamenti, e l’indicazione di caricarlo prima dei movimenti.
- **AC-03** · **Dato che** alcune donazioni sono ancora “dichiarate” o hanno anomalie aperte, **Quando** genero i file, **Allora** sono escluse e me ne viene indicato il numero.
- **AC-04** · **Dato che** un movimento è già stato esportato, **Quando** genero di nuovo i file dello stesso periodo, **Allora** il sistema me lo segnala per evitare doppi caricamenti.
- **AC-05** · **Dato che** i totali dei file non coincidono con le donazioni confermate del periodo, **Quando** li genero, **Allora** il sistema blocca l’esportazione e segnala la differenza. (NFR-17)
- **AC-06** · **Dato che** sono un Volontario, **Quando** provo a generare i file, **Allora** l’operazione viene negata.
- **AC-07** · **Dato che** un sostenitore riceve la conferma di donazione dal gestionale, **Quando** la legge, **Allora** vi trova l’indicazione che non è valida ai fini fiscali e che la certificazione per la detrazione arriverà dall’associazione entro marzo dell’anno successivo. (FR-RIC-01)
- **AC-08** · **Dato che** siamo fra il 1° gennaio e il 15 febbraio, **Quando** apro la sezione Scadenze, **Allora** trovo la checklist di chiusura dell’anno precedente con l’elenco di ciò che manca per le certificazioni. (FR-VER-03)
- **AC-09** · **Dato che** ho caricato i file in VERIF!CO, **Quando** segno il mese come “caricato”, **Allora** ogni correzione successiva su quel mese resta registrata e il sistema mi avvisa che va riportata anche in VERIF!CO. (NFR-17)

**Regole collegate.** I file si generano ogni mese, dopo l’importazione dell’estratto conto, e si caricano in quest’ordine: anagrafiche, bonifici, pagamenti con carta. I versamenti di Stripe sul conto UniCredit sono giroconti, non donazioni; la destinazione contabile viaggia con il campo Progetti (FR-INT-02). Le anagrafiche nuove o modificate passano a VERIF!CO già in fase 1, con un file di importazione se VERIF!CO lo accetta, altrimenti con un elenco da inserire a mano; l’importazione dei padrini storici è descritta in AMM-09, mentre gli inviti ai padrini e il ritorno delle anagrafiche complete restano in fase 2 (FR-STO-02/03).

### AMM-07 · Vedere tutto: numeri, andamento, anomalie

**Come** Amministratore **voglio** una vista d’insieme con numeri, andamento e anomalie **così da** tenere sotto controllo l’associazione e intervenire in tempo.

- **AC-01** · **Dato che** sono autenticato come Amministratore, **Quando** apro la vista d’insieme, **Allora** vedo sostenitori, bambini con e senza sostenitore, donazioni del periodo (dichiarate e confermate separatamente), Cassa sostegno, crediti solidali attivi, interventi per stato e segnalazioni. (FR-DASH-01)
- **AC-02** · **Dato che** ho fissato un obiettivo annuale per un capitolo, **Quando** apro la vista d’insieme, **Allora** vedo raccolto contro obiettivo, con la percentuale raggiunta. (FR-DASH-02)
- **AC-03** · **Dato che** scelgo un periodo, **Quando** consulto l’andamento, **Allora** vedo donazioni e interventi mese per mese, confrontati con lo stesso periodo dell’anno precedente. (FR-DASH-02)
- **AC-04** · **Dato che** le quadrature fra estratto conto, imputazioni e file per VERIF!CO non tornano, **Quando** apro la vista d’insieme, **Allora** vedo un’anomalia al posto di un totale sbagliato. (NFR-17)
- **AC-05** · **Dato che** un elenco supera la dimensione di una pagina, **Quando** lo consulto, **Allora** i risultati sono paginati, filtrabili per categoria e periodo, ed esportabili in Excel. (FR-REP-01)
- **AC-06** · **Dato che** sono un Volontario, **Quando** apro la vista d’insieme, **Allora** vedo solo i numeri operativi, senza importi; **dato che** sono un Sostenitore, l’accesso viene negato.

**Regole collegate.** Dalla vista d’insieme l’amministratore cerca una persona o un beneficiario e ne apre la situazione completa (FR-REP-02). I requisiti nascono dalle interviste del 01/10/2026 (cap. 6.2).

### AMM-08 · Configurare permessi e impostazioni

**Come** Amministratore **voglio** stabilire cosa può fare ogni volontario, il listino, le scadenze e i testi delle comunicazioni **così da** adattare il sistema senza interventi tecnici.

- **AC-01** · **Dato che** sono autenticato come Amministratore, **Quando** abilito a un volontario un’azione (es. preparare richieste o caricare prove), **Allora** il volontario può eseguirla da quel momento. (FR-RUO-01)
- **AC-02** · **Dato che** tento di concedere a un volontario l’accesso ai dati sensibili, o di rendere visibile al sostenitore un dato protetto, **Quando** salvo, **Allora** il sistema non lo permette. (FR-RUO-02, FR-RUO-04)
- **AC-03** · **Dato che** modifico il costo di un tipo di intervento o la sua checklist, **Quando** salvo, **Allora** la modifica vale solo per le nuove richieste; quelle già pagate restano invariate. (FR-INT-04)
- **AC-04** · **Dato che** resterebbe nel sistema un solo amministratore, **Quando** provo a togliergli il ruolo, **Allora** l’operazione viene negata.
- **AC-05** · **Dato che** modifico un’impostazione, **Quando** salvo, **Allora** la modifica resta registrata con chi, quando, valore precedente e nuovo valore.
- **AC-06** · **Dato che** sono un Volontario, **Quando** provo ad aprire le impostazioni, **Allora** l’operazione viene negata.

**Regole collegate.** L’elenco delle impostazioni e dei valori predefiniti è in FR-IMP-01. Un amministratore può nominarne altri.

### AMM-09 · Recuperare padrini e bambini già seguiti

**Come** Amministratore **voglio** importare i padrini da VERIF!CO e abbinarli ai bambini che sostengono **così da** portare nel gestionale le adozioni già in corso senza perdere nessuno.

- **AC-01** · **Dato che** carico l’esportazione delle anagrafiche e dei movimenti di VERIF!CO dal 2025, **Quando** l’importazione termina, **Allora** ogni anagrafica con almeno un versamento di 180 € (o multipli) nel conto delle adozioni scolastiche entra come “padrino storico” con il suo storico delle donazioni, senza account, e ricevo un rapporto con doppioni e dati mancanti da controllare prima di confermare. (FR-STO-01)
- **AC-02** · **Dato che** nelle note di VERIF!CO o nelle storie del bot c’è il nome di un bambino collegato a un padrino, **Quando** l’importazione termina, **Allora** quel nome compare come indizio nella scheda del padrino, non come bambino.
- **AC-03** · **Dato che** la referente ha compilato l’elenco dei bambini di un villaggio, **Quando** lo carico, **Allora** i bambini nuovi ricevono il loro codice e quelli già presenti mi vengono segnalati come possibili doppioni.
- **AC-04** · **Dato che** apro le liste “padrini senza bambino” e “bambini senza padrino”, **Quando** collego un padrino a un bambino con la conferma della referente, **Allora** nasce l’adozione attiva e da quel momento il padrino, una volta registrato, vede le foto del bambino.
- **AC-05** · **Dato che** un’adozione storica non ha ancora un bambino identificato, **Quando** il padrino accede, **Allora** vede le proprie donazioni ma nessuna foto, e l’adozione resta nelle liste da abbinare.
- **AC-06** · **Dato che** sono un Volontario, **Quando** provo a importare o abbinare, **Allora** l’operazione viene negata.

**Regole collegate.** Le adozioni non si pagano a rate: gli importi minori sul conto delle adozioni sono altre donazioni. Un multiplo di 180 € (es. 360 €) fa pensare a più bambini, ma è solo un indizio da confermare (FR-STO-01). I bambini entrano nel gestionale poco alla volta: dalle foto di ogni giorno (bambino nuovo proposto dal volontario) e dagli elenchi per villaggio che la referente compila dal telefono con un modello semplice (nome, età, famiglia, villaggio, nome del padrino). Gli inviti ai padrini storici per collegarsi al proprio storico sono in fase 2 (FR-STO-02).

## 5.3 Volontario

### VOL-01 · Caricare le prove di realizzazione ★

**Come** Volontario **voglio** caricare foto e documenti su un intervento **così da** rendicontarlo al sostenitore.

- **AC-01** · **Dato che** ho il permesso di caricare prove e carico dal bot le foto di un aiuto consegnato, **Quando** confermo il beneficiario, scelto fra quelli con un intervento pagato e prove mancanti (FR-BOT-05), e la voce della checklist proposta, **Allora** la voce risulta completata e le foto sono visibili ai sostenitori di quell’intervento. (FR-INT-03)
- **AC-02** · **Dato che** tutte le voci della checklist hanno la loro prova, **Quando** carico l’ultima, **Allora** l’intervento passa allo stato “rendicontato”. (FR-INT-03)
- **AC-03** · **Dato che** la famiglia non ha il modulo di consenso caricato, **Quando** carico una foto, **Allora** la foto viene archiviata ma il sostenitore vede solo “consegna avvenuta” con la data, e il bot non la pubblica sui social. (FR-CON-01)
- **AC-04** · **Dato che** carico le foto della consegna di una voce fissa (es. materassi alla famiglia FAM-0045), **Quando** confermo la categoria, **Allora** tutte le donazioni per quella voce ancora da rendicontare ricevono le foto e passano a “rendicontate”, senza contare le unità; la famiglia è facoltativa. (FR-INT-08)
- **AC-05** · **Dato che** carico un file che non è un’immagine o un PDF, o supera la dimensione massima, **Quando** confermo, **Allora** ricevo un errore chiaro e nulla viene salvato.
- **AC-06** · **Dato che** non ho il permesso di caricare prove, **Quando** provo a farlo, **Allora** il bot non mi mostra l’opzione e il gestionale nega l’operazione. (FR-RUO-01)
- **AC-07** · **Dato che** una prova è stata caricata per errore, **Quando** l’amministratore la nasconde o la elimina, **Allora** il sostenitore non la vede più e resta registrato chi l’ha caricata e chi l’ha rimossa.
- **AC-08** · **Dato che** carico la prova di fine anno di un’adozione scolastica (pagella, lavori di fine anno o quaderni), **Quando** la confermo, **Allora** l’anno scolastico passa a “rendicontato” e l’adozione resta attiva. (FR-ADO-06)

**Regole collegate.** Le prove sono visibili subito, senza approvazione preventiva. Le risposte date al bot valgono per tutte le foto dello stesso invio; foto di interventi diversi si caricano con invii diversi. Se le foto non corrispondono a nessuna voce, il volontario sceglie “solo aggiornamento” e finiscono nella scheda (VOL-02). Si possono caricare più foto insieme anche dal gestionale (NFR-19).

### VOL-02 · Aggiornare la scheda di un bambino ★

**Come** Volontario **voglio** aggiungere foto, pagelle e notizie alla scheda di un bambino **così da** tenere aggiornato chi lo sostiene.

- **AC-01** · **Dato che** ho il permesso di aggiornare le schede, **Quando** aggiungo dal bot o dal gestionale una foto, una pagella o una notizia, **Allora** il contenuto compare nella scheda e il sostenitore attivo lo vede (per le foto vale FR-CON-01).
- **AC-02** · **Dato che** sono un Volontario, **Quando** provo a modificare nome, data di nascita o famiglia del bambino, **Allora** l’operazione viene negata. (AMM-02)
- **AC-03** · **Dato che** il bambino non ha un sostenitore attivo, **Quando** aggiungo un contenuto, **Allora** resta nello storico del bambino e lo vedrà il prossimo sostenitore. (FR-ADO-02)
- **AC-04** · **Dato che** scrivo una notizia, **Quando** la salvo, **Allora** il sistema mi ricorda che è visibile al sostenitore e che le informazioni sanitarie vanno nell’apposito campo riservato.
- **AC-05** · **Dato che** non ho il permesso di aggiornare le schede, **Quando** provo a farlo, **Allora** l’operazione viene negata.
- **AC-06** · **Dato che** la referente ha scritto un testo per una foto, **Quando** lo carico come didascalia o con “Rispondi” sulla foto, **Allora** il testo resta legato a quella foto anche nella scheda del bambino. (FR-BOT-04)
- **AC-07** · **Dato che** carico dal bot un testo per la scheda, **Quando** il bot mi chiede “Contiene informazioni sulla salute?” e rispondo “Sì”, **Allora** il testo va nel campo sanitario, visibile solo all’amministratore, e non viene pubblicato sui social. (FR-BOT-04)
- **AC-08** · **Dato che** carico un aggiornamento, **Quando** nel foglio provini non scelgo nessuna foto per i social, **Allora** il bot non pubblica nulla e tutte le foto arrivano nella scheda come riservate al padrino. (FR-FOTO-01)

**Regole collegate.** Per un aggiornamento il bot cerca il bambino solo fra quelli con un’adozione attiva (FR-BOT-05). Il volontario aggiorna foto, pagelle, notizie e storia, non l’anagrafica. Le foto non scelte per i social arrivano nella scheda come riservate al padrino (FR-FOTO-01). Il campo notizie (visibile al sostenitore) è separato dal campo sanitario (solo amministratore). In fase 2 il sostenitore riceve un avviso per ogni novità.

### VOL-03 · Consultare le cose da fare ★

**Come** Volontario **voglio** vedere l’elenco delle cose su cui posso lavorare **così da** sapere da dove cominciare.

- **AC-01** · **Dato che** ho il permesso di caricare prove, **Quando** apro “Cose da fare”, **Allora** vedo gli interventi pagati ma non ancora rendicontati, con le prove mancanti, compresi gli anni scolastici senza prova di fine anno, ordinati dal più vecchio. (FR-ADO-06)
- **AC-02** · **Dato che** ho il permesso di aggiornare le schede, **Quando** apro “Cose da fare”, **Allora** vedo anche i bambini senza aggiornamenti da più di 6 mesi. (FR-IMP-01)
- **AC-03** · **Dato che** prendo in carico una voce, **Quando** un altro volontario apre la sua lista, **Allora** vede il mio nome accanto alla voce e non può prenderla; l’amministratore può riassegnarla.
- **AC-04** · **Dato che** una voce non rientra nei miei permessi, **Quando** apro “Cose da fare”, **Allora** non la vedo.
- **AC-05** · **Dato che** l’elenco supera la dimensione di una pagina, **Quando** lo consulto, **Allora** i risultati sono paginati e filtrabili per tipo e per villaggio.
- **AC-06** · **Dato che** ho preso in carico una voce, **Quando** passano 30 giorni senza novità, **Allora** la voce torna libera e l’amministratore riceve una segnalazione. (FR-IMP-01)

**Regole collegate.** “Cose da fare” si usa nel gestionale web, non nel bot. L’elenco comprende anche le richieste in bozza da completare. Una voce sparisce da sola quando arriva la prova mancante.

### VOL-04 · Usare il bot collegato al gestionale

**Come** Volontario **voglio** caricare nel bot il materiale della referente una sola volta **così da** pubblicarlo sui social e allo stesso tempo portarlo nel gestionale.

- **AC-01** · **Dato che** dal mio profilo nel gestionale genero il codice “Collega Telegram”, **Quando** scrivo nel bot `/collega` seguito dal codice entro 10 minuti, **Allora** il mio account Telegram viene collegato al mio profilo. (FR-BOT-02)
- **AC-02** · **Dato che** il mio account Telegram non è collegato, oppure sono stato disattivato, **Quando** scrivo al bot, **Allora** il bot non esegue nessuna azione e mi dice di rivolgermi all’amministratore.
- **AC-03** · **Dato che** sono collegato, **Quando** avvio un caricamento, **Allora** il bot mi chiede prima il tipo (🆘 Richiesta di aiuto, ✅ Aiuto consegnato, 📣 Solo social), poi la categoria, e mi mostra solo le opzioni che i miei permessi consentono. (FR-BOT-01, FR-BOT-03)
- **AC-04** · **Dato che** ho caricato tutte le foto di un invio, **Quando** tocco nel foglio provini le foto per i social nell’ordine della storia, **Allora** il bot pubblica quelle foto in quell’ordine e invia al gestionale tutte le foto, con le scelte come pubbliche e le altre come riservate al padrino. (FR-BOT-04, FR-FOTO-01)
- **AC-05** · **Dato che** il gestionale non è raggiungibile, **Quando** il bot ha già pubblicato, **Allora** conserva l’invio, ritenta ogni 10 minuti e mi avvisa quando è arrivato; se il gestionale lo rifiuta, mi spiega il motivo. (FR-BOT-06)
- **AC-06** · **Dato che** pubblico un contenuto 📣 Solo social, **Quando** confermo, **Allora** il bot mi chiede di confermare che nelle foto non ci sono minori riconoscibili senza consenso. (FR-CON-01)

**Regole collegate.** Le regole complete del collegamento sono in FR-BOT-01…08; il contratto delle API è nel capitolo 11.5.

## 5.4 Simpatizzante e sostenitore

### SOS-01 · Entrare e registrarsi

**Come** Simpatizzante **voglio** conoscere la vetrina e registrarmi in modo semplice **così da** entrare nell’area riservata di Effatà e poter donare.

- **AC-01** · **Dato che** inserisco nome, cognome, email, password e spunto la presa visione dell’informativa privacy, **Quando** confermo, **Allora** ricevo un’email con il link di conferma. (FR-REG-01)
- **AC-02** · **Dato che** apro il link di conferma, **Quando** l’account viene attivato, **Allora** entro nell’area riservata come simpatizzante; se ero partito da una richiesta, torno a quella richiesta.
- **AC-03** · **Dato che** non spunto la presa visione dell’informativa privacy, **Quando** provo a registrarmi o a entrare come ospite, **Allora** la registrazione non viene completata.
- **AC-04** · **Dato che** scelgo una password troppo corta o presente negli elenchi di password violate, **Quando** confermo, **Allora** ricevo un errore chiaro e la password viene rifiutata. (FR-SEC-01)
- **AC-05** · **Dato che** l’email è già registrata, **Quando** provo a registrarmi, **Allora** ricevo lo stesso messaggio di una registrazione nuova (“controlla la tua email”), e il titolare dell’indirizzo riceve un avviso con il link per accedere o recuperare la password.
- **AC-06** · **Dato che** il link di conferma è scaduto, **Quando** lo apro, **Allora** posso richiederne uno nuovo.
- **AC-07** · **Dato che** apro il link promozionale ricevuto dalla referente, **Quando** lascio la mia email e spunto la presa visione dell’informativa, **Allora** ricevo un link per entrare come ospite e vedo tutta la vetrina per 7 giorni, con un promemoria al 5° giorno. (FR-REG-05)
- **AC-08** · **Dato che** sono ospite, **Quando** mi registro, **Allora** non devo prendere di nuovo visione dell’informativa (salvo una nuova versione) e ritrovo il mio carrello.

**Regole collegate.** I dati si chiedono un po’ alla volta (FR-REG-01): all’ospite solo l’email; alla registrazione nome, cognome, email e password, più due consensi facoltativi e non preselezionati, newsletter e comunicazioni e “Posso comparire nei post social dell’associazione” (FR-COM-02); il codice fiscale alla prima donazione (SOS-02). L’accesso avviene con email e password per tutti i ruoli; la pagina di accesso offre “Non hai un account? Registrati” e “Password dimenticata?”. L’accesso con Google o Apple e l’accesso senza password per tutti sono in fase 2.

### SOS-02 · Completare i miei dati

**Come** Sostenitore **voglio** indicare i miei dati e quelli dell’avente diritto alla detrazione **così da** ottenere la certificazione per la detrazione fiscale.

- **AC-01** · **Dato che** faccio la mia prima donazione e non ho indicato il codice fiscale, **Quando** arrivo al pagamento, **Allora** il sistema me lo chiede spiegando che serve per la certificazione; posso proseguire anche senza, con l’avviso “Senza codice fiscale la donazione è valida ma non riceverai la certificazione per la detrazione”. (FR-FIS-01)
- **AC-02** · **Dato che** la detrazione spetta a un’altra persona, **Quando** lo indico, **Allora** inserisco nome, cognome e codice fiscale dell’avente diritto, che compaiono nella causale standard. (FR-FIS-01)
- **AC-03** · **Dato che** inserisco un codice fiscale formalmente errato o non coerente con nome e cognome, **Quando** confermo, **Allora** ricevo un errore chiaro e il dato non viene salvato.
- **AC-04** · **Dato che** non voglio che i miei dati siano inviati all’Agenzia delle Entrate, **Quando** lo indico, **Allora** la scelta viene registrata e trasmessa a VERIF!CO con l’anagrafica. (FR-FIS-01)
- **AC-05** · **Dato che** sono un altro sostenitore o un volontario, **Quando** provo a vedere o modificare questi dati, **Allora** l’operazione viene negata. (FR-RUO-02)

**Regole collegate.** I dati si possono compilare anche prima, dal profilo. L’avente diritto è il sostenitore stesso, salvo indicazione diversa. L’indirizzo non serve alla certificazione e non viene chiesto; il telefono è facoltativo.

### SOS-03 · Scegliere una richiesta di sostegno ★

**Come** Ospite, Simpatizzante o Sostenitore **voglio** consultare, salvare e condividere le richieste di sostegno **così da** scegliere chi aiutare.

- **AC-01** · **Dato che** ho fatto l’accesso, come utente registrato o come ospite, **Quando** apro la vetrina, **Allora** vedo le richieste personali aperte con foto, storia e costo, le voci fisse sempre disponibili e il collegamento “Adotta un giorno” al calendario solidale, e posso filtrare per tipo e costo. (FR-SOS-02)
- **AC-02** · **Dato che** non ho fatto l’accesso, **Quando** provo ad aprire la vetrina o il collegamento di una richiesta, **Allora** posso entrare come ospite con la sola email oppure accedere, e poi arrivo alla richiesta. (SOS-01, FR-REG-05)
- **AC-03** · **Dato che** apro la vetrina, **Quando** scorro le richieste, **Allora** vedo anche quelle sostenute negli ultimi 30 giorni con l’etichetta “Sostenuto ✓”, senza l’identità di chi le ha sostenute né gli aggiornamenti successivi. (FR-VIS-01, FR-IMP-01)
- **AC-04** · **Dato che** la famiglia del bambino non ha il modulo di consenso caricato, **Quando** la richiesta viene preparata, **Allora** non può comparire nella vetrina. (FR-CON-01)
- **AC-05** · **Dato che** una richiesta unica viene pagata da un altro sostenitore, **Quando** aggiorno la pagina o apro il carrello, **Allora** passa a “Sostenuto ✓”, non è più acquistabile e mi vengono proposte richieste simili. (FR-CAR-01)
- **AC-06** · **Dato che** chiudo la sessione con qualcosa nel carrello, **Quando** accedo di nuovo, **Allora** lo ritrovo nei preferiti. (FR-SOS-02)
- **AC-07** · **Dato che** una richiesta mi colpisce, **Quando** tocco “Condividi”, **Allora** posso inviarne il collegamento su WhatsApp; chi lo riceve entra come ospite o accede per vederla.
- **AC-08** · **Dato che** scelgo una voce fissa (es. materassi, animali), **Quando** la metto nel carrello, **Allora** posso indicare “quanti” (e, per gli animali, la specie, ognuna con il suo prezzo) solo per calcolare l’importo; il gestionale registra importo e categoria, e la voce resta sempre disponibile per altri sostenitori. (FR-CAT-01)
- **AC-09** · **Dato che** sono ospite, **Quando** provo a donare o a scaricare una foto, **Allora** mi viene chiesto di registrarmi; le foto della vetrina non si scaricano. (FR-REG-05)

**Regole collegate.** La vetrina è riservata agli utenti registrati e agli ospiti: il pubblico conosce le storie dai social, chi vuole seguirle da vicino lascia almeno l’email (FR-SOS-02, FR-REG-05).

### SOS-04 · Donare con carta ★

**Come** Sostenitore **voglio** pagare con la carta le richieste nel mio carrello **così da** confermare subito il mio sostegno.

- **AC-01** · **Dato che** ho una o più richieste nel carrello e i miei dati sono completi, **Quando** pago con carta o Satispay sulla pagina sicura del fornitore e il pagamento va a buon fine, **Allora** la donazione è confermata, le richieste uniche passano a “Sostenuto ✓” e ricevo subito la conferma di donazione con il ringraziamento. (FR-PAG-01, FR-RING-01)
- **AC-02** · **Dato che** il pagamento viene rifiutato o lo abbandono, **Quando** torno al gestionale, **Allora** nulla viene registrato, le richieste restano disponibili e posso riprovare.
- **AC-03** · **Dato che** nel frattempo un altro sostenitore ha pagato la stessa richiesta unica, **Quando** il mio pagamento va a buon fine, **Allora** la mia donazione diventa un credito solidale e ricevo un messaggio che lo spiega. (FR-CAR-02)
- **AC-04** · **Dato che** il fornitore ha confermato il pagamento ma il gestionale non ha ricevuto la notifica, **Quando** il sistema esegue il controllo periodico con il fornitore, **Allora** la donazione viene recuperata e registrata una sola volta.
- **AC-05** · **Dato che** pago, **Quando** inserisco i dati della carta, **Allora** lo faccio sulla pagina del fornitore e il gestionale non li riceve né li conserva mai.

**Regole collegate.** Satispay passa dalla stessa pagina di Stripe, come la carta (FR-PAG-01). Il versamento cumulativo del fornitore sul conto serve solo alle quadrature (AMM-04, AC-04). Il pagamento ricorrente con carta per il rinnovo dell’adozione è in fase 2 (FR-ADO-04). Il recupero delle conferme perse è la gestione del fallimento dell’API esterna (cap. 13.3).

### SOS-05 · Donare con bonifico

**Come** Sostenitore **voglio** fare un bonifico con la causale pronta e caricare la quietanza **così da** donare anche senza carta.

- **AC-01** · **Dato che** scelgo il bonifico, **Quando** confermo il carrello, **Allora** vedo e ricevo via email l’IBAN dell’associazione, la causale standard già compilata con il codice dell’intervento e il codice fiscale dell’avente diritto (entro 140 caratteri) e il suggerimento di usare il bonifico istantaneo. (FR-SOS-01, FR-FIS-01)
- **AC-02** · **Dato che** ho fatto il bonifico, **Quando** carico la quietanza con importo e data, **Allora** la donazione passa a “dichiarata”, le richieste uniche passano a “Sostenuto ✓” e ricevo la conferma di donazione con il ringraziamento. (FR-DON-01, FR-CAR-01)
- **AC-03** · **Dato che** sono passati 7 giorni senza quietanza, **Quando** il sistema controlla gli impegni aperti, **Allora** ricevo un promemoria; dopo 30 giorni l’impegno decade e il contenuto torna nei miei preferiti. (FR-IMP-01)
- **AC-04** · **Dato che** la mia quietanza non si ritrova nell’estratto conto del periodo, **Quando** l’amministratore verifica l’anomalia, **Allora** può annullare la donazione e riaprire la richiesta. (FR-DON-02)
- **AC-05** · **Dato che** l’importo della quietanza è maggiore del carrello, **Quando** la donazione viene confermata, **Allora** la differenza va alla Cassa sostegno Effatà; se è minore, l’amministratore riceve una segnalazione. (FR-INT-06)
- **AC-06** · **Dato che** l’impegno appartiene a un altro sostenitore, **Quando** provo a caricarvi una quietanza, **Allora** l’operazione viene negata.
- **AC-07** · **Dato che** sto per donare, con bonifico o con carta, **Quando** arrivo al pagamento, **Allora** vedo spiegato che la donazione si conclude solo con il pagamento o la quietanza, e la regola del credito solidale, e devo accettarla per proseguire. (FR-CAR-02)

**Regole collegate.** Non si chiede il codice TRN/CRO del bonifico. Il bonifico istantaneo ha lo stesso costo del bonifico ordinario per regolamento europeo e rende la conferma più rapida. Il messaggio “Come funziona la tua donazione” compare nella scheda della richiesta, nel carrello e al pagamento.

### SOS-06 · Usare il credito solidale

**Come** Sostenitore **voglio** usare il mio credito solidale per un’altra richiesta **così che** la mia donazione non vada persa.

- **AC-01** · **Dato che** ho un credito attivo, **Quando** apro la mia area riservata, **Allora** vedo importo, tipologia, data di scadenza e le richieste compatibili disponibili.
- **AC-02** · **Dato che** scelgo una richiesta compatibile, **Quando** confermo l’uso del credito, **Allora** la donazione viene assegnata a quella richiesta senza nuovo pagamento, il credito si chiude e ricevo la conferma con il ringraziamento.
- **AC-03** · **Dato che** apro il pulsante dell’email settimanale, **Quando** ho fatto l’accesso, **Allora** arrivo alla proposta e confermo con un clic. (FR-CAR-03)
- **AC-04** · **Dato che** provo a usare il credito su una richiesta di tipologia o importo diverso, **Quando** confermo, **Allora** l’operazione viene negata.
- **AC-05** · **Dato che** è trascorso un mese senza utilizzo, **Quando** il credito scade, **Allora** ricevo un’email che mi ringrazia e mi informa che è stato destinato al sostentamento della casa famiglia Effatà, e il credito non è più utilizzabile. (FR-INT-07)
- **AC-06** · **Dato che** il credito appartiene a un altro sostenitore, **Quando** provo a usarlo o a vederlo, **Allora** l’operazione viene negata.

**Regole collegate.** Se non ci sono richieste compatibili, il credito resta valido fino alla scadenza e le nuove richieste compatibili arrivano con l’email settimanale.

### SOS-07 · Seguire ciò che ho sostenuto ★

**Come** Sostenitore **voglio** vedere foto, documenti e rendicontazione di ciò che ho sostenuto **così da** sapere che l’aiuto è arrivato.

- **AC-01** · **Dato che** ho sostenuto un’adozione o un intervento, **Quando** apro la mia area riservata, **Allora** vedo per ognuno lo stato (pagato, in corso, realizzato, rendicontato) e la sequenza di foto, pagelle, notizie e documenti, comprese le foto riservate al padrino. (FR-FOTO-01)
- **AC-02** · **Dato che** un mio intervento ha tutte le prove caricate, **Quando** lo apro, **Allora** risulta “rendicontato” con le prove visibili. (FR-INT-03)
- **AC-03** · **Dato che** la famiglia non ha il modulo di consenso caricato, **Quando** apro la scheda, **Allora** vedo lo stato e le date ma non le foto. (FR-CON-01)
- **AC-04** · **Dato che** la mia adozione è stata chiusa, **Quando** la apro, **Allora** vedo i contenuti fino alla data di chiusura e nulla di successivo. (FR-ADO-03)
- **AC-05** · **Dato che** scarico una foto, **Quando** la salvo, **Allora** vedo l’avviso che ritrae un minore e non va pubblicata né condivisa.
- **AC-06** · **Dato che** provo ad aprire la scheda di un bambino o di un intervento che non ho sostenuto, **Quando** invio la richiesta, **Allora** l’operazione viene negata. (FR-VIS-01)
- **AC-07** · **Dato che** sono un padrino storico e il mio bambino non è ancora stato abbinato, **Quando** apro la mia area, **Allora** vedo le mie donazioni e il messaggio “Stiamo ritrovando il tuo bambino: presto vedrai le sue foto”. (AMM-09)
- **AC-08** · **Dato che** ho donato per una voce fissa, **Quando** apro la mia area, **Allora** vedo “In attesa di consegna” e, dopo la consegna, le foto con “Consegnato”. (FR-INT-08)
- **AC-09** · **Dato che** è arrivata la prova di fine anno del bambino che sostengo, **Quando** apro la sua scheda, **Allora** vedo “Anno scolastico completato” con tutte le prove, e l’adozione continua. (FR-ADO-06)

**Regole collegate.** Le foto sono scaricabili per uso personale. In fase 2 il pulsante “Scrivi un messaggio” permette di scrivere all’associazione, che inoltra alla referente (anche per gli auguri di compleanno, FR-ADO-05); la chat resta fra gli sviluppi futuri.

### SOS-08 · Storico e riepilogo annuale

**Come** Sostenitore **voglio** consultare le mie donazioni e il riepilogo dell’anno **così da** avere tutto in ordine per la dichiarazione dei redditi.

- **AC-01** · **Dato che** ho fatto delle donazioni, **Quando** apro lo storico, **Allora** le vedo con data, importo, destinazione, metodo e stato, filtrabili per anno e paginate.
- **AC-02** · **Dato che** è iniziato il nuovo anno, **Quando** apro il riepilogo dell’anno precedente, **Allora** posso scaricarlo in PDF con l’indicazione che non è valido ai fini fiscali e che la certificazione arriverà dall’associazione entro marzo. (FR-RIC-01, FR-VER-03)
- **AC-03** · **Dato che** trovo un errore nel riepilogo, **Quando** tocco “Segnala un errore” e lo descrivo, **Allora** l’amministratore riceve la segnalazione nella sua lista di cose da fare.
- **AC-04** · **Dato che** ho bisogno di una copia della certificazione, **Quando** tocco “Richiedi copia della certificazione”, **Allora** la richiesta arriva all’amministratore. (FR-RIC-01)
- **AC-05** · **Dato che** provo a consultare lo storico di un altro sostenitore, **Quando** invio la richiesta, **Allora** l’operazione viene negata.
- **AC-06** · **Dato che** consulto lo storico, **Quando** apro una donazione, **Allora** arrivo alla scheda di ciò che ha finanziato, con lo stato della sua rendicontazione. (SOS-07)

**Regole collegate.** Lo storico mostra il lato economico, la scheda del sostegno (SOS-07) la rendicontazione: le due viste sono collegate.

### SOS-09 · Preferenze e dati sensibili

**Come** Sostenitore **voglio** scegliere le comunicazioni che ricevo e modificare i miei dati in sicurezza **così da** avere il controllo delle mie informazioni.

- **AC-01** · **Dato che** apro le preferenze, **Quando** attivo o disattivo avvisi di novità, promemoria, newsletter e la possibilità di comparire nei post social, **Allora** la scelta vale da subito; ringraziamenti, conferme e comunicazioni obbligatorie restano sempre attive. (FR-COM-01)
- **AC-02** · **Dato che** cambio la mia email, **Quando** confermo, **Allora** ricevo un link di conferma sulla nuova email e un avviso sulla vecchia. (FR-SEC-02)
- **AC-03** · **Dato che** cambio IBAN o codice fiscale, **Quando** confermo, **Allora** ricevo un avviso e la modifica diventa effettiva solo dopo l’approvazione dell’amministratore. (FR-SEC-02)
- **AC-04** · **Dato che** voglio più sicurezza, **Quando** attivo la verifica in due passaggi dal profilo, **Allora** dal successivo accesso mi viene chiesto anche il codice. (FR-SEC-01)
- **AC-05** · **Dato che** chiedo la cancellazione del mio account, **Quando** confermo, **Allora** la richiesta arriva all’amministratore e vengo informato che i dati delle donazioni restano conservati per gli obblighi fiscali.
- **AC-06** · **Dato che** provo a modificare i dati di un altro sostenitore, **Quando** invio la richiesta, **Allora** l’operazione viene negata.

**Regole collegate.** Il diritto alla cancellazione (GDPR) è limitato dalla conservazione dei dati fiscali per 10 anni (cap. 13.4).

## 5.5 Socio (fase 2)

### SOC-01 · Aderire e gestire la mia quota

**Come** Sostenitore o Socio **voglio** chiedere l’adesione e pagare la quota associativa **così da** partecipare ed essere in regola.

- **AC-01** · **Dato che** sono registrato, **Quando** invio la richiesta di adesione, **Allora** l’amministratore la riceve e, se la approva, ottengo anche il ruolo di Socio.
- **AC-02** · **Dato che** sono Socio, **Quando** apro il mio pannello, **Allora** vedo lo storico delle quote pagate e lo stato della quota dell’anno in corso.
- **AC-03** · **Dato che** voglio pagare la quota dell’anno in corso o del successivo, **Quando** la metto nel carrello, **Allora** posso pagarla con carta oppure con bonifico e caricamento della quietanza, come una donazione. (FR-PAG-01, FR-DON-01)
- **AC-04** · **Dato che** la quota sta per scadere, **Quando** mancano pochi giorni alla scadenza, **Allora** ricevo un’email di avviso; se non la rinnovo, ricevo un promemoria nei tre mesi successivi.
- **AC-05** · **Dato che** il pagamento è con bonifico, **Quando** l’estratto conto viene importato, **Allora** la quota passa da “dichiarata” a “confermata”. (AMM-04)
- **AC-06** · **Dato che** non sono Socio, **Quando** provo ad aprire l’area soci, **Allora** l’accesso viene negato. (FR-RUO-03)
- **AC-07** · **Dato che** pago la quota, **Quando** ricevo la conferma, **Allora** la causale e la conferma la indicano come quota associativa, non come erogazione liberale, ed è esclusa dal riepilogo per la detrazione. (FR-SOC-01)

### SOC-02 · Consultare convocazioni e verbali

**Come** Socio **voglio** trovare convocazioni e verbali delle assemblee **così da** partecipare alla vita associativa.

- **AC-01** · **Dato che** l’amministratore pubblica una convocazione, **Quando** apro l’area soci, **Allora** la trovo con data, luogo e ordine del giorno, e ricevo un avviso via email.
- **AC-02** · **Dato che** apro una convocazione, **Quando** tocco “Parteciperò” o “Non parteciperò”, **Allora** l’amministratore vede il numero dei presenti previsti.
- **AC-03** · **Dato che** un’assemblea si è svolta, **Quando** apro l’area soci, **Allora** trovo il verbale approvato.
- **AC-04** · **Dato che** non sono Socio, **Quando** provo ad aprire convocazioni o verbali, **Allora** l’accesso viene negato.

### SOC-03 · Consultare i bilanci

**Come** Socio **voglio** consultare i bilanci approvati **così da** conoscere l’andamento dell’associazione.

- **AC-01** · **Dato che** un bilancio è stato approvato, **Quando** apro l’area soci, **Allora** lo trovo in PDF, caricato dall’amministratore (il bilancio è prodotto con VERIF!CO).
- **AC-02** · **Dato che** non sono Socio, **Quando** provo ad aprire i bilanci, **Allora** l’accesso viene negato.

**Regole collegate.** Tessera socio digitale, stato “in regola” secondo lo statuto ed esportazione del libro dei soci verranno valutati dopo la verifica del modulo “Associati” di VERIF!CO (Appendice B).

## 5.6 Decisioni

Ogni scelta che le storie lasciano aperta è decisa qui, in modo verificabile, con le storie a cui si collega e, dove serve, la motivazione.

### Ruoli e visibilità

**FR-RUO-01 · Permessi dei volontari** (AMM-08, VOL-01…04). Il volontario vede le informazioni non sensibili ed esegue solo le azioni abilitate dall’amministratore: preparare richieste, caricare prove, aggiornare schede, pubblicare sui social (contenuti 📣 e pubblicazione delle bozze Facebook). Le altre vengono negate dal backend con 403, anche quando la richiesta arriva dal bot. Report e promozioni del bot sono riservati all’amministratore.

**FR-RUO-02 · Dati sensibili solo all’amministratore** (AMM-02, SOS-02). Dati bancari e fiscali, quietanze, dati sanitari e moduli di consenso sono accessibili solo agli amministratori; la regola non è configurabile. **Motivazione:** minimizzazione richiesta dal GDPR.

**FR-RUO-03 · Area soci** (SOC-01, SOC-02, SOC-03; fase 2). Il socio vede stato della quota, convocazioni, verbali e bilanci; chi non è socio riceve un diniego.

**FR-RUO-04 · Visibilità dei dati configurabile** (AMM-02, AMM-08). Dalla dashboard l’amministratore stabilisce quali dati non sensibili di bambini e famiglie vedono volontari e sostenitori (per esempio il cognome per il volontario, scuola e classe, storia completa o riassunto per il sostenitore). Restano fisse: dati sanitari e moduli di consenso solo all’amministratore; cognome e luogo esatto di residenza mai al sostenitore; il sostenitore vede solo ciò che ha sostenuto (FR-VIS-01); il compleanno è legato al consenso della famiglia (FR-ADO-05). Ogni modifica della configurazione viene registrata (chi, quando, cosa).

**FR-VIS-01 · Ogni sostenitore vede solo ciò che ha donato** (SOS-03, SOS-07, FR-INT-01). Una famiglia o un beneficiario può ricevere da più sostenitori, ma ognuno vede solo le adozioni e gli interventi che ha finanziato, con foto, prove e documenti. Nelle foto possono comparire altri membri della famiglia (accettato); non vede le schede degli altri bambini né gli altri interventi ricevuti dalla famiglia, né donazioni e identità degli altri sostenitori. Negli interventi con più finanziatori vede la propria quota e lo stato, non gli altri finanziatori. Nella vetrina, una richiesta sostenuta da altri mostra solo l’etichetta “Sostenuto ✓”. Una richiesta API su dati non propri riceve 403.

### Registrazione, accesso e sicurezza

**FR-REG-01 · Registrazione libera e dati per fasi** (SOS-01, SOS-02). Chiunque può registrarsi (anche dal menu di effataitalia.it) con nome, cognome, email e password, la presa visione dell’informativa privacy (casella non preselezionata, data e versione dell’informativa salvate) e la conferma dell’email; dopo la conferma l’account è attivo subito. Due consensi facoltativi, separati e non preselezionati: newsletter e comunicazioni; comparire nei post social (FR-COM-02). Chi era ospite non prende di nuovo visione dell’informativa, salvo una nuova versione. I dati si chiedono un po’ alla volta: all’ospite solo l’email; alla registrazione l’identità; alla prima donazione il codice fiscale (facoltativo), l’eventuale avente diritto, il telefono (facoltativo), l’eventuale opposizione all’invio dei dati all’Agenzia delle Entrate e l’accettazione di “Come funziona la tua donazione”. Limite ai tentativi ripetuti contro le registrazioni automatiche. **Motivazione:** minimizzazione richiesta dal GDPR; l’informativa si legge, mentre i veri consensi sono solo quelli facoltativi, revocabili dal profilo (SOS-09).

**FR-REG-02 · Disattivazione da parte dell’amministratore.** L’amministratore può disattivare o archiviare un account in qualsiasi momento, con le regole di FR-ACC-02.

**FR-REG-03 · Collegamento ai dati storici** (fase 2, AMM-09). Un nuovo account viene collegato a un padrino storico solo con una prova di identità: email verificata coincidente con quella in archivio, codice di invito monouso inviato ai contatti già noti, conferma dell’amministratore su un canale già in archivio, oppure bonifico con codice da un IBAN già noto. Mai sulla sola base di codice fiscale, nome o IBAN inseriti dall’utente. **Motivazione:** questi dati identificano una persona ma non dimostrano che sei tu.

**FR-REG-04 · Ospiti, simpatizzanti e sostenitori** (SOS-01). Chi entra con il link promozionale è ospite per 7 giorni (FR-REG-05); chi si registra è simpatizzante; diventa sostenitore automaticamente con la prima donazione o la prima adozione. Il ruolo di socio si aggiunge in modo indipendente (SOC-01).

**FR-REG-05 · Accesso ospite** (SOS-01, SOS-03). La referente manda a chi vuole aiutare il link promozionale della vetrina, sempre lo stesso. Chi lo apre lascia solo l’email e prende visione dell’informativa; riceve un link per entrare, senza password, e per 7 giorni vede tutta la vetrina (richieste personali, voci fisse, calendario solidale), con le sole foto pubbliche e senza poterle scaricare. Può riempire il carrello, salvare preferiti e condividere; per donare si registra e ritrova il carrello. Al 5° giorno riceve un promemoria; dopo 7 giorni l’accesso scade e può chiederne un altro. La durata è configurabile (FR-IMP-01); la vista d’insieme mostra quanti ospiti diventano sostenitori (FR-DASH-01). L’accesso senza password per tutti gli utenti è in fase 2. **Motivazione:** chi contatta la referente spesso non sa ancora come aiutare, e vedere tutta la vetrina lo aiuta a scegliere (materassi, terreni, adozioni); l’email permette di sapere chi ha visto le foto dei minori e di ricontattarlo.

**FR-SEC-01 · Password e accesso** (SOS-01, SOS-09). Password di almeno 12 caratteri, rifiutata se presente negli elenchi di password violate; salvata solo con un algoritmo di hashing dedicato (bcrypt o Argon2); blocco temporaneo dopo tentativi errati; recupero con link a scadenza e monouso; nessun messaggio che riveli se un’email è registrata; verifica in due passaggi obbligatoria per amministratori e volontari, facoltativa per sostenitori e soci.

**FR-SEC-02 · Modifica dei dati critici** (SOS-09). Cambio email: conferma sulla nuova e avviso alla vecchia. Cambio IBAN o codice fiscale: avviso al sostenitore e conferma dell’amministratore prima che diventi effettivo. Gli altri dati si modificano liberamente.

**FR-ACC-01 · Scadenza dell’accesso per inattività** (fase 2). Senza transazioni economiche per un periodo configurabile (predefinito 12 mesi) l’accesso viene disattivato, con avvisi email nei giorni configurati.

**FR-ACC-02 · Archiviazione e ripristino** (fase 2). L’account scaduto passa allo stato archiviato: niente accesso, dati conservati, ripristinabile con tutto lo storico. Il tempo massimo di archiviazione è definito nel capitolo 13.4.

**FR-ACC-03 · Impostazioni dell’accesso** (AMM-08; fase 2). L’amministratore configura periodo di inattività, avvisi e modalità di ripristino (manuale o automatico al nuovo pagamento).

### Famiglie, bambini e adozioni

**FR-ADO-01 · Un bambino, un solo sostenitore attivo** (AMM-03). Un bambino può avere nel tempo più adozioni, ma al massimo una attiva. Per riaffidarlo l’amministratore chiude l’adozione (data di fine e motivo) e ne apre una nuova; un tentativo di aprire una seconda adozione attiva viene impedito con errore esplicito. **Motivazione:** quando un sostenitore interrompe, il bambino viene riaffidato; lo storico serve alla rendicontazione e alle certificazioni.

**FR-ADO-02 · Cosa passa con il riaffido** (AMM-03, VOL-02). Il nuovo sostenitore vede tutto lo storico del bambino (foto, pagelle, notizie) e nessun dato del sostenitore precedente (identità, donazioni, lettere, messaggi). **Motivazione:** continuità per il bambino, riservatezza per il sostenitore.

**FR-ADO-03 · Cosa vede il sostenitore dopo la chiusura** (AMM-03, SOS-07). Il sostenitore precedente vede le informazioni del bambino e le proprie fino alla data di chiusura, nulla di successivo.

**FR-ADO-04 · Durata e rinnovo dell’adozione.** L’adozione scolastica dura un anno scolastico e si rinnova, oppure prosegue con un bonifico ricorrente (codice 12 nel tracciato VERIF!CO). In fase 2: promemoria prima della scadenza e pagamento ricorrente con carta.

**FR-ADO-05 · Compleanno** (AMM-02). Con il modulo di consenso caricato, il sostenitore vede giorno e mese del compleanno del bambino, mai l’anno di nascita. In fase 2 riceve un’email qualche giorno prima, con l’invito a mandare gli auguri tramite l’associazione.

**FR-ADO-06 · Adozione e anno scolastico** (VOL-01, VOL-03, SOS-07). L’adozione è il rapporto fra padrino e bambino: resta attiva finché il padrino non smette o il bambino non esce dal programma (AMM-03). Ogni anno pagato (180 €) crea un intervento “adozione scolastica BAM-0215 – anno 2026”, con la checklist iscrizione, foto con la divisa e prova di fine anno (pagella, lavori di fine anno o quaderni). Con la prova di fine anno l’intervento diventa “rendicontato” e il padrino vede “Anno scolastico 2026 completato”; l’adozione continua e con il rinnovo nasce l’anno successivo. Le pagelle intermedie sono aggiornamenti della scheda. Gli anni senza prova di fine anno compaiono in “Cose da fare”. **Motivazione:** il padrino ha ogni anno un traguardo chiaro, senza che il rapporto con il bambino si interrompa.

**FR-CON-01 · Consenso della famiglia** (AMM-01, AMM-02, VOL-01, SOS-03, SOS-07). Ogni famiglia ha un **modulo di consenso unico, valido per tutte le voci** (foto al sostenitore, pubblicazione su social e sito, comunicazione del compleanno), che si accetta per intero, senza scelte parziali.
- Il modulo riporta nome del genitore o tutore, villaggio e data. La referente lo fa firmare (o apporre l’impronta digitale davanti a un testimone), lo fotografa e lo invia via WhatsApp; l’originale cartaceo resta alla referente. Per i bambini della casa famiglia firma la referente stessa, che ne è il tutore, e aggiorna il modulo quando entra un nuovo bambino.
- L’amministratore aggancia il modulo alla scheda famiglia giusta, carica la foto o la scansione e spunta **una sola casella, “modulo di consenso caricato”**, con data e nome di chi l’ha raccolto. Il modulo è un dato sensibile (FR-RUO-02).
- Il sistema applica il consenso automaticamente a ogni visualizzazione e pubblicazione, compresa quella del bot, che lo chiede al gestionale prima di pubblicare. **Senza modulo caricato la famiglia è trattata come “nessun consenso”**: foto archiviate ma non mostrate, nessuna pubblicazione nella vetrina né sui social, nessun compleanno. Per i contenuti social senza un beneficiario preciso il volontario conferma che non ci sono minori riconoscibili senza consenso.
- Se il genitore non accetta tutte le voci o revoca il consenso vale “nessun consenso”, con effetto immediato anche sui contenuti già caricati.
- La vista d’insieme mostra le famiglie con e senza modulo caricato. I consensi delle famiglie attuali vengono raccolti gradualmente durante le visite della referente; per il primo collaudo bastano alcune famiglie con modulo caricato.

**Motivazione:** un solo documento da raccogliere e una sola casella da spuntare riducono gli errori. Il consenso unico va verificato con il referente privacy dell’associazione, perché il GDPR chiede consensi specifici per scopo (Appendice B, DIP-14).

### Richieste di sostegno, carrello e pagamenti

**FR-CAT-01 · Richieste personali e voci fisse** (AMM-01, SOS-03). La vetrina offre due tipi di sostegno.
- **Richieste personali**, per un beneficiario preciso (bambino, famiglia o comunità): adozione scolastica, adozione in casa famiglia, operazione chirurgica, carrozzina, costruzione casa, affitto terreno agricolo, acquisto terreno edificabile. Ognuna ha foto pubbliche, storia, costo, codice (RIC-0042) e stato (bozza, aperta, sostenuta, chiusa). Nasce dal bot (🆘 Richiesta di aiuto) o dal gestionale, preparata da un volontario abilitato; l’amministratore la approva. Una richiesta aperta da più di 30 giorni senza sostenitori viene segnalata. Per le operazioni la storia descrive il bisogno in modo generico, mai la diagnosi, anche nei testi social.
- **Voci fisse**, bisogni sempre presenti e non legati a un beneficiario al momento della donazione: materassi, scarpe, animali (il sostenitore sceglie la specie, ognuna con il suo prezzo), opere della casa famiglia (importo libero) e sostegno della casa famiglia, che rimanda al calendario solidale (FR-CAN-03). Il sostenitore può indicare “quanti” (es. 3 materassi × 10 € = 30 €) solo per calcolare l’importo: il gestionale registra importo e categoria, non le unità. Il beneficiario si decide alla consegna (FR-INT-08). Un post di richiesta di aiuto per una voce fissa non crea una richiesta nuova, ma rimanda alla voce.

L’amministratore aggiunge o toglie dalla vetrina, dalla dashboard, sia le richieste sia le voci fisse. Le categorie sono un’unica lista gestita nel gestionale e usata anche dal bot (FR-BOT-03).

**FR-SOS-01 · Causale standard** (SOS-05). Al momento del bonifico il sostenitore trova la causale già compilata da copiare (es. `EROGAZIONE LIBERALE – CF … – ADOZIONE BAM-0102`, `EROGAZIONE LIBERALE – CF … – MATERASSI`), secondo FR-FIS-01.

**FR-SOS-02 · Vetrina e carrello solidale** (SOS-03). La vetrina è riservata agli utenti registrati e agli ospiti (FR-REG-05) e mostra le richieste personali aperte e quelle sostenute negli ultimi 30 giorni (“Sostenuto ✓”), le voci fisse e la card “Adotta un giorno” che porta al sito del calendario solidale. Il sostenitore cerca e filtra le richieste (per tipo e costo), le mette nel carrello e le paga. Mettere una richiesta nel carrello **non la prenota**. Alla chiusura della sessione il carrello si svuota e il contenuto passa nei **preferiti**; chi ha fra i preferiti una richiesta unica che viene sostenuta da altri riceve un avviso con proposte simili. Ogni richiesta si può condividere su WhatsApp: il collegamento porta all’accesso, alla registrazione o all’accesso ospite. **Motivazione:** il pubblico conosce già le storie dai social; la vetrina è il passo successivo per chi vuole seguire da vicino.

**FR-PAG-01 · Metodi di pagamento** (SOS-04, SOS-05, SOC-01). Metodo principale: **carta**, tramite un fornitore di pagamenti esterno, con conferma immediata; i dati della carta non passano mai dal gestionale. Ultima scelta: **bonifico**, con IBAN e causale standard e caricamento della quietanza (FR-DON-01). Satispay è offerto dalla stessa pagina di Stripe, insieme alla carta, senza integrazioni in più; PayPal in fase 2.

**FR-CAR-01 · Chi paga per primo** (SOS-03, SOS-04, SOS-05). Vale solo per le richieste personali: le voci fisse non si esauriscono. Una richiesta personale resta disponibile finché non arriva un pagamento: con carta vale la conferma immediata, con bonifico il caricamento della quietanza. Il primo pagamento vince: la richiesta passa a “Sostenuto ✓” e non è più acquistabile.

**FR-CAR-02 · Credito solidale** (SOS-04, SOS-05, SOS-06). Se arriva un secondo pagamento per una richiesta già sostenuta, la donazione diventa un **credito solidale** nell’area riservata del sostenitore, utilizzabile per un’altra richiesta **della stessa tipologia e dello stesso importo**. Il credito non è rimborsabile né cedibile. Il sostenitore riceve un messaggio che lo ringrazia e spiega la situazione; la regola è spiegata prima del pagamento e va accettata (SOS-05, AC-07).

**FR-CAR-03 · Scadenza del credito solidale** (SOS-06). Chi ha un credito attivo riceve **un’email ogni settimana** con le richieste compatibili disponibili e un pulsante che porta nell’area riservata per accettarne una dopo l’accesso, più un avviso prima della scadenza. Dopo **1 mese** il credito scade e diventa **erogazione liberale per il sostentamento della casa famiglia Effatà** (FR-INT-07); il sostenitore riceve un’email di ringraziamento che lo informa.

**FR-DON-01 · Quietanza caricata dal sostenitore** (SOS-05). Dopo il bonifico il sostenitore carica nell’area riservata la quietanza della banca, con importo e data: la donazione passa allo stato “dichiarata”. La quietanza è un dato sensibile (FR-RUO-02). Promemoria dopo 7 giorni senza quietanza; dopo 30 giorni l’impegno decade e il contenuto torna nei preferiti.

**FR-DON-02 · Conferma e anomalie** (AMM-04, SOS-05). All’importazione mensile dell’estratto conto le donazioni dichiarate vengono ritrovate e passano a “confermate”; solo quelle confermate vanno a VERIF!CO. Una donazione dichiarata non ritrovata diventa un’anomalia: l’amministratore verifica e, se la quietanza non corrisponde a un bonifico reale, annulla la donazione (con il motivo) e riapre la richiesta. Una donazione non viene mai cancellata.

**FR-FIS-01 · Donante e avente diritto alla detrazione** (SOS-02, SOS-05). Nel modulo dati si indica l’avente diritto alla detrazione (nome, cognome, codice fiscale) se diverso dal donante, e l’eventuale opposizione all’invio dei dati all’Agenzia delle Entrate. La causale standard contiene la dicitura “erogazione liberale”, il codice fiscale dell’avente diritto, nome e cognome se non intestatario del conto e il codice dell’adozione o dell’intervento. Vincolo: la causale resta entro 140 caratteri. Il codice fiscale del donante è facoltativo: senza, la donazione è valida ma non riceve la certificazione, e il donatore ne è avvisato prima del pagamento. L’indirizzo non è richiesto.

**FR-RING-01 · Conferme e ringraziamenti automatici** (SOS-04, SOS-05, AMM-03). Alla scelta del bonifico parte un’email con IBAN e causale standard. La **conferma di donazione con il ringraziamento** parte al pagamento con carta o al caricamento della quietanza, e indica che non è valida ai fini fiscali (FR-RIC-01). Alla chiusura di un’adozione parte un’email di ringraziamento per il sostegno dato. I testi sono modelli modificabili dall’amministratore; il bot non invia più ringraziamenti; in caso di errore di invio il sistema ritenta e lo segnala nella vista d’insieme.

**FR-COM-01 · Preferenze di comunicazione** (SOS-09). Il sostenitore sceglie quali comunicazioni ricevere: ringraziamenti, conferme e comunicazioni obbligatorie sempre; avvisi di novità, promemoria e newsletter a scelta.

### Interventi e imputazione

**FR-INT-01 · Finanziatori di un intervento.** Un intervento ha uno o più finanziatori, ciascuno con la propria quota; la somma delle quote non supera il costo. Nel caso normale c’è un solo finanziatore. **Motivazione:** prevedere subito il caso multiplo evita migrazioni del modello dei dati.

**FR-INT-02 · Imputazione delle entrate** (AMM-05). Ogni entrata confermata va imputata a un capitolo (adozioni, adozioni in casa famiglia, casetta, affitto, animali, operazione, sedia a rotelle…, casa famiglia Effatà, Cassa sostegno Effatà) e, dove previsto, a un intervento, che diventa una “cosa da fare”. Ogni capitolo corrisponde a un Progetto di VERIF!CO (ID_PROGETTO), che porta il movimento sul conto di ricavo:

| Categorie del gestionale | Progetto e conto di VERIF!CO |
| --- | --- |
| Adozione scolastica | Adozioni scolastiche (215.020.01) |
| Adozione in casa famiglia; opere e sostegno della casa famiglia | Casa struttura (215.020.02) |
| Materassi, scarpe, animali, costruzione casa, affitto terreno agricolo, acquisto terreno edificabile | Aiuto famiglie in difficoltà (215.020.03) |
| Operazione chirurgica, carrozzina | Cure ospedaliere (215.020.04) |
| Cassa sostegno Effatà | Da definire con l’amministratore |

Il tracciato di importazione di VERIF!CO non ha un campo per il conto di bilancio, quindi la destinazione viaggia con il campo Progetti. Che il progetto porti davvero il movimento sul conto giusto va verificato con l’assistenza VERIF!CO (DIP-12, DIP-15). **Motivazione:** oggi l’imputazione in VERIF!CO si fa con il conto di bilancio e i Progetti quasi non sono usati.

**FR-INT-03 · Checklist di rendicontazione per tipo** (VOL-01, SOS-07). Ogni tipo di intervento ha un elenco di prove di realizzazione richieste, configurabile dall’amministratore: foto della consegna per materassi, scarpe e animali; iscrizione, foto con la divisa e prova di fine anno per l’anno scolastico (FR-ADO-06); foto, contratto e fattura dove esistono, come per la casetta. Un intervento è “rendicontato” solo con tutte le prove caricate, che diventano visibili al donante nella sua area riservata (con le regole di FR-CON-01). Quando le prove arrivano dal bot, il bot mostra le voci mancanti, l’AI propone quella giusta guardando le foto e il volontario conferma con un tocco, una volta per invio; le foto che non corrispondono a una voce vanno nella scheda come aggiornamento.

**FR-INT-04 · Costo dichiarato dell’intervento** (AMM-01, AMM-08). Ogni tipo di intervento ha un costo standard in un listino configurabile, proposto come valore iniziale; ogni richiesta può avere un costo proprio (per esempio l’adozione in casa famiglia di un bambino con disabilità). La spesa coincide con il costo dichiarato e finanziato dal donante; non si registrano fatture di spesa. Il volontario che prepara una richiesta può proporre un costo diverso dal listino (es. il preventivo di un’operazione indicato dalla referente); decide l’amministratore all’approvazione. Il costo si può modificare solo prima del primo pagamento, poi resta congelato.

**FR-INT-05 · Donazioni generiche** (AMM-05). Un’entrata senza destinazione specifica va nel capitolo “Cassa sostegno Effatà”, senza creare interventi.

**FR-INT-06 · Imputazione guidata dalla causale** (AMM-05, SOS-05). La parte dell’entrata che corrisponde a interventi riconoscibili dalla causale (le richieste personali per il loro costo, le voci fisse per l’importo indicato) viene imputata a quegli interventi o a quelle voci; tutto ciò che non corrisponde va nella Cassa sostegno Effatà. Esempio: 200 € con causale “adozione BAM-0102” → 180 € all’adozione + 20 € in cassa. In fase 1 l’amministratore imputa a mano le causali libere; in fase 2 l’AI potrà proporre l’imputazione, sempre confermata dall’amministratore.

**FR-INT-07 · Casa famiglia Effatà** (SOS-06, AMM-07). La casa famiglia Effatà è un progetto specifico dell’associazione: una comunità protetta per minori, di cui la referente è tutore. Ha un proprio capitolo, distinto dalla Cassa sostegno Effatà (la cassa per le donazioni generiche), e un proprio ID_PROGETTO in VERIF!CO. In vetrina ha due voci fisse: **opere della casa famiglia** (lavori e acquisti, importo libero) e **sostegno della casa famiglia** (cibo, cuoca, infermiera, personale assistenziale, manutenzione), che corrisponde ai 50 € al giorno del calendario solidale. Riceve i crediti solidali scaduti (FR-CAR-03), compare fra i capitoli con obiettivo annuale (FR-DASH-02) ed è collegata alle adozioni in casa famiglia.

**FR-INT-08 · Consegne delle voci fisse** (VOL-01, SOS-07). Per le voci fisse si rendiconta la donazione, non si contano le unità. Le donazioni per una voce fissa restano “in attesa di consegna”. Quando la referente manda le foto di una consegna (es. materassi alla famiglia FAM-0045), il volontario le carica con ✅ Aiuto consegnato e la categoria, indicando se vuole la famiglia (utile allo storico, non obbligatoria); il gestionale crea l’intervento e gli collega tutte le donazioni di quella voce ancora da rendicontare, che diventano “rendicontate”: ogni donatore vede le foto con “Consegnato”. Le donazioni successive aspettano la consegna seguente. **Motivazione:** la referente compra e consegna secondo i bisogni, non a pezzi per donatore; contare le unità creerebbe consegne “in più” o “in meno” senza utilità per chi dona.

### Canali, VERIF!CO e certificazioni

**FR-CAN-01 · Canali di entrata** (AMM-05). Le donazioni arrivano dal conto UniCredit (bonifici singoli e versamenti cumulativi di Stripe, il fornitore delle carte, che gestisce anche Satispay) e da campagne e iniziative esterne come GoFundMe o il calendario solidale. I versamenti delle campagne si imputano alla raccolta fondi corrispondente (ID_RACCOLTAFONDI di VERIF!CO) e possono finanziare interventi, senza creare sostenitori individuali.

**FR-CAN-03 · Calendario solidale** (AMM-04). Il calendario solidale resta un sito a sé (calendario.effataitalia.it), con la sua griglia dei giorni e le gift card; un giorno si adotta una sola volta, con 50 €, con carta o Satispay tramite Stripe. La vetrina vi rimanda con la card “Adotta un giorno”. Ogni giorno il gestionale importa in automatico le donazioni del calendario (con un token, non con la password dell’amministratore): le registra come confermate, le imputa al sostegno della casa famiglia, crea o aggiorna l’anagrafica del donatore e le include nel file per VERIF!CO. **Motivazione:** il calendario usa lo stesso account del fornitore delle carte, quindi senza queste donazioni i versamenti sul conto non tornerebbero con le quadrature; inoltre le offerte diventano visibili subito (intervista 3).

**FR-CAN-02 · Invito ai donatori delle campagne** (fase 2). Tramite i messaggi della piattaforma l’associazione invita i donatori a registrarsi; i consensi si raccolgono alla registrazione.

**FR-VER-01 · Dati fra gestionale e VERIF!CO** (AMM-06). VERIF!CO resta il riferimento per contabilità, uscite, fornitori, bilancio, certificazioni e newsletter. Le anagrafiche raccolte e completate nel gestionale passano anche a VERIF!CO (direzione gestionale → VERIF!CO); le correzioni fatte direttamente in VERIF!CO vanno riportate anche nel gestionale. Il collegamento avviene tramite l’ID dell’anagrafica VERIF!CO. L’associazione usa **VERIF!CO Maxi** (contabilità per competenza): il file di caricamento contiene solo le **entrate confermate, con importi positivi**, e usa i campi ID_PROGETTO, ID_RACCOLTAFONDI e ID_5PER1000. I movimenti si collegano alle anagrafiche in due modi: nel tracciato master tramite l’anagrafica, nel tracciato Stripe tramite l’**email**, perché quel tracciato non ha il codice fiscale; per questo l’anagrafica in VERIF!CO deve avere la stessa email usata nel pagamento, e la stessa email non deve appartenere a più anagrafiche. Il tracciato non ha un campo per il conto di bilancio: la destinazione contabile viaggia con il campo Progetti (FR-INT-02).

**FR-VER-02 · Caricamento massivo in VERIF!CO** (AMM-06). Ogni mese, dopo l’importazione dell’estratto conto, l’amministratore apre “Contabilità → Prepara VERIF!CO” e il gestionale genera tre file: 1) le **anagrafiche** nuove o modificate, con codice fiscale ed email uguale a quella dei pagamenti (file di importazione, se VERIF!CO lo consente, oppure elenco da inserire a mano); 2) i **bonifici** confermati nel tracciato master; 3) i **pagamenti con carta e Satispay** nel tracciato Stripe, una riga per pagamento (calendario compreso), con l’email del donatore. L’amministratore li carica da “Contabilità → Importazione movimenti” in quest’ordine, prima le anagrafiche e poi i movimenti, e segna il mese come “caricato”. In VERIF!CO i pagamenti con carta entrano sul conto finanziario STRIPE alla data del pagamento; i versamenti di Stripe sul conto UniCredit si registrano come giroconto da STRIPE a UNICREDIT, con le commissioni di Stripe come costo (un movimento per versamento; schema da confermare con il commercialista, Appendice B). Un invio completamente automatico richiederebbe un’API di VERIF!CO (DIP-12).

**FR-VER-03 · Chiusura annuale per le certificazioni** (AMM-06, SOS-08). Dal 1° gennaio la sezione Scadenze mostra la checklist di chiusura dell’anno precedente, con scadenza predefinita al 15 febbraio: estratto conto di dicembre importato; nessuna donazione dell’anno ancora dichiarata o con anomalie; l’elenco dei donatori dell’anno senza codice fiscale, con la possibilità di inviare inviti a completarlo prima della chiusura; file e anagrafiche caricati in VERIF!CO. **Motivazione:** VERIF!CO invia le certificazioni una volta l’anno, fra fine febbraio e inizio marzo; i dati devono essere completi prima.

**FR-RIC-01 · Certificazioni per la detrazione** (SOS-08, AMM-06). Le certificazioni restano prodotte e inviate da VERIF!CO, una volta l’anno, sulle donazioni dell’anno precedente. Il gestionale invia solo la conferma di donazione con il ringraziamento, non valida ai fini fiscali. Nell’area riservata, da gennaio, il riepilogo annuale delle donazioni in PDF (non valido ai fini fiscali) e il pulsante “Richiedi copia della certificazione”, che crea una richiesta per l’amministratore. Il caricamento dei PDF delle certificazioni sarà valutato dopo la risposta dell’assistenza VERIF!CO (DIP-12).

### Vista d’insieme, report e impostazioni

**FR-DASH-01 · Vista d’insieme** (AMM-07). La dashboard dell’amministratore mostra: persone per ruolo (ospiti, simpatizzanti, sostenitori, archiviati) e quanti ospiti diventano sostenitori; donatori senza codice fiscale; bambini con e senza sostenitore; famiglie con e senza modulo di consenso; donazioni del periodo, dichiarate e confermate separatamente; entrate da abbinare o da imputare; Cassa sostegno Effatà; crediti solidali attivi; interventi per tipo e per stato con le prove mancanti; padrini storici senza bambino e bambini senza padrino; invii dal bot rifiutati; segnalazioni e anomalie. Ogni numero si apre in un elenco. Il volontario vede solo i numeri operativi, senza importi.

**FR-DASH-02 · Obiettivi e andamento** (AMM-07). L’amministratore fissa un obiettivo annuale per ogni capitolo; la vista d’insieme mostra raccolto contro obiettivo, con la percentuale, e l’andamento mese per mese di donazioni e interventi, confrontato con lo stesso periodo dell’anno precedente. Gli obiettivi potranno essere ripresi dal piano economico di VERIF!CO, se esiste (Appendice B). **Motivazione:** interviste 1 e 3 (cap. 6.2): avere sempre il dato aggiornato rispetto al previsionale.

**FR-REP-01 · Filtri, report e scadenze** (AMM-07). Ogni elenco è paginato, filtrabile per categoria e periodo ed esportabile in Excel. La sezione Scadenze raccoglie in un solo punto le date da rispettare: importazione dell’estratto conto del mese precedente (entro il giorno 10), chiusura annuale (FR-VER-03), crediti solidali in scadenza, impegni con bonifico in attesa di quietanza, richieste senza sostenitori, rinnovi delle adozioni (fase 2). **Motivazione:** intervista 4 (cap. 6.2).

**FR-REP-02 · Ricerca e situazione di una persona** (AMM-07). L’amministratore cerca una persona per nome, email, codice fiscale o IBAN, oppure un beneficiario per nome o codice, e ne apre la situazione completa: dati, donazioni con il loro stato, adozioni e interventi sostenuti, crediti, comunicazioni inviate. **Motivazione:** intervista 4 (cap. 6.2): trovare subito le informazioni senza scorrere elenchi.

**FR-IMP-01 · Impostazioni configurabili** (AMM-08). L’amministratore modifica senza interventi tecnici le impostazioni seguenti; ogni modifica è registrata con chi, quando, valore precedente e nuovo valore.

| Impostazione | Valore predefinito |
| --- | --- |
| Azioni abilitate per ogni volontario | Nessuna |
| Visibilità dei dati non sensibili (FR-RUO-04) | Come nella scheda beneficiario (cap. 5.7) |
| Listino dei tipi di intervento e checklist di rendicontazione | Definiti con l’associazione prima del collaudo |
| Obiettivi annuali per capitolo | Nessuno |
| Testi delle email | Modelli iniziali |
| Email riassuntiva giornaliera delle bozze da approvare | Attiva |
| Segnalazione delle richieste senza sostenitori | 30 giorni |
| Richieste sostenute mostrate nella vetrina | 30 giorni |
| Promemoria e decadenza dell’impegno con bonifico | 7 e 30 giorni |
| Scadenza del credito solidale | 1 mese |
| Bambini senza aggiornamenti in “Cose da fare” | 6 mesi |
| Scadenza della chiusura annuale | 15 febbraio |
| Durata dell’accesso ospite e promemoria (FR-REG-05) | 7 giorni, promemoria al 5° |
| Promemoria dell’importazione dell’estratto conto | Entro il giorno 10 del mese |
| Scadenza della presa in carico in “Cose da fare” | 30 giorni |
| Inattività dell’accesso (fase 2) | 12 mesi |

### Codici, foto e comunicazioni

**FR-COD-01 · Codici identificativi** (AMM-01, AMM-02, AMM-09). I codici li genera sempre il gestionale, progressivi e mai riutilizzati: **BAM-0215** per un bambino (alla conferma della scheda), **FAM-0045** per una famiglia, **RIC-0042** per una richiesta personale (all’approvazione). Le voci fisse non hanno codice. I codici compaiono nella causale standard, nella scheda vista dal sostenitore e nelle schermate di amministratori e volontari; non contengono dati personali. La referente non deve usarli: continua a scrivere i nomi. **Motivazione:** oggi non esiste un codice dei bambini, e il nome da solo non distingue i molti bambini con lo stesso nome.

**FR-FOTO-01 · Visibilità delle foto** (VOL-02, VOL-04, SOS-07). Ogni foto ha uno di due livelli: **pubblica** (social e vetrina) oppure **riservata al padrino** (solo nella scheda, visibile al padrino dopo l’adozione e all’amministratore). Le foto scelte per i social sono pubbliche, le altre dello stesso invio riservate. L’amministratore può nascondere o eliminare qualsiasi foto. Il consenso della famiglia vale per entrambi i livelli (FR-CON-01).

**FR-COM-02 · Comparire nei post social** (SOS-01, SOS-09). Il sostenitore sceglie se il suo nome può comparire nei post dell’associazione: casella facoltativa e non preselezionata alla registrazione, modificabile nel profilo. Se ha acconsentito, il gestionale dà al bot nome, iniziale del cognome e provincia (“Maria R. di Treviso”) per i post di un aiuto consegnato; altrimenti il post non lo nomina.

### Bot social

Il bot social resta un sistema separato, proprietario dei contenuti social; il gestionale è proprietario dei dati e detta le regole. I due sistemi si parlano solo tramite API, con un token del bot (capitolo 11.5). Le modifiche richieste al codice del bot sono parte della fase 1.

**FR-BOT-01 · Tipi di contenuto** (VOL-04). Dopo il caricamento il bot chiede prima il tipo e poi la categoria: 🆘 **Richiesta di aiuto** (richiesta personale in bozza, oppure rimando a una voce fissa), ✅ **Aiuto consegnato** (prove di rendicontazione o aggiornamento della scheda), 📣 **Solo social** (nessun effetto sul gestionale; solo le categorie generiche: vari, volontariato digitale, grazie ai volontari).

**FR-BOT-02 · Riconoscimento dei volontari** (VOL-04). Ogni volontario collega il proprio account Telegram al profilo nel gestionale con un codice usa e getta valido 10 minuti (“Collega Telegram” nel profilo, `/collega` nel bot). A ogni azione il bot invia al gestionale l’identificativo Telegram e riceve i permessi; mostra solo le opzioni consentite. Un account non collegato o disattivato non può fare nulla. Sostituisce la chat autorizzata unica di oggi.

**FR-BOT-03 · Categorie dal gestionale** (VOL-04). Il bot legge dal gestionale la lista delle categorie e il loro prezzo ogni volta che il volontario sceglie una categoria: una categoria aggiunta dall’amministratore compare subito. Restano nel bot le regole per i testi, le parole chiave dei commenti e i link, che sono contenuti social.

**FR-BOT-04 · Foto, testi e ordine** (VOL-02, VOL-04). Le risposte date al bot valgono per tutto l’invio. Il volontario carica tutte le foto; un testo della referente resta legato a una foto se arriva come didascalia o con “Rispondi” sulla foto. Poi il bot mostra un foglio provini, cioè un’unica immagine con le anteprime numerate delle foto (segnate quelle con un testo agganciato), e il volontario tocca le foto per i social nell’ordine della storia, con “Annulla ultima” per correggere; se non ne sceglie nessuna, il bot non pubblica nulla e le foto vanno solo al gestionale. Claude scrive carosello, Storie e un testo per la vetrina seguendo quell’ordine e i testi agganciati. Se l’invio contiene un testo per la scheda, il bot chiede “Contiene informazioni sulla salute?”: con “Sì” il testo va nel campo sanitario, visibile solo all’amministratore, e non esce sui social. Al gestionale arrivano tutte le foto originali, con livello di visibilità, testi e ordine.

**FR-BOT-05 · Aggancio al beneficiario** (AMM-01, VOL-01, VOL-02). Il bot propone il nome del bambino (o del genitore, per una famiglia) letto dal messaggio della referente e chiede al gestionale i candidati, filtrati secondo il tipo di invio: per ✅ Aiuto consegnato solo i bambini o le famiglie con un intervento pagato e prove mancanti; per 🆘 Richiesta di aiuto solo i bambini senza sostenitore e senza una richiesta aperta; per un aggiornamento solo i bambini con un’adozione attiva. Se resta un solo candidato il bot chiede solo la conferma; altrimenti li mostra con codice, età, villaggio e foto profilo e il volontario tocca quello giusto. “Cerca fra tutti” allarga la ricerca; “Nessuno: è nuovo” propone un bambino nuovo, confermato dall’amministratore. Se nel messaggio c’è un codice, il bot chiede solo la conferma. Nessun abbinamento avviene senza la conferma di una persona. Il gestionale dà al bot solo i dati che un volontario può già vedere. **Motivazione:** molti bambini hanno lo stesso nome; cercare solo fra quelli che hanno senso in quel momento riduce errori e tocchi.

**FR-BOT-06 · Consegna al gestionale ed errori** (VOL-04). Prima di pubblicare il bot chiede al gestionale il consenso (FR-CON-01). Dopo la pubblicazione consegna il pacchetto; se il gestionale non risponde lo mette in coda, ritenta ogni 10 minuti e avvisa il volontario quando è arrivato. Un invio rifiutato viene spiegato al volontario e segnalato all’amministratore; un invio ripetuto non crea doppioni.

**FR-BOT-07 · Dati personali e ringraziamenti** (FR-COM-02, FR-RING-01). Il bot non raccoglie più dati personali dei sostenitori (nome, provincia, email del padrino) e non invia più ringraziamenti: li manda il gestionale. Il nome del padrino per un post arriva dal gestionale, solo con il suo consenso. I dati già presenti nel bot entrano nel gestionale come indizi per l’abbinamento (FR-STO-01) e poi vengono cancellati dal bot.

**FR-BOT-08 · Report e riepilogo mensile.** I report `/report-mese` e `/report-anno` restano nel bot come report dell’attività social. Il riepilogo mensile pubblicato su Instagram prende i numeri dal gestionale (interventi realizzati e rendicontati nel mese, per categoria).

### Recupero dei dati esistenti

**FR-STO-01 · Importazione iniziale e censimento progressivo** (AMM-09; fase 1). Prima dell’avvio si importano da VERIF!CO le anagrafiche e i movimenti **dal 2025** (il 2024 usa un piano dei conti diverso). È padrino storico chi ha almeno un versamento di 180 € o multipli nel conto delle adozioni scolastiche: le adozioni non si pagano a rate, e gli importi minori sono altre donazioni; un multiplo (es. 360 €) indica forse più bambini, da confermare. I padrini entrano con anagrafica e storico delle donazioni, come “padrini storici” senza account; gli IBAN si imparano dai bonifici successivi, perché VERIF!CO non li conserva. I nomi brevi nel campo Note delle anagrafiche (oggi 248) e quelli nelle storie del bot diventano indizi, non bambini. Il padrino storico non ancora abbinato vede nella sua area “Stiamo ritrovando il tuo bambino” (SOS-07). I bambini entrano poco alla volta, dalle foto di ogni giorno e dagli elenchi per villaggio compilati dalla referente; l’amministratore abbina padrini e bambini con la conferma della referente, usando le liste “padrini senza bambino” e “bambini senza padrino”. Finché l’abbinamento non è confermato, l’adozione resta “storica, bambino da identificare” e il padrino non riceve foto. L’avvio è graduale: si parte con un primo gruppo di famiglie, un villaggio o 30–50 famiglie, con i moduli di consenso già raccolti. Durante il passaggio il gruppo WhatsApp dei sostenitori resta attivo.

### Fase 2

**FR-SOC-01 · Quota associativa** (SOC-01). La quota associativa si paga come una donazione (carta o bonifico con quietanza) ma è registrata come quota associativa, non come erogazione liberale: non compare nel riepilogo per la detrazione e nel file per VERIF!CO ha la sua causale. Avviso prima della scadenza e promemoria nei tre mesi successivi. Il trattamento contabile va verificato con il commercialista (Appendice B).

**FR-STO-02/03 · Inviti ai padrini storici e ritorno verso VERIF!CO.** Inviti personali monouso via email o WhatsApp ai padrini storici per registrarsi, collegarsi al proprio storico (FR-REG-03) e completare dati e consensi; ritorno delle anagrafiche complete verso VERIF!CO.

**FR-INF-01 · Spazio informativo.** L’area riservata raccoglie i collegamenti ai contenuti pubblicati sul sito dell’associazione (newsletter, informative, volantini, eventi, 5×1000) e mostra i contenuti personali; il gestionale non duplica il sistema di pubblicazione del sito.

## 5.7 Schede informative

Le schede descrivono **quali informazioni** servono e chi le vede, non come sono salvate (il modello dei dati è nel capitolo 12). Si raccoglie solo il minimo necessario (minimizzazione GDPR). Nella colonna **Visibile a**: A = amministratore, V = volontario, S = il sostenitore interessato; la visibilità dei dati non sensibili per V e S è configurabile (FR-RUO-04).

### Scheda sostenitore

| Campo | Perché serve | Chi lo inserisce | Obbl. | Visibile a / note privacy |
| --- | --- | --- | --- | --- |
| **Identità** |   |   |   |   |
| Tipo (persona / ente o azienda) | Certificazioni e contabilità cambiano | Sostenitore | Sì | A, S |
| Nome e cognome / ragione sociale | Identificazione | Sostenitore | Sì | A, S; V solo se abilitato |
| Codice fiscale / partita IVA | Certificazione per la detrazione, allineamento con VERIF!CO | Sostenitore | No: chiesto alla prima donazione; senza, niente certificazione (FR-FIS-01) | Dato fiscale: A, S |
| **Contatti** |   |   |   |   |
| Email | Accesso all’area riservata, comunicazioni | Sostenitore | Sì | A, S |
| Telefono / WhatsApp | Contatto diretto | Sostenitore | No | A, S |
| Provincia (e indirizzo, se il sostenitore vuole) | Nome nei post social (“Maria R. di Treviso”, FR-COM-02); l’indirizzo non serve alla certificazione | Sostenitore | No | A, S |
| **Rapporto con Effatà** |   |   |   |   |
| Ruoli (ospite, simpatizzante, sostenitore, socio, volontario) | Una persona può averne più di uno (FR-REG-04) | Sistema / amministratore | Sì | A, S |
| Data di registrazione e origine del dato | Autoregistrato, importato da VERIF!CO o inserito dall’amministratore | Sistema | Sì | A |
| Quota associativa (se socio, fase 2) | Anno e stato del pagamento (FR-SOC-01) | Sistema | — | A, S |
| Come ci ha conosciuto | Utile all’associazione | Sostenitore | No | A |
| **Dati per l’abbinamento dei bonifici** |   |   |   |   |
| IBAN da cui dona (uno o più) | Abbinamento automatico dei bonifici; campo IBAN_MITTENTE di VERIF!CO | Sistema (appreso all’abbinamento) o sostenitore | No | Dato bancario: A, S |
| ID anagrafica in VERIF!CO | Collegamento fra i due gestionali | Amministratore | No | A |
| **Detrazione e consensi** |   |   |   |   |
| Avente diritto alla detrazione (nome, cognome, CF), se diverso | Certificazione; causale standard (FR-FIS-01) | Sostenitore | Solo se diverso | Dato fiscale: A, S |
| Opposizione all’invio dei dati all’Agenzia delle Entrate | Scelta del donante (FR-FIS-01) | Sostenitore | No | A, S |
| Presa visione dell’informativa privacy (data, versione) | Obbligo GDPR, prova dell’informazione data | Sostenitore | Sì | A, S |
| Preferenze di comunicazione e newsletter | Consensi facoltativi, separati dall’informativa (FR-COM-01) | Sostenitore | No | A, S |
| Consenso a comparire nei post social | Il bot riceve nome, iniziale del cognome e provincia solo con questo consenso (FR-COM-02) | Sostenitore | No | A, S |
| Indizi dal recupero (nome del bambino nelle note di VERIF!CO o nel bot) | Abbinamento padrino–bambino (AMM-09) | Sistema | — | A |
| **Collegamenti** |   |   |   |   |
| Adozioni e interventi sostenuti | Rendicontazione (SOS-07) | Sistema | — | S vede solo i propri |
| Storico donazioni e crediti solidali | SOS-06, SOS-08 | Sistema | — | S vede solo i propri |

### Scheda bambino

| Campo | Perché serve | Chi lo inserisce | Obbl. | Visibile a / note privacy |
| --- | --- | --- | --- | --- |
| **Identità** |   |   |   |   |
| Codice (es. BAM-0102) | Identificativo generato dal gestionale (FR-COD-01) | Sistema | Sì | A, V, S |
| Nome | Riconoscibilità per il sostenitore | Amministratore | Sì | A, V, S |
| Cognome | Identificazione certa nell’archivio | Amministratore | No | A; V se abilitato; **mai S** |
| Data di nascita | Età, adozioni scolastiche, controllo dei doppioni | Amministratore | Sì | A; S vede solo l’età e, con il consenso, giorno e mese del compleanno (FR-ADO-05) |
| Famiglia | Collegamento alla scheda famiglia e al consenso | Amministratore | Sì | A, V |
| Villaggio | Rendicontazione per zona | Amministratore | Sì | A, V; S vede solo il distretto, **mai il luogo esatto** |
| **Contesto** |   |   |   |   |
| Scuola e classe | Pagelle, progressi | Amministratore / volontario | No | A, V, S |
| Storia | Richiesta di sostegno e rendicontazione | Amministratore / volontario | No | A, V, S (completa o riassunto, FR-RUO-04) |
| **Storico** |   |   |   |   |
| Foto, pagelle, notizie, con i testi della referente | Contenuti per il sostenitore (VOL-02) | Volontario (dal bot o dal gestionale) | — | Pubbliche o riservate al padrino (FR-FOTO-01); S vede solo i bambini che sostiene; foto solo con consenso (FR-CON-01) |
| Adozioni (attiva e chiuse) | Riaffido e storico (FR-ADO-01/02/03) | Amministratore | — | A; S vede solo la propria |
| Stato (attivo, uscito dal programma, con data e motivo) | Fine del percorso (AMM-02) | Amministratore | Sì | A, V |
| Informazioni sanitarie (solo se indispensabili) | Operazioni chirurgiche | Amministratore | No | **Dato sanitario (art. 9 GDPR): solo A**, campo separato dalle notizie |

### Scheda famiglia

Una famiglia ha uno o più bambini, ciascuno adottato dal proprio sostenitore. Gli altri interventi (animali, materassi, casette…) vanno di solito alla famiglia, ognuno con il proprio sostenitore. Chi sostiene un intervento per la famiglia non vede i bambini adottati da altri, e chi adotta un bambino non vede gli altri interventi ricevuti dalla famiglia (FR-VIS-01).

| Campo | Perché serve | Chi lo inserisce | Obbl. | Visibile a / note privacy |
| --- | --- | --- | --- | --- |
| Codice famiglia (es. FAM-0045) | Identificativo generato dal gestionale (FR-COD-01) | Sistema | Sì | A, V |
| Genitore o tutore di riferimento | Firma il modulo di consenso (per la casa famiglia: la referente) | Amministratore | Sì | A; dato personale di terzi |
| Villaggio / distretto | Rendicontazione per zona | Amministratore | Sì | A, V; S solo il distretto |
| Componenti (bambini) | Collegamento alle schede bambino | Sistema | — | Ogni sostenitore vede solo i propri beneficiari |
| Modulo di consenso caricato (sì/no, data, raccolto da) | Applicazione automatica del consenso (FR-CON-01) | Amministratore | — | A; V e S vedono solo gli effetti |
| Foto o scansione del modulo firmato | Prova del consenso | Amministratore | — | **Dato sensibile: solo A** |
| Interventi ricevuti | Storico degli aiuti alla famiglia | Sistema | — | A; S vede solo quelli che ha sostenuto |

### Scheda intervento

L’intervento collega donazioni e beneficiari: “adozione scolastica di BAM-0102 per l’anno 2026”, “casa per la famiglia FAM-0045”, “consegna di materassi alla famiglia FAM-0112”. Nasce da una richiesta personale quando arriva il pagamento, oppure dalla consegna di una voce fissa (FR-INT-08).

| Campo | Perché serve | Chi lo inserisce | Obbl. | Visibile a / note privacy |
| --- | --- | --- | --- | --- |
| Tipo di intervento | Adozione scolastica, adozione in casa famiglia, casetta, affitto terreno, animali, materassi, scarpe, carrozzina, operazione… | Amministratore | Sì | A, V, S |
| Anno scolastico (solo adozioni) | Un intervento per ogni anno pagato (FR-ADO-06) | Sistema | Per le adozioni | A, V, S |
| Beneficiario | Bambino, famiglia o comunità | Amministratore | Sì | A, V, S (con le regole della scheda bambino) |
| Finanziatori e quote | Chi lo finanzia (FR-INT-01) | Sistema | Sì | A; S vede solo la propria quota |
| Costo dichiarato e raccolto | Sapere se è coperto; costo congelato al primo pagamento (FR-INT-04) | Amministratore | Sì | A, S; V senza importi |
| Capitolo e ID_PROGETTO di VERIF!CO | Imputazione contabile (FR-INT-02) | Amministratore | Sì | A |
| Prove di realizzazione (checklist) | Rendicontazione (FR-INT-03) | Volontario | — | A, V; S se lo ha sostenuto, foto con consenso |
| Stato e date (pagato, in corso, realizzato, rendicontato) | Comunicazione al sostenitore | Sistema / volontario | Sì | A, V, S |
| Presa in carico | Chi se ne sta occupando (VOL-03) | Volontario | No | A, V |

# 6. Requisiti non funzionali

## 6.1 Requisiti con soglia

Ogni requisito ha una soglia misurabile, la condizione in cui vale, il modo in cui si verifica e le storie a cui si collega. Le soglie partono dai numeri del capitolo 3.1: circa 1.000 donatori e 760 email, con il picco dopo l’invio della newsletter (circa il 5% dei destinatari nello stesso minuto, cioè 50 persone). I requisiti trasversali della traccia sono NFR-06, NFR-12, NFR-13b, NFR-14 e NFR-15.

| ID | Famiglia | Requisito | Soglia e condizione | Come si verifica | Storie |
| --- | --- | --- | --- | --- | --- |
| NFR-01 | Prestazioni | Velocità della vetrina e dell’area sostenitore | Meno di 2 s per il 95% delle pagine, con 50 utenti nello stesso minuto | Test di carico | SOS-03, SOS-07 |
| NFR-02 | Prestazioni | Importazione dell’estratto conto | Un mese di movimenti (fino a 300 righe) importato in meno di 30 s | Test con un file di prova | AMM-04 |
| NFR-03 | Disponibilità | Disponibilità del servizio | 99% al mese (al massimo circa 7 ore di fermo); manutenzione di notte, annunciata | Monitoraggio esterno con avviso via email all’amministratore e allo sviluppatore | Tutte |
| NFR-04 | Disponibilità | Backup e ripristino | Database ogni notte, copie conservate 30 giorni, una copia fuori dal server; foto ogni settimana. Al massimo un giorno di dati perso; ripristino entro 4 ore | Prova di ripristino completa prima del collaudo, poi una volta l’anno | Tutte |
| NFR-05 | Scalabilità | Crescita di sostenitori, bambini e foto | Il sistema regge il triplo dei numeri attuali (3.000 sostenitori, 4.000 bambini, 50.000 foto) senza cambiare architettura; le foto sono ridotte e hanno una miniatura | Test con dati generati | AMM-02, VOL-01, VOL-02 |
| NFR-06 | Sicurezza | Tutto il traffico su HTTPS (trasversale) | Nessuna pagina né API raggiungibile in chiaro: http rediretto su https; certificato rinnovato in automatico | Test SSL Labs con voto A | Tutte |
| NFR-07 | Sicurezza | Controllo di ruoli e proprietà nel backend | Ogni endpoint controlla ruolo e proprietà del dato, anche per le richieste del bot; ogni endpoint protetto ha un test che verifica il diniego (403) | Test automatici nel CI | Tutte, FR-VIS-01, FR-RUO-01 |
| NFR-08 | Conformità | GDPR e dati di minori | Foto dei minori mai pubbliche: servite con link firmati che scadono dopo 10 minuti; dati sensibili solo all’amministratore, con registro degli accessi (chi, quando, cosa); dati su server nell’Unione europea | Revisione del codice e test | AMM-02, VOL-02, SOS-07, FR-CON-01, FR-RUO-02 |
| NFR-09 | Conformità | Conservazione dei dati | Donazioni e dati fiscali: 10 anni. Storico e foto dei bambini usciti dal programma: 10 anni, poi anonimizzati. Email degli ospiti mai registrati: cancellata dopo 6 mesi. Log tecnici: 12 mesi | Procedura automatica di pulizia, con test | SOS-09, AMM-02, FR-REG-05 |
| NFR-10 | Usabilità | Accessibilità per i sostenitori meno pratici | Pagine dei sostenitori conformi a WCAG 2.1 livello AA, testo di almeno 16 px; dal carrello al pagamento al massimo 4 passaggi | Controllo automatico dell’accessibilità; durante il collaudo 3 sostenitori sopra i 60 anni, scelti con l’associazione, completano da soli una donazione di prova | SOS-01, SOS-03, SOS-04 |
| NFR-11 | Ambientale | Rete lenta | Prima pagina caricata in meno di 3 s su un telefono con rete 3G simulata; vale anche per il futuro accesso dall’Uganda | Test con rete simulata | SOS-03, SOS-07 |
| NFR-12 | Supporto | Documentazione delle API (trasversale) | Tutti gli endpoint documentati in OpenAPI, generata dal codice; collezione Postman per le chiamate principali | Controllo automatico nel CI | Tutte |
| NFR-13 | Interazione | Lingua: solo italiano in questa versione; testi in file di traduzione separati per aggiungere l’inglese con l’accesso dall’Uganda | Nessun testo dell’interfaccia scritto nel codice | Revisione del codice | Tutte |
| NFR-13b | Interazione | Errori in formato uniforme (trasversale) | Tutti gli errori con lo stesso formato (codice, messaggio, campi non validi), secondo lo standard RFC 7807 | Test sugli endpoint | Tutte |
| NFR-14 | Interazione | Elenchi paginati (trasversale) | Tutti gli elenchi paginati: 20 righe se non indicato, al massimo 100 | Test sugli endpoint | AMM-07, VOL-03, SOS-08 |
| NFR-15 | Supporto | Ambienti Development e Production senza segreti nel codice (trasversale) | Ambienti separati, con dati di prova in Development; segreti solo in variabili d’ambiente, con il file `.env.example`; scansione dei segreti a ogni commit | Scansione automatica nel CI | Tutte |
| NFR-16 | Supporto | Passaggio di consegne: il sistema può essere affidato a un altro sviluppatore | Seguendo solo il README, un nuovo sviluppatore avvia il progetto in locale ed esegue i test in mezza giornata; tutti gli account di servizio (hosting, dominio, email, pagamenti, repository) sono intestati all’associazione | Prova con uno sviluppatore esterno; verifica degli intestatari degli account | Tutte |
| NFR-17 | Affidabilità | Affidabilità dei dati economici: un numero mostrato è sempre verificabile, altrimenti compare un’anomalia | Differenza zero fra donazioni confermate del mese, imputazioni e totali dei file per VERIF!CO; nessuna donazione cancellata (solo annullata con motivo); ogni modifica di un dato economico registrata con chi e quando | Test automatici di quadratura su dati di prova; collaudo su un mese di dati reali anonimizzati confrontato con VERIF!CO | AMM-04, AMM-05, AMM-06, AMM-07 |
| NFR-18 | Prestazioni | Tempestività: le donazioni sono visibili all’associazione appena dichiarate, senza aspettare l’estratto conto | Donazione con carta nella vista d’insieme entro 1 minuto dalla conferma del fornitore; donazione con bonifico visibile come “dichiarata” subito dopo il caricamento della quietanza | Test end-to-end con il fornitore in modalità di prova | SOS-04, SOS-05, AMM-07 |
| NFR-19 | Usabilità | Caricamento di più foto insieme, anche dal telefono | Fino a 20 foto in una sola selezione, con avanzamento visibile; un file non riuscito si ricarica da solo, senza ripetere gli altri | Prova d’uso con un volontario reale | VOL-01, VOL-02 |
| NFR-20 | Interazione | Risposte del gestionale al bot | Meno di 1 s per il 95% delle richieste del bot (candidati, consenso, voci della checklist), perché il volontario aspetta nella chat | Test di carico sulle API del bot | VOL-01, VOL-02, VOL-04, FR-BOT-05 |

## 6.2 Requisiti impliciti

I requisiti impliciti sono ciò che un utente dà per scontato e quindi non dice. Sono stati raccolti con una sola domanda: “Cosa daresti per scontato che un’app di questo tipo faccia sempre, o non faccia mai?”

Prime interviste: 01/10/2026, rivolte a membri dell’associazione (ruoli da indicare, Appendice B). L’intervista a un sostenitore è ancora da fare.

| Chi avete intervistato | Cosa ha detto | Requisito che ne avete ricavato |
| --- | --- | --- |
| Intervista 1 – associazione | “Un buon gestionale deve essere sempre in grado di fornirti il dato che ti serve, rispetto al previsionale: un quadro aggiornato, e anche il trend.” | FR-DASH-02 (obiettivi per capitolo, andamento mese per mese e confronto con l’anno precedente); AMM-07 |
| Intervista 2 – associazione | “L’errore che proprio non vorrei mai vedere è che non sia attendibile: che si crei un bug logico o statistico.” | NFR-17; AMM-06 AC-05 (esportazione bloccata se i totali non tornano); AMM-07 AC-04 (anomalia al posto di un totale sbagliato) |
| Intervista 3 – associazione | “Raccogliere i dati necessari dai vari canali, usufruibili nel più breve tempo possibile. Esempio: una signora offre per il calendario solidale, ma noi non vediamo niente.” | NFR-18; FR-CAN-01 (campagne e iniziative imputate alla raccolta fondi); donazioni visibili come “dichiarate” prima dell’estratto conto (FR-DON-01) |
| Intervista 4 – associazione | “Filtrare le informazioni: anagrafiche donatori, anagrafica fornitori, entrate e uscite, storicità, report, scadenze.” | FR-REP-01 (filtri, esportazione in Excel, sezione Scadenze); FR-REP-02 (ricerca); storico mai cancellato (AMM-02, FR-DON-02); fornitori e uscite restano in VERIF!CO (cap. 1.3) |
| Sostenitore | *da intervistare* |   |

# 7. Assunzioni, vincoli e dipendenze

Le **assunzioni** sono ciò che diamo per vero senza poterlo garantire; i **vincoli** sono i limiti che non possiamo cambiare; le **dipendenze** sono le cose esterne senza cui il lavoro non può andare avanti.

## 7.1 Assunzioni

| ID | Assunzione | Cosa succede se è falsa |
| --- | --- | --- |
| ASS-01 | L’associazione ha circa 700 padrini, oltre 1.000 donatori e ~1.200 bambini adottati (cap. 3.1) | Il dimensionamento va rifatto |
| ASS-02 | L’estratto conto UniCredit contiene data, importo, causale completa e nome o IBAN dell’ordinante | Quasi tutti gli abbinamenti diventano manuali |
| ASS-03 | La referente continua a mandare foto e testi nel gruppo WhatsApp, e almeno un volontario li carica nel bot ogni giorno | Le prove arrivano in ritardo e la rendicontazione rallenta |
| ASS-04 | La maggior parte dei sostenitori ha un’email valida (oggi il 71% delle anagrafiche) | Chi non ha email non accede all’area riservata: resta padrino storico, contattato tramite la referente |
| ASS-05 | Il costo dichiarato di un intervento corrisponde alla spesa effettiva (FR-INT-04) | La rendicontazione economica va rivista |
| ASS-06 | La referente può compilare dal telefono gli elenchi dei bambini per villaggio e confermare gli abbinamenti con i padrini (AMM-09) | Il recupero delle adozioni storiche rallenta; restano più adozioni “da identificare” |
| ASS-07 | I volontari hanno un account Telegram personale da collegare al gestionale (FR-BOT-02) | Serve un’alternativa: il caricamento dalle schermate del gestionale |
| ASS-08 | In VERIF!CO ogni anagrafica ha un’email propria, uguale a quella usata nei pagamenti con carta (FR-VER-01) | Il tracciato Stripe collega il pagamento alla persona sbagliata o crea anagrafiche nuove: serve un controllo prima del caricamento |
| ASS-09 | Stripe resta l’unico fornitore per carta e Satispay, sia per il gestionale sia per il calendario solidale | Le quadrature dei versamenti vanno riprogettate |

## 7.2 Vincoli

| ID | Vincolo | Da dove viene |
| --- | --- | --- |
| VIN-01 | Budget limitato di un’ODV: costi nuovi di hosting e servizi entro 30 € al mese | Associazione |
| VIN-02 | Trattamento di dati di minori e dati fiscali | GDPR |
| VIN-03 | Formato di importazione imposto da Verifico.it | Verifico.it |
| VIN-04 | Sviluppatore singolo e tempi del corso ITS | Progetto didattico |
| VIN-05 | Requisiti trasversali della traccia (HTTPS, OpenAPI, Postman, Dev/Prod, deploy pubblico) | Traccia del progetto |
| VIN-06 | Il bot social resta un sistema separato, con il proprio database: parla con il gestionale solo tramite API | Scelta di progetto (FR-BOT) |
| VIN-07 | Hosting sul server Hostinger dell’associazione, lo stesso del bot e del calendario solidale, con un sottodominio di effataitalia.it | Associazione |

## 7.3 Dipendenze

| ID | Dipendenza | Serve entro | Chi se ne occupa |
| --- | --- | --- | --- |
| DIP-01 | Un estratto conto reale anonimizzato (nomi e IBAN sostituiti con dati inventati), anche di un solo mese | Inizio dello sviluppo dell’importazione | Andrea Pavan |
| DIP-02 | Tracciati di importazione di VERIF!CO | Disponibili dal 01/10/2026 (master e Stripe); manca quello delle anagrafiche (DIP-12) | Andrea Pavan |
| DIP-03 | Token del bot dedicato al collegamento con il gestionale, diverso da quello attuale | Prima del collaudo della fase 1 | Andrea Pavan |
| DIP-04 | Account Anthropic intestato all’associazione, con chiavi separate per Development e Production | Inizio dello sviluppo delle modifiche al bot | Presidente / Andrea Pavan |
| DIP-05 | Account Brevo (già usato come relay SMTP da VERIF!CO): chiave dedicata per le email del gestionale; verificare i limiti del piano | Prima del collaudo | Andrea Pavan |
| DIP-06 | Sottodominio di effataitalia.it per il gestionale (es. gestionale.effataitalia.it) sul server Hostinger | Primo deploy | Andrea Pavan |
| DIP-07 | Consenso dell’associazione a usare dati e foto reali nel collaudo | Prima del collaudo della fase 1 | Presidente |
| DIP-08 | Modifiche al bot social per il collegamento con il gestionale (FR-BOT-01…08) | Prima del collaudo della fase 1 | Andrea Pavan |
| DIP-09 | API di Meta (Facebook, Instagram) per la pubblicazione | Fase 2 | Andrea Pavan |
| DIP-10 | API di Anthropic (Claude) per i testi social | Già in uso nel bot | Andrea Pavan |
| DIP-11 | Google Perspective e OpenAI Moderation (solo nel bot, per i commenti) | Nessuna azione per il gestionale | — |
| DIP-12 | Risposta dell’assistenza VERIF!CO: esportazione in blocco dei PDF delle ricevute? API disponibili? | Prima della fase 2 | Andrea Pavan |
| DIP-13 | Account del fornitore di pagamenti (Stripe) intestato all’associazione, con modalità di prova per il collaudo | Prima del collaudo della fase 1 | Presidente / Andrea Pavan |
| DIP-14 | Modulo di consenso della famiglia aggiornato (unico, con nome del genitore, villaggio e data) e verificato dal referente privacy dell’associazione | Prima del collaudo della fase 1 | Presidente / referente in Uganda |
| DIP-15 | Progetti di VERIF!CO corrispondenti ai quattro conti (Adozioni scolastiche, Casa struttura, Aiuto famiglie in difficoltà, Cure ospedaliere) e conferma dell’assistenza che il progetto porti il movimento sul conto giusto (FR-INT-02) | Prima del collaudo della fase 1 | Amministratore |
| DIP-16 | Esportazione da VERIF!CO delle anagrafiche dei padrini e delle donazioni, per l’importazione iniziale (AMM-09) | Prima del collaudo della fase 1 | Amministratore |
| DIP-17 | Elenchi dei bambini del primo villaggio compilati dalla referente, con i moduli di consenso delle famiglie | Prima del collaudo della fase 1 | Referente in Uganda |
| DIP-18 | Accesso del gestionale alle donazioni del calendario solidale tramite token (modifica al sito del calendario) | Prima del collaudo della fase 1 | Andrea Pavan |
| DIP-19 | Conto finanziario STRIPE in VERIF!CO, per registrare i pagamenti con carta alla data del pagamento e i versamenti come giroconto (FR-VER-02) | Prima del caricamento delle donazioni Stripe del 2026 | Amministratore |
| DIP-20 | Parere del commercialista sulle donazioni del calendario (erogazione liberale o raccolta fondi) e sullo schema di registrazione di Stripe | Prima del caricamento delle donazioni Stripe del 2026 | Amministratore |

# Seconda parte · Il come

*Come costruirai il Gestionale Effatà. Qui parli al docente, non al presidente dell’associazione.*

> **🧭 Dal template**
>
> - Ogni scelta tecnica va motivata e confrontata con almeno un’alternativa. “Lo conosciamo” è una motivazione valida, ma non può essere l’unica.

# 8. Stima del carico

Tutti i numeri discendono dal capitolo 3.1: circa 1.000 donatori, 760 email, 2 amministratori, circa 12 volontari; i sostenitori entrano 1–2 volte al mese, soprattutto la sera e dopo la newsletter.

## 8.1 Utenti concorrenti

| Situazione | Utenti concorrenti | Da dove viene il numero |
| --- | --- | --- |
| Sera normale | 5–10 | Circa 1.000 donatori × 1–2 accessi al mese ≈ 70 visite al giorno, concentrate fra le 19 e le 23; più 1–2 amministratori e 1–3 volontari |
| Prima ora dopo la newsletter (picco) | 50 nello stesso minuto | 760 destinatari; apre circa il 40% (300 persone), metà nella prima ora, un terzo di queste nei primi 10 minuti |
| Gennaio–febbraio (riepilogo annuale, chiusura dell’anno) e campagna di Natale | Come il picco, per più giorni | Stesse persone, motivo diverso; in più l’amministratore lavora alla chiusura annuale |
| Margine di progetto | 100 | Il doppio del picco: è il carico con cui si prova NFR-01 |

## 8.2 Profilo di carico

| Operazione | Frequente? | Pesante? | Critica? | Note |
| --- | --- | --- | --- | --- |
| Vetrina e area sostenitore | Sì, nel picco | No | Sì | Soglia NFR-01; letture paginate (NFR-14) |
| Visualizzazione foto | Sì | Media | Sì, per la privacy | Miniature e link firmati a scadenza (NFR-08) |
| Invii dal bot (circa 20 foto la sera, ridotte e con miniatura) | Ogni giorno | Sì | Media | Elaborazione in background: il bot riceve subito la conferma (NFR-20) |
| Conferme di pagamento da Stripe | A ogni donazione | No | Sì | Registrate una sola volta anche se arrivano due volte (NFR-18) |
| Importazione dell’estratto conto | Una volta al mese | Media | Sì | Fino a 300 righe in meno di 30 s (NFR-02, NFR-17) |
| File per VERIF!CO | Una volta al mese | No | Sì | Bloccati se i totali non tornano (NFR-17) |
| Importazione del calendario solidale | Una volta al giorno | No | Media | Di notte, fuori dagli orari di uso |
| Riepilogo annuale in PDF | Gennaio–febbraio | Media | No | Generato in background e conservato |
| Vista d’insieme dell’amministratore | Ogni giorno | Media | No | Totali calcolati con query aggregate (cap. 12.5) |

Le operazioni pesanti (foto e PDF) girano in background, così chi carica non aspetta e le pagine dei sostenitori non rallentano nel picco.

## 8.3 Stima dello storage

| Voce | Calcolo | Ogni anno | In 5 anni |
| --- | --- | --- | --- |
| Foto | 20 al giorno × circa 0,5 MB dopo la riduzione (lato lungo 2.000 px), più la miniatura | circa 4 GB | circa 20 GB |
| Documenti | Quietanze, moduli di consenso, riepiloghi PDF | circa 0,5 GB | circa 2,5 GB |
| Database | Anagrafiche, donazioni, interventi, registri | meno di 1 GB | circa 3 GB |
| **Totale** | | **circa 5 GB** | **circa 25 GB** |

Il server dell’associazione (VPS Hostinger KVM 1: 1 CPU, 4 GB di RAM, 50 GB di disco) ha oggi 31 GB liberi e la memoria usata al 47% da bot e calendario. Basta per la fase 1 e i primi anni; si passa al piano superiore (KVM 2) quando disco o memoria superano stabilmente l’80%. I backup esterni (NFR-04) occupano circa lo stesso spazio, fuori dal server.

# 9. Scelte tecnologiche con alternative considerate (Scelte tecnologiche)

Una scelta per riga, con l’alternativa scartata e il criterio: competenze, costi (VIN-01), requisiti non funzionali, ecosistema.

| Area | Scelta | Alternativa considerata | Perché avete scelto così |
| --- | --- | --- | --- |
| Backend | Node.js + NestJS, in TypeScript | Express | Livelli e dependency injection già integrati (cap. 14.2); stesso linguaggio del frontend, con definizioni dei dati condivisibili |
| Accesso ai dati | Prisma | TypeORM; Knex | Migrazioni generate dallo schema e tipi TypeScript ricavati in automatico; meno codice ripetitivo |
| Frontend | Ionic + React, pubblicato come PWA | Ionic + Angular; React Native; Flutter | Un solo codice per PC e telefono (i sostenitori usano soprattutto il telefono); React è oggetto del corso parallelo; la PWA evita costi e vincoli degli store. Capacitor resta possibile per un’app sugli store in futuro |
| Database | PostgreSQL 16, uguale in sviluppo, test e produzione (con Docker) | MySQL; SQLite nei test | Transazioni e vincoli robusti; un indice unico parziale impedisce due adozioni attive per lo stesso bambino (FR-ADO-01); test sullo stesso database della produzione, senza differenze nascoste |
| Provider cloud | VPS Hostinger dell’associazione (KVM 1) | Railway (PaaS) | Già pagato, ci girano il bot e il calendario solidale; Railway costa a consumo e aggiunge un account da gestire |
| Servizi cloud | Docker Compose sulla VPS (API, frontend, database); Nginx come reverse proxy con certificati Let’s Encrypt | Database gestito; PaaS | Nessun costo aggiuntivo (VIN-01); stesso schema già usato per il bot |
| Regione | Francia, Parigi (data center Hostinger nell’Unione europea) | — | I dati restano nell’UE (NFR-08, GDPR) |
| Storage media | Disco della VPS, foto servite con link firmati a scadenza; copia notturna cifrata su uno storage esterno nell’UE (es. Backblaze B2, regione europea) | Solo disco locale; foto su un servizio S3 | La copia fuori dal server è richiesta da NFR-04; costa pochi centesimi al mese per 25 GB |
| Elaborazione immagini | sharp | ImageMagick | Veloce, già usata nel bot |
| Servizio esterno: provider AI e modello | Anthropic Claude, solo nel bot: Claude Sonnet 5.5 per i testi social (oggi Sonnet 4.6, aggiornato con le modifiche al bot); Claude Haiku 4.5 per leggere il nome del beneficiario e proporre la voce della checklist. Nel gestionale nessuna chiamata AI in fase 1 | OpenAI; Google Gemini | Un solo fornitore, già usato; Haiku è rapido ed economico per le risposte brevi che il volontario aspetta in chat (NFR-20). La proposta di imputazione con l’AI è in fase 2 |
| Servizio esterno: email | Brevo | Gmail SMTP; SendGrid | Già usato da VERIF!CO; azienda europea; piano gratuito sufficiente per conferme e avvisi (DIP-05) |
| Servizio esterno: pagamenti | Stripe (carta, Apple Pay, Google Pay, Satispay) | PayPal (fase 2) | Modalità di prova per il collaudo; tracciato di importazione già previsto da VERIF!CO; stesso account del calendario solidale; i dati della carta restano al fornitore |
| Libreria bot Telegram | node-telegram-bot-api, nel bot | Telegraf; grammY | Già in uso nel bot; il gestionale non parla con Telegram, solo con le API del bot (VIN-06) |
| Generazione PDF | pdfmake | Puppeteer | Leggera, senza un browser sul server: con 4 GB di RAM condivisi conta |
| Autenticazione | Token di accesso brevi (15 minuti) e token di rinnovo in un cookie protetto (httpOnly); password con Argon2id; codice a tempo (TOTP) per amministratori e volontari; link magico per gli ospiti | Auth0; Keycloak | Nessun servizio esterno né costo; copre FR-SEC-01 e FR-REG-05 |
| Monitoraggio | UptimeRobot (piano gratuito) | — | Avviso via email se il servizio non risponde (NFR-03) |
| Integrazione continua | GitHub Actions: test, scansione dei segreti, generazione della specifica OpenAPI | — | NFR-07, NFR-12, NFR-15 |
| Internazionalizzazione | File di traduzione separati | Testi scritti nel codice | Deciso il 23/09: aggiungere l’inglese senza riscrivere l’interfaccia (NFR-13) |

# 10. Area 1 – Fondamenti di architettura (Architettura)

**Stato:** **DA RIVEDERE**

*Origine: unione fra la nostra bozza e il template del docente*

> **🧭 Guida – cosa chiede la traccia**
>
> - Architettura complessiva e **suddivisione in componenti**, con un diagramma.
> - **Livelli** riferiti al tuo gestionale; **dipendenze** fra livelli; come la struttura riduce l’**accoppiamento** e rende il sistema **testabile**.

## 10.1 Diagramma dei componenti

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

*Origine: unione fra la nostra bozza e il template del docente*

> **🧭 Guida – cosa chiede la traccia**
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

*Origine: unione fra la nostra bozza e il template del docente*

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

## 11.5 Contratto di integrazione con il bot (fase 1)

```text
IL BOT CHIEDE AL GESTIONALE (HTTPS, token del bot + identificativo Telegram del volontario)
  POST /api/v1/bot/collegamenti                     → collega l'account Telegram (codice usa e getta)
  GET  /api/v1/bot/volontari/{telegramId}/permessi  → cosa può fare il volontario
  GET  /api/v1/bot/categorie                        → lista delle categorie con tipo e prezzo
  GET  /api/v1/bot/beneficiari?nome=…&tipo=…        → candidati filtrati per tipo di invio (codice, nome, età, villaggio, miniatura)
  GET  /api/v1/bot/beneficiari/{codice}/consenso    → la famiglia ha il modulo di consenso?
  GET  /api/v1/bot/interventi?beneficiario=…        → interventi pagati e voci mancanti della checklist
  GET  /api/v1/bot/sostenitori-pubblicabili?intervento=… → nome del padrino, solo con il suo consenso
  GET  /api/v1/bot/riepilogo-mensile?mese=…         → numeri per il riepilogo pubblicato su Instagram

IL BOT CONSEGNA AL GESTIONALE (dopo la pubblicazione)
  POST /api/v1/bot/invii                            → foto originali, visibilità, ordine, testi agganciati,
                                                      tipo, categoria, codice, costo proposto, nota sanitaria,
                                                      voce della checklist, testo per la vetrina, autore,
                                                      identificativo dell'invio (per evitare doppioni)

TUTTO IL RESTO RESTA NEL BOT
  testi social generati, bozze, pubblicazioni, moderazione dei commenti, promozioni, report social
```

Il dettaglio dei campi, degli errori e dei codici di risposta sarà nella specifica OpenAPI. Il bot conserva in coda gli invii non riusciti e li ripete ogni 10 minuti (FR-BOT-06).

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

*Origine: unione fra la nostra bozza e il template del docente*

> **🧭 Guida – cosa chiede la traccia**
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
> - Il codice `BAM-0102` è un ID o un attributo di business? Può cambiare?

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

*Origine: unione fra la nostra bozza e il template del docente*

> **🧭 Guida – cosa chiede la traccia**
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

> **⚠ Punto delicato – da presidiare**
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

*Origine: unione fra la nostra bozza e il template del docente*

> **🧭 Guida – cosa chiede la traccia**
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

*Origine: unione fra la nostra bozza e il template del docente*

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

> **🧭 Domanda da chiarire**
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

*Origine: unione fra la nostra bozza e il template del docente*

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

*Origine: unione fra la nostra bozza e il template del docente*

> **📄 Dalla tua bozza v2.0**
>
> Settimane 1–2: analisi ER e setup DB/API · 3–4: bot Telegram e upload media · 5–6: parser AI OCR e validation layer · 7–8: frontend PWA e bridge Verifico.

> **⚠ Nota di revisione**
>
> - Otto settimane per bot, AI, PWA, pannello admin ed export sono molte per una persona sola: definisci un **MVP**.
> - L’OCR sugli estratti conto non è più previsto: la banca fornisce file CSV/Excel (cap. 1.3).
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
| Fase 1 – primo collaudo | Dashboard con ruoli, permessi e vista d’insieme; simpatizzanti, sostenitori, famiglie, bambini, adozioni e riaffido; richieste di sostegno e carrello solidale (ricerca, preferiti, condivisione); pagamento con carta e con bonifico, quietanza, credito solidale e ringraziamenti; preferenze e consensi; rendicontazione; importazione dell’estratto conto e delle campagne, caricamento massivo in VERIF!CO | Copre tutti i requisiti obbligatori della traccia; risolve i problemi più urgenti (flusso rovesciato, inserimento manuale in VERIF!CO) |
| Fase 2 – entro fine anno | Bot integrato; PayPal e Satispay; rinnovo delle adozioni con promemoria; area soci; scadenza degli accessi con avvisi; avvisi di nuove foto e rendicontazioni; sanatoria dei dati pregressi; inviti ai donatori delle campagne; spazio informativo con collegamenti al sito | Si appoggia sui dati e sui ruoli della fase 1 |
| Futuro – non incluso | Chat; gruppo WhatsApp; app sugli store; accesso dall’Uganda; interfaccia in inglese | Vincoli tecnici e di costo; vedi cap. 1.3 |

# 18. Piano di valutazione

**Stato:** **MANCANTE**

*Origine: template del docente – sezione nuova, non presente nella nostra bozza*

> **🧭 Dal template**
>
> - Come capirai che il sistema funziona e che la soluzione ha un impatto positivo?
> - Qui stanno anche gli **obiettivi misurabili** del progetto: 3–4 obiettivi con il valore di oggi e il traguardo (es. ore al mese per preparare i dati per VERIF!CO; percentuale di sostenitori con dati completi; donazioni dichiarate non ritrovate). Le righe sono proposte da confermare.

> **✍ Da compilare – domanda del template, adattata a Effatà**
>
> Come capirete che il Gestionale Effatà funziona, e come validerete che sta avendo un impatto positivo sul lavoro dell’associazione?

| Metrica | Obiettivo | Come la misurate | Quando |
| --- | --- | --- | --- |
| Sostenitori che completano il primo accesso senza aiuto | es. 90% | Osservazione durante il collaudo | Collaudo |
| Donazioni perse o duplicate | 0 | Confronto fra estratto conto e donazioni registrate | Primo mese |
| Righe estratte dall’AI corrette senza modifiche |   | Confronto con la revisione del tesoriere |   |
| Ore al mese per la preparazione dati Verifico |   | Confronto con la situazione di oggi (cap. 3.3) |   |
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
| Dipendenza da una sola persona (sviluppo, account e credenziali in capo ad Andrea) | Media | Alto | Repository in un’organizzazione GitHub dell’associazione; hosting, dominio e servizi intestati all’associazione; credenziali in un gestore di password condiviso con il presidente; documentazione per il passaggio di consegne (NFR-16) |
| Poca esperienza con React all’inizio dello sviluppo | Media | Medio | Partire dalle schermate più semplici; struttura del frontend semplice; appoggio al corso parallelo; fase 1 limitata al perimetro minimo |
| Dati storici incompleti: per alcuni padrini nessuno ricorda il nome del bambino | Alta | Medio | Adozione storica valida e corretta contabilmente, “bambino da identificare” finché la referente non lo ritrova; nessuna foto inviata senza abbinamento confermato |
| La fase 1 cresce con le modifiche al bot e il recupero dei dati | Alta | Alto | Prima da spostare in fase 2: nome del padrino nei post e riepilogo mensile dal gestionale; caricamento dalle schermate del gestionale come alternativa al bot |
| Foto di un minore agganciata al bambino sbagliato | Bassa | Alto | Nessun abbinamento senza conferma di una persona con la foto profilo (FR-BOT-05); l’amministratore può nascondere subito una foto |
| Calendario solidale con password predefinita nel codice pubblico e database in una cartella temporanea | Media | Alto | Verificare subito la password impostata sul server e la posizione del database; backup; accesso del gestionale tramite token (DIP-18) |
| Donazioni con carta del 2026 non registrate in VERIF!CO in tempo per le certificazioni, se la fase 1 non è pronta entro gennaio | Alta | Alto | Registrarle prima della chiusura con il conto STRIPE e il tracciato Stripe, dopo il parere del commercialista e una prova su una riga; conservare le esportazioni di Stripe come copia (DIP-19, DIP-20) |
| Importazione in VERIF!CO che crea anagrafiche doppie o collega un pagamento alla persona sbagliata (email condivise da più anagrafiche, donatori nuovi senza codice fiscale) | Media | Medio | Anagrafiche caricate prima dei movimenti; il gestionale segnala le email duplicate prima di generare i file; prova su una riga (ASS-08) |
| Server condiviso con bot e calendario: risorse limitate (1 CPU, 4 GB) e protezioni di base non ancora attive (firewall senza regole, accesso root) | Media | Alto | Firewall con le sole porte 22, 80 e 443; accesso SSH solo con chiave, senza password di root; monitoraggio di disco e memoria, passaggio a KVM 2 oltre l’80% |
| Ospite che inoltra il link di accesso e mostra le foto dei minori ad altri | Bassa | Medio | Solo foto pubbliche, già sui social; nessun download; link legato all’email; accesso di 7 giorni (FR-REG-05) |
|   |   |   |   |

# 20. Domande di verifica (autovalutazione)

**Stato:** **MANCANTE**

*Origine: sezione aggiuntiva della nostra bozza – non richiesta dal template, la teniamo*

Domande che un cliente o un valutatore potrebbe porre sul PRD. Se una risposta manca, la sezione collegata non è ancora pronta.

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

11. Quale parte è stata progettata con il supporto dell’AI e quale in autonomia, e come sono state verificate le proposte dell’AI?

> *(spazio per appunti)*

# 21. Acceptance Criteria di questa PRD

**Stato:** **DA VERIFICARE A FINE LAVORO**

*Origine: template del docente – sezione nuova, non presente nella nostra bozza*

Checklist finale del template, da spuntare prima della consegna.

- [ ] Ogni parte rappresentata dal template ha tutte le sezioni richieste senza saltare nessun punto.
- [ ] Avete deciso tutti i punti che la traccia e gli esempi lasciano aperti (cap. 5.6).
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
| Esiste un elenco dei bambini con un codice? | No: in VERIF!CO ci sono i padrini, a volte con il nome del bambino nelle note; il collegamento è negli appunti cartacei della referente | 01/10/2026 |
| Quante famiglie seguite? Quanti bambini per famiglia in media? |   |   |
| Quanti interventi non di adozione all’anno, per tipo? |   |   |
| Un export di esempio dell’estratto conto UniCredit (CSV/Excel), anonimizzato |   |   |
| Quale versione di VERIF!CO usate (Maxi, Premium, Mini)? | VERIF!CO Maxi (contabilità per competenza) | 29/09/2026 |
| I progetti sono già censiti in VERIF!CO (ID_PROGETTO)? | Oggi si imputa con il conto di bilancio (215.020.01–04) e i Progetti quasi non sono usati; si useranno i Progetti corrispondenti ai quattro conti (FR-INT-02) | 01/10/2026 |
| Come vengono raccolti oggi i consensi per le foto dei bambini? | Moduli cartacei firmati tramite la referente; archiviazione da verificare | 01/10/2026 |
| Quanti soci? Quota annuale e scadenza? | 10 associati registrati in VERIF!CO dal 23/05/2023: presidente, tesoriere e 8 volontari; quota e scadenza da definire. Volontari: circa 12 | 01/10/2026 |
| Campagne esterne (GoFundMe): in VERIF!CO si registra il netto ricevuto o il lordo donato, con le commissioni come costo? (commercialista) |   |   |
| Il modulo “Associati” di VERIF!CO è già usato per soci e quote associative? (impatto sull’area soci) |   |   |
| In VERIF!CO quale SMTP è attivo e predefinito per la newsletter: Gmail o Brevo? Limiti del piano Brevo? |   |   |
| L’export UniCredit contiene l’IBAN dell’ordinante e la causale completa? Fino a quanto indietro si può esportare? |   |   |
| Per gli inviti ai sostenitori storici: contatti più affidabili via email o via WhatsApp? |   |   |
| VERIF!CO (assistenza): si possono esportare in blocco i PDF delle ricevute, e con quale nome dei file? Esiste un’API? |   |   |
| Ruoli delle persone intervistate il 01/10/2026 (cap. 6.2) |   |   |
| Copia del modulo di consenso attuale (senza nomi). Viene firmato sempre o solo per le adozioni? Chi segue la privacy nell’associazione? Il consenso unico “tutto o niente” è ammesso? (FR-CON-01) |   |   |
| La comunicazione del compleanno al sostenitore è coperta dal modulo di consenso? (FR-ADO-05, referente privacy) |   |   |
| Calendario solidale e altre iniziative: come arrivano oggi le offerte (bonifico, contanti, piattaforma)? |   |   |
| Esiste già un previsionale o piano economico per capitolo in VERIF!CO? (FR-DASH-02) |   |   |
| VERIF!CO (assistenza): si possono importare le anagrafiche da file? Con quale tracciato? (FR-VER-02) |   |   |
| La casa famiglia Effatà ha un proprio ID_PROGETTO in VERIF!CO? (FR-INT-07) |   |   |
| Quota associativa: come va registrata in VERIF!CO e nella causale? (commercialista, FR-SOC-01) |   |   |
| Satispay è attivo e usato per il calendario solidale? Dove arrivano i suoi versamenti? (FR-CAN-03) | Sì: passa da Stripe, come la carta, e arriva con i versamenti di Stripe | 01/10/2026 |
| Esportazione da VERIF!CO di anagrafiche dei padrini, donazioni e note: in quale formato? (AMM-09) | Excel. Movimenti in partita doppia con anagrafica e progetto (formato attuale dal 2025); anagrafiche con codice fiscale, email e note, senza IBAN | 01/10/2026 |
| La referente è disponibile a compilare dal telefono gli elenchi dei bambini per villaggio? Da quale villaggio si parte? (AMM-09) | Sì, li compila la referente | 01/10/2026 |
| Cosa c’è nel campo Note delle anagrafiche di VERIF!CO? | Il nome del bambino adottato | 01/10/2026 |
| Le adozioni si pagano a rate? | No: 180 € l’anno; gli importi minori sul conto delle adozioni sono altre donazioni | 01/10/2026 |
| L’indirizzo serve per la certificazione? | No: basta il codice fiscale | 01/10/2026 |
| L’amministratore e il tesoriere registrato in VERIF!CO sono la stessa persona? (cap. 2, 3.1) |   |   |
| Commercialista: le donazioni del calendario solidale sono erogazioni liberali (area A) o raccolta fondi (area C)? Va bene lo schema con il conto STRIPE (donazione alla data del pagamento, giroconto al versamento, commissioni con un movimento per versamento)? (FR-VER-02, DIP-20) |   |   |
| VERIF!CO (assistenza): il campo Progetti del tracciato di importazione porta il movimento sul conto di bilancio giusto? Si può annullare un’importazione sbagliata? (FR-INT-02, DIP-15) |   |   |
| Stripe 2026: i pagamenti che non tornano con i versamenti (probabili tentativi ripetuti) vanno verificati prima del caricamento in VERIF!CO |   |   |
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
