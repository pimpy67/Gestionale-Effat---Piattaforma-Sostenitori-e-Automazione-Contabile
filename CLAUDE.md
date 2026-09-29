# Istruzioni per Claude – Gestionale Effatà

## Il progetto
Gestionale Effatà – Piattaforma Sostenitori e Automazione Contabile, per Effatà Italia ODV.
Progetto ITS (2° anno) di Andrea Pavan, con la metodologia della traccia "ScuolaChill": **prima il PRD, poi il codice**.

## Documenti
- `docs/PRD.md` – l'unico documento di progetto (cosa, come, quando). La versione è nella tabella "Informazioni sul documento".
- `docs/DIARIO.md` – decisioni e prossimi passi, sessione per sessione.
- `docs/bot/TECHNICAL-INTEGRATION.md` – il bot social esistente (sistema separato).

## Regole
1. **Nessun codice del gestionale prima della validazione del PRD** da parte del docente (consegna del PRD: 9 ottobre 2026).
2. **Il codice segue il PRD.** Se un requisito deve cambiare, prima si aggiorna il PRD, poi il codice.
3. **Non modificare `docs/PRD.md` senza chiedere ad Andrea.** Le decisioni sono sue; proponi le modifiche e attendi conferma.
4. Versioni del PRD: 1.x per sessione di lavoro che cambia decisioni, 2.0 alla consegna, 3.0 alla validazione. Correzioni minori senza cambio di versione (commit `docs: …`).
5. Commit delle nuove versioni: `update: descrizione (PRD vX.Y)` e tag `prd-vX.Y`.
6. **Nessun dato reale** (sostenitori, beneficiari, movimenti bancari, foto) e **nessun segreto** (token, password, chiavi) nella repository. Solo dati fittizi e `.env.example`.
7. Non creare documenti tecnici paralleli in `docs/` (architettura, schema, API, timeline): stanno nel PRD e, dopo la validazione, nel codice.
8. Rispondi in italiano.
