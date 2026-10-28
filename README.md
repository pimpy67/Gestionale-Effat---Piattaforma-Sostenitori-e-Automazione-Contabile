# Gestionale Effatà

**Piattaforma per sostenitori, adozioni a distanza e rendicontazione di Effatà Italia ODV**

Progetto personale di Andrea Pavan per l'ITS (2° anno), sviluppato con la metodologia della traccia "ScuolaChill": prima il PRD, poi il codice.

> 📄 **[Leggi il PRD v3.0](docs/PRD.md)** · **[Allegati](docs/PRD_allegati.md)** · **Presentazione: [PowerPoint](docs/Presentazione_PRD_v2.1.pptx) · [PDF](docs/Presentazione_PRD_v2.1.pdf)** · **[Diagramma ER](docs/Diagramma_ER_PRD_v2.3.svg)**

## Stato del progetto

**Fase attuale: PRD v3.0 validato, sviluppo avviato (M1).** Il primo passo è il database: PostgreSQL 16 con le 37 tabelle del capitolo 12 del PRD.

## Avviare il database in locale

Servono Docker Desktop e Node.js.

```bash
cp .env.example .env      # poi scegli una password tua: il file .env non va mai nella repository
npm install               # installa Prisma e gli strumenti del monorepo
npm run db:avvia          # avvia PostgreSQL 16 in Docker (docker-compose.yml)
npm run db:migra          # crea le 37 tabelle con vincoli, sequenze dei codici e viste
npm run db:seed           # inserisce i dati di fantasia (mai dati reali)
```

- Schema: [`apps/api/prisma/schema.prisma`](apps/api/prisma/schema.prisma).
- Migrazione iniziale, con i vincoli che Prisma non sa esprimere (uno e uno solo, adozione attiva unica, importi positivi, codici BAM/FAM/RIC, viste materializzate): [`apps/api/prisma/migrations`](apps/api/prisma/migrations).
- Per ripartire da zero: `npm run db:reset` (cancella i dati, riapplica la migrazione e il seed).

## Avviare l'API in locale

Con il database avviato:

```bash
npm run api:dev           # API NestJS con ricarica automatica su http://localhost:3000/api/v1
npm run api:test          # test unitari (Jest)
npm run api:test:e2e      # test end-to-end sull'API vera (serve il database)
```

- Controllo di salute: `GET http://localhost:3000/api/v1/salute`.
- Documentazione OpenAPI generata dal codice: `http://localhost:3000/api/v1/docs` (solo in sviluppo).
- Tutti gli errori in formato RFC 9457, con messaggi in italiano (PRD cap. 11.3).
- Il worker (lavori lenti e pianificati) si avvia con `npm run start:worker:dev --workspace apps/api`.

## Documentazione

| File | Contenuto |
| --- | --- |
| [`docs/PRD.md`](docs/PRD.md) | Product Requirements Document, con i capitoli nell'ordine del template del docente; lo storico breve è all'inizio del documento |
| [`docs/PRD_allegati.md`](docs/PRD_allegati.md) | Allegati al PRD: gestione delle modifiche, schede informative, rischi, domande di verifica, storico completo, domande all'associazione, fonti, brain dump, modulo di consenso |
| [`docs/Presentazione_PRD_v2.1.pptx`](docs/Presentazione_PRD_v2.1.pptx) | Slide della presentazione del PRD v2.1 in PowerPoint, con il testo da dire nelle note (prima parte: chi è Effatà, capitoli 1–10 e checklist del capitolo 19). GitHub non mostra l’anteprima: si scarica con “Download raw file” |
| [`docs/Presentazione_PRD_v2.1.pdf`](docs/Presentazione_PRD_v2.1.pdf) | Le stesse slide in PDF, visibili direttamente su GitHub |
| [`docs/Diagramma_ER_PRD_v2.3.svg`](docs/Diagramma_ER_PRD_v2.3.svg) | Diagramma ER completo delle 37 tabelle, generato dal codice mermaid del capitolo 12.2 del PRD v2.3: in caso di differenze vale il PRD |
| [`docs/DIARIO.md`](docs/DIARIO.md) | Diario delle sessioni di lavoro: decisioni prese, punti aperti, prossimi passi |
| [`docs/bot/TECHNICAL-INTEGRATION.md`](docs/bot/TECHNICAL-INTEGRATION.md) | Documentazione tecnica del bot social esistente (sistema separato), verificata sul codice |

## Gestione delle modifiche

Il PRD è il documento di riferimento. Ogni modifica:

1. aggiorna il PRD (e, se serve, gli allegati) e incrementa la versione nello storico;
2. aggiorna il diario;
3. viene registrata con un commit nel formato `update: descrizione (PRD vX.Y)`.

Il PRD, con i suoi allegati, è l'unico documento di progetto: contiene il cosa, il come e il quando, secondo il template del docente. Le versioni precedenti si ritrovano nella storia di git, con i tag `prd-vX.Y`. Dopo la validazione, il dettaglio tecnico vivrà nel codice (specifica OpenAPI, migrazioni del database, configurazioni di deployment, milestone e issue di GitHub), senza copie parallele in Markdown.

## Privacy

Questa repository **non contiene dati reali** di sostenitori, beneficiari o movimenti bancari, né segreti (token, password, chiavi). Gli esempi usano dati fittizi; le configurazioni usano solo file `.env.example` con i nomi delle variabili.

---

*Progetto didattico per Effatà Italia ODV.*
