# Gestionale Effatà

**Piattaforma per sostenitori, adozioni a distanza e rendicontazione di Effatà Italia ODV**

Progetto personale di Andrea Pavan per l'ITS (2° anno), sviluppato con la metodologia della traccia "ScuolaChill": prima il PRD, poi il codice.

> 📄 **[Leggi il PRD v2.0](docs/PRD.md)** · **[Allegati](docs/PRD_allegati.md)** · **[Presentazione](docs/Presentazione_PRD_v2.0.pdf)**

## Stato del progetto

**Fase attuale: PRD v2.0 consegnato per la validazione** (9 ottobre 2026; validazione entro il 23 ottobre).
Lo sviluppo del codice inizierà solo dopo la validazione del PRD.

## Documentazione

| File | Contenuto |
| --- | --- |
| [`docs/PRD.md`](docs/PRD.md) | Product Requirements Document, con i capitoli nell'ordine del template del docente; lo storico breve è all'inizio del documento |
| [`docs/PRD_allegati.md`](docs/PRD_allegati.md) | Allegati al PRD: gestione delle modifiche, schede informative, rischi, domande di verifica, storico completo, domande all'associazione, fonti, brain dump, modulo di consenso |
| [`docs/Presentazione_PRD_v2.0.pdf`](docs/Presentazione_PRD_v2.0.pdf) | Slide della presentazione del PRD v2.0 (prima parte: capitoli 1–10 e checklist del capitolo 19) |
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
