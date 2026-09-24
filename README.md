# Gestionale Effatà

**Piattaforma per sostenitori, adozioni a distanza e rendicontazione di Effatà Italia ODV**

Progetto personale di Andrea Pavan per l'ITS (2° anno), sviluppato con la metodologia della traccia "ScuolaChill": prima il PRD, poi il codice.

## Stato del progetto

**Fase attuale: stesura del PRD.** Consegna al docente: **9 ottobre 2026**.
Lo sviluppo del codice inizierà solo dopo la validazione del PRD.

## Documentazione

| File | Contenuto |
| --- | --- |
| [`docs/PRD.md`](docs/PRD.md) | Product Requirements Document (versione di lavoro, lo storico delle versioni è all'inizio del documento) |
| [`docs/DIARIO.md`](docs/DIARIO.md) | Diario delle sessioni di lavoro: decisioni prese, punti aperti, prossimi passi |
| [`docs/bot/TECHNICAL-INTEGRATION.md`](docs/bot/TECHNICAL-INTEGRATION.md) | Documentazione tecnica del bot social esistente (sistema separato), verificata sul codice |
| `docs/archivio/` | Versioni superate, conservate come riferimento storico |

## Gestione delle modifiche

Il PRD è il documento di riferimento. Ogni modifica:

1. aggiorna il PRD e incrementa la versione nello storico;
2. aggiorna il diario;
3. viene registrata con un commit nel formato `update: descrizione (PRD vX.Y)`.

Il PRD è l'unico documento di progetto: contiene il cosa, il come e il quando, secondo il template del docente. Dopo la validazione, il dettaglio tecnico vivrà nel codice (specifica OpenAPI, migrazioni del database, configurazioni di deployment, milestone e issue di GitHub), senza copie parallele in Markdown.

## Privacy

Questa repository **non contiene dati reali** di sostenitori, beneficiari o movimenti bancari, né segreti (token, password, chiavi). Gli esempi usano dati fittizi; le configurazioni usano solo file `.env.example` con i nomi delle variabili.

---

*Progetto didattico per Effatà Italia ODV.*
