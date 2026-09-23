# 📓 Diario di Progetto – Gestionale Effatà

## 23/09/2026 – Sessione 1 · PRD Gestionale Effatà (v3.4)

### ✅ Fatto

- **PRD riorganizzato** sul template del prof (3 parti, doppi titoli), brain dump inserito e riordinato
- **Numeri**: 700–800 sostenitori, ~1.200 bambini adottati
- **AS-IS**: Silvia → WhatsApp → Andrea → bot Telegram; estratti conto a mano in VERIF!CO
- **Ruoli**: amministratore, volontario (permessi configurabili), socio (area dedicata), sostenitore; referente Uganda = futuro
- **Decisioni architetturali tracciate**:
  - FR-ADO-01/02/03: un sostenitore attivo per bambino, riaffido con gestione visibilità
  - FR-INT-01: intervento ha uno o più finanziatori
  - FR-ACC-01/02/03: scadenza account per inattività, archiviazione, impostazioni admin
  - FR-RUO-01/02/03: permessi per ruolo, dati sensibili solo admin, area soci
- **Lingua**: solo italiano, testi in file di traduzione separati (per aggiungere inglese dopo)
- **Scoperte VERIF!CO**: tracciato master, IBAN_MITTENTE per abbinare automatico, ID_PROGETTO lega contabilità a progetto

### 🔴 Aperto

- Perimetro MVP vs futuro (1.3): cosa incluso/escluso, cosa riaffido
- Cosa vede ogni sostenitore della famiglia che aiuta
- Domande all'associazione (Appendice B): export UniCredit CSV, versione VERIF!CO, come si raccolgono consensi foto

### 📅 Prossimi passi (CORRETTO)

**⚠ IMPORTANTE: Niente codice fino al 9/10. Solo PRD.**

Fino alla validazione del PRD (9 ottobre + presentazione), si lavora esclusivamente sul documento. Niente implementazione in repository. Al massimo, piccoli esperimenti di verifica fuori dal progetto (es. leggere un CSV di UniCredit), dichiarati come prove.

| Data | Cosa | Dove |
|------|------|------|
| **Entro ven 25 set** | Confermare perimetro e fasi (cap. 1.3); portare domande all'associazione (App. B) | PRD cap. 1.3, App. B |
| **26–30 set** | Beneficiari, interventi, banca → VERIF!CO, rendicontazione, registrazione privacy; user story, user flow, requisiti non funzionali, assunzioni (cap. 3–7) | PRD cap. 3–7 |
| **1–4 ott** | Scelte tecnologiche motivate dai requisiti, architettura, API, modello dati, sicurezza (cap. 9–14) | PRD cap. 9–14 |
| **5–7 ott** | Stima carico, costi, deployment, milestone, rischi (cap. 8, 15–19) | PRD cap. 8, 15–19 |
| **8 ott** | Revisione con checklist template, pulizia, ridurre a 15–25 pagine | PRD tutto |
| **9 ott** | **CONSEGNA PRD al prof** | Presentazione + PRD finale |
| **Dopo 9 ott** | Validazione prof → ALLORA inizi implementazione | Repository |

### 🎯 Prossima sessione di ripresa

**Quando:** Lunedì-martedì prossima (26-27 sett)

**Da dove ripartiamo:** Dalla conferma del perimetro (1.3) e dalle risposte dell'associazione alle domande dell'Appendice B

**Cosa avrai**: perimetro definito, numeri confermati, domande al prof risolte

---

## Note importanti

**Sulla repository:**
- ❌ Non caricare dati reali (sostenitori, bambini, foto)
- ❌ Nemmeno per prova, nemmeno anonimizzati se sensibili
- ✅ Aggiungere a `.gitignore`: `/data/`, `/exports/`, `/test-files/`
- ✅ Nel PRD usare solo esempi finti (UG-102, Mario Rossi, etc.)

**Tra le due chat di Claude:**
- Questo DIARIO.md è la fonte unica di verità tra le sessioni
- Aggiorna sempre a fine sessione
- Fai leggere al prossimo Claude per ricominciare dalle stesse decisioni
