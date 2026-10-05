**Allegati al PRD del Gestionale Effatà**

Piattaforma Sostenitori e Automazione Contabile

*Versione 1.15 – file di accompagnamento a `docs/PRD.md`*

Questo file raccoglie le sezioni aggiunte da noi al template del docente e il materiale di lavoro. I riferimenti “cap.” rimandano ai capitoli del PRD.

| Allegato | Contenuto |
| --- | --- |
| A | Gestione delle modifiche |
| B | Schede informative (dati di sostenitore, bambino, famiglia, intervento) |
| C | Rischi |
| D | Domande di verifica (autovalutazione) |
| E | Storico completo delle versioni |
| F | Domande all’associazione |
| G | Ricerca: link e fonti |
| H | Brain dump iniziale |
| I | Modulo di consenso della famiglia (bozza in italiano e inglese) |

# Allegato A – Gestione delle modifiche


**Due file, nessun doppione.** Il PRD (`docs/PRD.md`) segue l’indice del template del docente e contiene il **cosa** (prima parte), il **come** (seconda parte) e il **quando** (terza parte). Il file degli allegati (`docs/PRD_allegati.md`) raccoglie le sezioni aggiunte da noi e il materiale di lavoro. Non esistono altri file per architettura, schema del database, API o timeline: sarebbero copie destinate a divergere.

**Numerazione delle versioni.** La versione cambia solo quando cambiano le decisioni, non a ogni ritocco. **Versione intermedia (1.1, 1.2…):** una per sessione di lavoro che aggiunge o cambia requisiti, perimetro o scelte, con una riga nello storico e il motivo. **Versione principale (2.0, 3.0…):** alle tappe, cioè la consegna del 9 ottobre (2.0) e la versione validata dal docente. **Correzioni minori** (refusi, formattazione, riformulazioni): nessun cambio di versione, solo un commit `docs: descrizione`.

**Ogni nuova versione:** 1) aggiornare il PRD, gli allegati e lo storico; 2) aggiornare `docs/DIARIO.md`; 3) commit `update: descrizione (PRD vX.Y)` e tag git `prd-vX.Y`.

**Dopo la validazione, il “come” di dettaglio vive nel codice**, generato o verificato automaticamente: la specifica OpenAPI/Swagger per le API, le migrazioni per lo schema del database, i file di configurazione e gli script per il deployment, le milestone e le issue di GitHub per i tempi.

**Il codice segue il PRD.** Ogni comportamento del sistema deve corrispondere a quanto scritto nel PRD. Se durante lo sviluppo emerge che un requisito va cambiato (un vincolo tecnico, una richiesta dell’associazione, un errore di analisi), **prima si aggiorna il PRD** con una nuova versione e il motivo, **poi si modifica il codice**. Se invece il codice fa qualcosa di diverso dal PRD senza che ci sia stata una decisione, è un difetto del codice e va corretto. Un PRD che dice una cosa mentre il codice ne fa un’altra è peggio di nessun PRD (template del docente).


# Allegato B – Schede informative

Le schede completano il capitolo 5 del PRD: descrivono **quali informazioni** servono e chi le vede, non come sono salvate (il modello dei dati è nel capitolo 12). Si raccoglie solo il minimo necessario (minimizzazione GDPR). Nella colonna **Visibile a**: A = amministratore, V = volontario, S = il sostenitore interessato; la visibilità dei dati non sensibili per V e S è configurabile (FR-RUO-04).

## Scheda sostenitore

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

## Scheda bambino

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

## Scheda famiglia

Una famiglia ha uno o più bambini, ciascuno adottato dal proprio sostenitore. Gli altri interventi (animali, materassi, casette…) vanno di solito alla famiglia, ognuno con il proprio sostenitore. Chi sostiene un intervento per la famiglia non vede i bambini adottati da altri, e chi adotta un bambino non vede gli altri interventi ricevuti dalla famiglia (FR-VIS-01).

| Campo | Perché serve | Chi lo inserisce | Obbl. | Visibile a / note privacy |
| --- | --- | --- | --- | --- |
| Codice famiglia (es. FAM-0045) | Identificativo generato dal gestionale (FR-COD-01) | Sistema | Sì | A, V |
| Genitore o tutore di riferimento | Firma il modulo di consenso (per la casa famiglia: la referente) | Amministratore | Sì | A; dato personale di terzi |
| Villaggio / distretto | Rendicontazione per zona | Amministratore | Sì | A, V; S solo il distretto |
| Componenti (bambini) | Collegamento alle schede bambino | Sistema | — | Ogni sostenitore vede solo i propri beneficiari |
| Modulo di consenso caricato (data, raccolto da) e quattro caselle: foto al padrino, pubblicazione, compleanno, salute | Applicazione automatica di ogni scopo (FR-CON-01) | Amministratore | — | A; V e S vedono solo gli effetti |
| Foto o scansione del modulo firmato | Prova del consenso | Amministratore | — | **Dato sensibile: solo A** |
| Interventi ricevuti | Storico degli aiuti alla famiglia | Sistema | — | A; S vede solo quelli che ha sostenuto |

## Scheda intervento

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


# Allegato C – Rischi

Ogni rischio ha una probabilità e un impatto (basso, medio, alto) e una contromisura. Si rivedono a ogni milestone (cap. 17.1 del PRD).

| ID | Rischio | Probabilità | Impatto | Mitigazione |
| --- | --- | --- | --- | --- |
| RIS-01 | Tempi di sviluppo insufficienti per arrivare online ad aprile (una sola persona, 12–15 ore a settimana) | Alta | Alto | Milestone con margine e revisione a ogni tappa; lista dei tagli del cap. 17.2, che non tocca i requisiti obbligatori della traccia; autenticazione, ruoli e paginazione pronti fin da M1 |
| RIS-02 | La fase 1 cresce con le modifiche al bot e il recupero dei dati | Alta | Alto | Perimetro fissato dal PRD validato: ogni aggiunta passa da una nuova versione del PRD (Allegato A); tagli del cap. 17.2; caricamento dalle schermate del gestionale come alternativa al bot |
| RIS-03 | Poca esperienza con React all’inizio dello sviluppo | Media | Medio | Partire dalle schermate più semplici (accesso, profilo); componenti Ionic già pronti; appoggio al corso parallelo |
| RIS-04 | Dipendenza da una sola persona (sviluppo, account e credenziali in capo ad Andrea) | Media | Alto | Repository in un’organizzazione GitHub dell’associazione; hosting, dominio e servizi intestati all’associazione; credenziali in un gestore di password condiviso con il presidente; documentazione per il passaggio di consegne (NFR-16) |
| RIS-05 | Violazione di dati di minori (foto o dati sanitari esposti) | Bassa | Alto | Foto mai pubbliche, link firmati a scadenza, dati sanitari separati e solo all’amministratore, controllo di proprietà su ogni richiesta con un test per endpoint (NFR-07, NFR-08); registro degli accessi; backup cifrati |
| RIS-06 | Foto di un minore agganciata al bambino sbagliato | Bassa | Alto | Ricerca filtrata e conferma di una persona con la foto profilo (FR-BOT-05); l’amministratore può spostare o nascondere subito una foto |
| RIS-07 | Moduli di consenso delle famiglie non raccolti in tempo per l’apertura | Media | Alto | Avvio graduale con un primo villaggio e i suoi moduli (FR-STO-01, DIP-17); senza modulo il sistema tratta la famiglia come “nessun consenso”, quindi il rischio è di contenuti non visibili, non di esposizione |
| RIS-08 | La referente o i sostenitori non adottano il nuovo flusso (donazioni ancora fuori dal gestionale) | Media | Alto | Il gruppo WhatsApp resta durante il passaggio; Silvia invia solo un link; accesso ospite senza registrazione; bonifici fuori flusso comunque abbinati all’importazione dell’estratto conto (AMM-04) |
| RIS-09 | L’estratto conto UniCredit non contiene i dati attesi (nome o IBAN dell’ordinante, causale completa) | Media | Medio | Verifica su un estratto anonimizzato prima di M5 (DIP-01, ASS-02); abbinamento manuale con proposta dal nome nella causale (AMM-04) |
| RIS-10 | Formato di importazione di VERIF!CO diverso dal previsto, o progetto che non porta al conto giusto | Media | Medio | Tracciati master e Stripe già ricevuti (DIP-02); domande all’assistenza (DIP-12, DIP-15); prova su una riga prima di ogni primo caricamento |
| RIS-11 | Importazione in VERIF!CO che crea anagrafiche doppie o collega un pagamento alla persona sbagliata (email condivise, donatori senza codice fiscale) | Media | Medio | Anagrafiche caricate prima dei movimenti; il gestionale segnala le email duplicate prima di generare i file; prova su una riga (ASS-08) |
| RIS-12 | Donazioni con carta del 2026 non registrate in VERIF!CO in tempo per le certificazioni (la fase 1 sarà online solo ad aprile 2027) | Alta | Alto | Registrarle prima della chiusura dell’anno con il conto STRIPE e il tracciato Stripe, dopo il parere del commercialista e una prova su una riga; conservare le esportazioni di Stripe come copia (DIP-19, DIP-20) |
| RIS-13 | L’AI del bot legge un nome sbagliato o propone la voce della checklist sbagliata | Media | Basso | È solo una proposta: il volontario conferma sempre con un tocco, e nessun abbinamento avviene senza conferma (FR-BOT-05, FR-INT-03) |
| RIS-14 | Cambi nelle API esterne (versioni di Meta e Stripe, modelli AI ritirati) | Media | Medio | Ogni servizio esterno dietro un adattatore (cap. 14.2); versione delle API fissata; verifica periodica di versioni e modelli |
| RIS-15 | Server condiviso con bot e calendario: risorse limitate (1 CPU, 4 GB) e protezioni di base non ancora attive (firewall senza regole, accesso root con password) | Media | Alto | Prima di M1: firewall con le sole porte 22, 80 e 443, accesso SSH solo con chiave e senza password di root; monitoraggio di disco e memoria, passaggio a KVM 2 oltre l’80% (cap. 15) |
| RIS-16 | Calendario solidale con password predefinita nel codice pubblico e database in una cartella temporanea | Media | Alto | Verificare subito la password impostata sul server e la posizione del database; backup; accesso del gestionale tramite token in sola lettura (DIP-18) |
| RIS-17 | Backup che non si riesce a ripristinare | Bassa | Alto | Prova di ripristino completa prima del collaudo e poi una volta l’anno (NFR-04); chiave di cifratura anche nel gestore di password dell’associazione |
| RIS-18 | Ospite che inoltra il link di accesso e mostra le foto dei minori ad altri | Bassa | Medio | Solo foto pubbliche, già sui social; nessun download; link legato all’email; accesso di 7 giorni (FR-REG-05) |
| RIS-19 | Documentazione generata con l’AI non allineata al codice | Alta | Medio | Verifica di ogni affermazione sul codice; OpenAPI generata dal codice (NFR-12); il codice segue il PRD (Allegato A) |
| RIS-20 | Connessione debole in Uganda, per il futuro accesso diretto della referente | Bassa | Basso | Fuori dalla fase 1 (cap. 1.3); pagine leggere e immagini compresse già richieste da NFR-11 |
| RIS-21 | API del bot esposte senza autenticazione | — | Alto | Risolto il 24/09/2026: token obbligatorio sulle rotte /api/*; per il gestionale un token dedicato (DIP-03) |


# Allegato D – Domande di verifica (autovalutazione)

Le domande che un cliente o un valutatore potrebbe porre sul PRD, con la risposta breve e il capitolo in cui è sviluppata.

1. **Perché un progetto diverso da quello proposto, e come copre gli stessi requisiti?** Perché ha un cliente reale, Effatà Italia ODV, con un problema reale: donazioni ricostruite a posteriori e inserite a mano in VERIF!CO. Copre gli stessi requisiti della traccia: più ruoli (amministratore, volontario, sostenitore, più ospite e socio), CRUD completo su sostenitori, famiglie, bambini, richieste e interventi (cap. 11.1), autorizzazioni verificate nel backend con una matrice e un test per ogni diniego (cap. 13.2), una vista d’insieme aggregata (FR-DASH-01), HTTPS, OpenAPI, Postman, Development e Production (NFR-06, 12, 15).
2. **Quanti utenti concorrenti prevedi nel picco, e da quali numeri lo ricavi?** 50 nello stesso minuto dopo la newsletter: 760 destinatari, apertura del 40%, metà nella prima ora, un terzo nei primi dieci minuti. Il sistema si prova con 100 (cap. 8.1, NFR-01).
3. **Cosa succede se un servizio esterno non risponde?** Ogni servizio ha un tempo massimo e un comportamento previsto: se Stripe non conferma, il controllo periodico recupera la donazione una sola volta; se Brevo non risponde, l’email resta in coda e si ritenta; se il gestionale non risponde al bot, il bot ritenta ogni 10 minuti (cap. 13.3).
4. **Come impedisci a un sostenitore di vedere il bambino di un altro? Dove sta quel controllo?** Nel backend, in due passaggi: una guardia controlla ruolo e permesso; il livello applicativo carica i contenuti solo se esiste un’adozione fra quel sostenitore e quel bambino. Altrimenti risponde 403, e un test lo verifica per ogni endpoint (cap. 13.2, NFR-07, FR-VIS-01).
5. **Perché PostgreSQL e non l’alternativa?** Per transazioni e vincoli robusti: un indice unico parziale impedisce due adozioni attive per lo stesso bambino, e il blocco della riga decide chi paga per primo. È uguale in sviluppo, test e produzione, senza le differenze nascoste di SQLite (cap. 9, cap. 12.6).
6. **Come gestisci il consenso per le foto dei minori?** Un solo modulo per famiglia, in italiano e inglese, con una casella per ogni scopo (foto al padrino, pubblicazione, compleanno, salute), come chiede il GDPR. La referente lo fa firmare e lo fotografa, l’amministratore lo carica e riporta le caselle; senza modulo tutte valgono “no”: foto archiviate ma non visibili, niente vetrina né social. Le famiglie già seguite lo firmano gradualmente. Il controllo è automatico, anche per il bot (FR-CON-01, cap. 13.4).
7. **Quanto costa al mese il sistema all’associazione?** Circa 0–8 € in più, perché il gestionale usa la VPS già pagata per bot e calendario; backup, email e monitoraggio stanno nei piani gratuiti (cap. 15).
8. **Cosa succede se la stima di carico è sbagliata del doppio?** Il sistema è già provato con il doppio del picco; se i tempi peggiorano, cache delle pagine della vetrina e passaggio al piano superiore della VPS. Con la metà degli utenti non cambia nulla, perché i costi sono fissi (cap. 15).
9. **Come aggiungi una colonna al database quando il sistema è già in produzione?** Con una migrazione Prisma versionata, applicata dallo script di rilascio dopo un backup; le migrazioni sono additive in due tempi, così la versione precedente funziona ancora in caso di ritorno indietro (cap. 16).
10. **Chi hai intervistato per i requisiti impliciti, e cosa ne hai ricavato?** Quattro membri dell’associazione il 01/10/2026: ne sono nati gli obiettivi e l’andamento (FR-DASH-02), l’affidabilità dei dati economici (NFR-17), la tempestività delle donazioni (NFR-18), filtri, report e scadenze (FR-REP-01/02). Una sostenitrice di 35 anni il 04/10/2026: ha confermato la rendicontazione con le foto delle voci fisse (FR-INT-08) e chiesto il totale dell’anno nel profilo (SOS-08 AC-07), l’avanzamento dei progetti e i contatori di impatto (FR-DASH-03, fase 2).
11. **Quale parte è stata progettata con il supporto dell’AI e quale in autonomia, e come sono state verificate le proposte?** Il punto di partenza è a mano: brain dump e primo flusso dei dati (Allegato H), interviste, numeri e regole dell’associazione. L’AI (Claude) è stata usata per strutturare il documento sul template, proporre formulazioni, alternative e domande, e scrivere i testi. Ogni decisione è stata presa da Andrea, una alla volta, e registrata nello storico; i numeri vengono dai dati reali di VERIF!CO (solo totali), il comportamento del bot dal suo codice, i diagrammi sono stati verificati disegnandoli, i fatti esterni (modelli, servizi, standard) controllati sulle fonti.


# Allegato E – Storico completo delle versioni

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
| 1.7 | 03/10/2026 | Andrea Pavan | Capitoli 10 e 11 in forma definitiva. Architettura: un’unica app web per tutti i ruoli, API NestJS e worker separato per foto, PDF, email e importazioni, coda dei lavori in PostgreSQL (pg-boss), Traefik già presente sul server; diagramma dei componenti, livelli, direzione delle dipendenze e testabilità. API: risorse in italiano con prefisso /api/v1, PATCH per le modifiche parziali, azioni con regole su endpoint dedicati, DELETE solo dove si cancella davvero; contratto di dieci API principali; errori secondo RFC 9457, validazione su due livelli, paginazione con pagina e dimensione, chiavi contro gli invii ripetuti; OpenAPI generata dal codice e visibile solo agli amministratori in produzione; collezione Postman con un test per ogni AC negativo. Capitolo 9: Traefik al posto di Nginx. |
| 1.8 | 03/10/2026 | Andrea Pavan | Capitoli 12 e 13 in forma definitiva. Modello dei dati: circa 30 tabelle in quattro gruppi, tre diagrammi ER, UUID v7 come chiave interna e codici BAM/FAM/RIC come attributi immutabili, importi in centesimi, copia dei dati dell’avente diritto nella donazione, carrello salvato sul server, viste materializzate per l’andamento, blocco della riga contro i pagamenti simultanei. Sicurezza: token di accesso di 15 minuti e token di rinnovo monouso in cookie protetto, sessioni di 30 giorni per sostenitori e ospiti e di 12 ore per amministratori e volontari, revoca del collegamento Telegram, matrice delle autorizzazioni con la colonna Ospite, controllo in due passaggi nel backend, gestione dei fallimenti di Stripe, Brevo, calendario e backup, dati verso servizi esterni, segreti per ambiente. Nuova domanda per il referente privacy sull’elaborazione delle foto con l’AI. |
| 1.9 | 03/10/2026 | Andrea Pavan | Capitoli 14, 15 e 16 in forma definitiva; seconda parte completa. Qualità: monorepo nello stesso repository del PRD, moduli per funzionalità con i quattro livelli dentro, dependency inversion con il container di NestJS, adattatori, repository, guardie globali, eventi, macchina a stati e coda dei lavori; sette tipi di test con soglia di copertura dell’80% sul livello applicativo; differenze fra Development e Production, senza ambiente di staging. Costi: circa 0–8 € al mese in più, sulla VPS già pagata; scalabilità verticale e manuale con soglia dell’80%. Deployment: rilascio con tag di versione, immagini su GitHub Container Registry, script con backup, migrazioni, controllo di salute e ritorno automatico alla versione precedente; migrazioni additive in due tempi; backup notturni cifrati con restic su Backblaze B2; fasi di avvio dal collaudo con accesso limitato all’apertura graduale. |
| 1.10 | 03/10/2026 | Andrea Pavan | Capitoli 17 e 18 in forma definitiva; rischi (oggi Allegato C). Roadmap: consegna del PRD il 9 ottobre, validazione entro il 23 ottobre, sviluppo in otto milestone fino all’apertura entro il 30 aprile 2027 (12–15 ore a settimana); MVP aggiornato (bot e Satispay in fase 1) e lista ordinata dei tagli se il ritardo supera il margine. Piano di valutazione con dieci obiettivi misurabili (ore di inserimento in VERIF!CO –80%, zero donazioni perse o duplicate, meno del 10% di entrate da abbinare a mano, 80% degli interventi rendicontati entro 60 giorni). Rischi numerati RIS-01…21 con probabilità, impatto e contromisure. |
| 1.11 | 03/10/2026 | Andrea Pavan | Domande di verifica scritte (oggi Allegato D). Documento diviso in due file su indicazione di Andrea: il PRD segue punto per punto l’indice del template del docente (titoli del template, sezioni aggiunte da noi spostate negli allegati, guida e riquadri cancellati, storico breve); il file degli allegati contiene gestione delle modifiche, schede informative, rischi, domande di verifica, storico completo, domande all’associazione, fonti e brain dump. Nella prima parte tolti i riferimenti tecnici (codici di risposta, algoritmo delle password, nome del modello AI). Alternative scartate aggiunte per regione, monitoraggio e CI. Capitolo 19 del PRD: checklist finale del template compilata. |
| 1.12 | 03/10/2026 | Andrea Pavan | Rilettura dei capitoli 1–5. Capitolo 1.1 con i numeri di VERIF!CO; capitolo 1.2 riscritto in forma breve (fase 1 online entro aprile 2027, ospiti, Satispay in fase 1; fase 2 dopo l’apertura, PayPal); capitolo 3 con l’ospite fra gli utenti e i dati da verificare collegati all’Allegato F; capitolo 4.1 con link di 7 giorni, Satispay e bot; capitolo 17.2 senza la tabella delle fasi, che ripeteva il capitolo 1.2. Nel capitolo 5 le “Regole collegate” di SOS-01, AMM-06, AMM-09, VOL-02 e SOS-03 e le decisioni FR-ADO-01, FR-DON-01, FR-CAR-02, FR-SOS-02, FR-STO-01 e FR-RIC-01 non ripetono più ciò che è scritto altrove: al suo posto c’è il rimando. Nuova legenda delle sigle in “Informazioni sul documento”. Allegato F: domanda sugli iscritti alla newsletter. |
| 1.13 | 04/10/2026 | Andrea Pavan | Intervista 5 a una sostenitrice di 35 anni, raccolta con due messaggi vocali e trascritta: conferma la rendicontazione delle voci fisse con le foto e le voci fisse con il prezzo; nuovo AC-07 in SOS-08 (totale donato nell’anno in corso); nuova decisione FR-DASH-03 in fase 2 (barra di avanzamento degli obiettivi scelti dall’amministratore e contatori di impatto in vetrina). Capitolo 19 e Allegato D aggiornati. |
| 1.14 | 04/10/2026 | Andrea Pavan | Rilettura dei capitoli 6–19 con un controllo indipendente. Simpatizzante aggiunto nelle tabelle di API e permessi (cap. 11 e 13). Picco del carico ricavato in modo esplicito (760 anagrafiche con email, 50 accessi nei primi dieci minuti trattati come nello stesso minuto) e reso uguale nei capitoli 6.1, 8 e 8.1; NFR-04 con backup notturno di database e file. Modello dei dati: tabelle capitolo e raccolta_fondi descritte, email del sostenitore, quota_donazione collegata a intervento e capitolo, cardinalità e diagramma ER aggiornati; lavori pianificati del worker e controllo delle conferme di Stripe nel diagramma dell’architettura. Nuove route nel capitolo 11 (storico importazioni, abbinamenti, riepiloghi dell’area riservata, collegamento Telegram, modifiche in attesa, salute) e ruoli allineati alla matrice, divisa in righe più precise. Metrica del capitolo 18 divisa in due; capitolo 19 con l’elenco dei fornitori e le scelte provvisorie. Dipendenze con scadenza riferita alle milestone (DIP-12, DIP-13, DIP-16) e capitolo 17.1 con le dipendenze di ogni milestone. Intestazione compilata (team, data di consegna, stato). Allegato F: nuove domande sulla Cassa sostegno progetto e sulla conservazione degli account archiviati; Allegato G completato. |
| 1.15 | 04/10/2026 | Andrea Pavan | Consenso della famiglia rivisto con Andrea: un solo modulo bilingue (italiano e inglese) con una casella per ogni scopo, come chiede il GDPR: foto e notizie al padrino, pubblicazione su vetrina, sito e social, compleanno, informazioni sulla salute. L’amministratore riporta le caselle segnate dalla famiglia; senza modulo valgono tutte “no”; revoca possibile anche per un solo scopo. Raccolta graduale per le famiglie già seguite, obbligatoria prima dell’approvazione per le richieste nuove. Senza consenso alla pubblicazione la richiesta compare nella vetrina senza foto, con solo nome ed età, perché il consenso deve essere libero. Aggiornati FR-CON-01, gli AC collegati (AMM-01, AMM-02, VOL-01, VOL-02, SOS-03, SOS-07), FR-ADO-05, FR-BOT-04, DIP-14, il contratto con il bot e il modello dei dati. Nuovo Allegato I con la bozza del modulo; nuove domande nell’Allegato F. Notizie e newsletter passano in fase 1: una sezione “Notizie” nella vetrina, visibile dall’ospite in poi, con avvisi pubblicati dall’amministratore e collegamenti alle newsletter, che restano create e inviate da VERIF!CO (FR-INF-01, M2, nuova tabella `notizia`, route `/notizie`, riga nella matrice dei permessi). |


# Allegato F – Domande da fare all’associazione


Le domande al cliente reale e ai suoi consulenti, con risposta e data.

| Domanda | Risposta | Data |
| --- | --- | --- |
| Tutti i ~1.200 bambini hanno un sostenitore? |   |   |
| Esiste un elenco dei bambini con un codice? | No: in VERIF!CO ci sono i padrini, a volte con il nome del bambino nelle note; il collegamento è negli appunti cartacei della referente | 01/10/2026 |
| Quante famiglie seguite? Quanti bambini per famiglia in media? |   |   |
| Quanti iscritti ha oggi la newsletter in VERIF!CO? (cap. 3.1) |   |   |
| Su quale progetto e conto di VERIF!CO va la Cassa sostegno Effatà? (FR-INT-02) |   |   |
| Per quanto tempo si conservano i dati non fiscali di un account archiviato? (FR-ACC-02, fase 2) |   |   |
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
| Copia del modulo di consenso attuale (senza nomi). Viene firmato sempre o solo per le adozioni? Chi segue la privacy nell’associazione? La bozza bilingue con una casella per ogni scopo (Allegato I) va bene per la referente e per il referente privacy? Serve leggerlo a voce nella lingua locale davanti al testimone? (FR-CON-01, DIP-14) |   |   |
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
| Referente privacy: il modulo di consenso della famiglia cita anche l’elaborazione delle foto con un servizio di intelligenza artificiale (Anthropic, Stati Uniti)? Le condizioni del fornitore sui dati sono adeguate? (cap. 13.4, DIP-14) |   |   |
| Stripe 2026: i pagamenti che non tornano con i versamenti (probabili tentativi ripetuti) vanno verificati prima del caricamento in VERIF!CO |   |   |


# Allegato G – Ricerca: link e fonti


Le fonti consultate durante l’analisi.

| Argomento | Link / fonte | Cosa ho imparato |
| --- | --- | --- |
| VERIF!CO – caricamento massivo movimenti | supporto.veryfico.it (Menu Contabilità) | Tracciato master: campi obbligatori, IBAN_MITTENTE, ID_PROGETTO |
| VERIF!CO – sito | www.veryfico.it | VERIF!CO Maxi: contabilità per competenza, anagrafiche, newsletter e certificazioni annuali |
| Benchmark: Alice for Children (app MyAlice) | aliceforchildren.it | App per i sostenitori con scheda, foto e report del bambino e ricevute scaricabili (sintesi nell’Allegato H) |
| Benchmark: Ai.Bi. Amici dei Bambini | www.aibi.it | Area riservata sul sito e comunicazioni via email e WhatsApp |
| Bot Telegram esistente | bot.effataitalia.it | Funzioni e struttura attuali (docs/bot/TECHNICAL-INTEGRATION.md, verificato sul codice) |
| Sito dell’associazione | effataitalia.it | Esempi di costo delle voci fisse (animali, materassi), apprezzati dalla sostenitrice intervistata |
| Export estratto conto UniCredit (CSV/Excel) | Home banking UniCredit | Formato CSV/Excel, da verificare su una copia anonimizzata (DIP-01) |
| GDPR – categorie particolari (art. 9) e minori | Regolamento (UE) 2016/679, artt. 8 e 9 | I dati sanitari sono una categoria particolare: tabella separata e accesso solo all’amministratore (FR-RUO-02) |


# Allegato H – Brain dump iniziale


Il punto di partenza del progetto: l’intuizione iniziale, la prima bozza del flusso dei dati e il brain dump libero, riportati nella versione originale. Non fa parte del PRD da validare: è la traccia del metodo seguito (prima carta e penna, poi ricerca, poi AI).

## BD.1 L’intuizione da cui è partito tutto

> **Dalla bozza iniziale**
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

Il diagramma della bozza iniziale, così com’era; la versione definitiva è il diagramma dei componenti del cap. 10.1 del PRD.

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



## BD.3 Brain dump libero (testo originale)

*Testo originale di Andrea, riportato senza correzioni. Il materiale di ricerca incollato (documentazione VERIF!CO, Alice for Children) è riassunto e le fonti sono nell’Allegato G.*

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

ONG italiana con sostegni a distanza in Kenya. Offre ai donatori un’app personale in cui: vedere scheda, foto e storia del bambino; scambiare letterine, foto e video con il bambino; ricevere notifiche di report periodici (pagelle, progressi medici); scaricare le ricevute fiscali, rinnovare la quota e prenotare videochiamate. Citata anche Ai.Bi. (Amici dei Bambini), che usa un’area riservata sul sito e comunicazioni via email/WhatsApp. Da verificare direttamente sulle fonti (Allegato G).

## BD.4 Brain dump riordinato per temi e impatto sul PRD

Ogni idea del brain dump è stata assegnata a un tema e al capitolo del PRD della bozza di allora. Colonna Impatto: **Conferma** (già previsto), **Cambia** (il PRD attuale va modificato), **Nuovo** (non previsto), **Futuro** (candidato a “non incluso” / visione).

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

Affrontati uno alla volta fra il 24/09 e il 03/10/2026; le decisioni sono nei capitoli indicati del PRD (i numeri dei capitoli e delle storie sono quelli della bozza di allora).

- [x] Perimetro: cosa deve funzionare al collaudo ITS e cosa è visione futura → cap. 1.3, 17.2
- [x] Persone e ruoli reali: amministratori, volontari, soci, sostenitori, Silvia, tu → cap. 2, 3.3
- [x] Beneficiari e tipi di intervento: il modello concettuale → cap. 5, 12
- [x] Dall’estratto conto a VERIF!CO: formato della banca, IBAN, ID progetto → cap. 5.3, 5.5, 7
- [x] Rendicontazione e spese di progetto → cap. 5 (nuovo modulo)
- [x] Registrazione, consenso privacy e recupero dei sostenitori storici → cap. 5, 13.4, 19
- [x] Bot esistente: tecnologia attuale e cosa riusare → cap. 3.2, 9, 10
- [x] Area riservata: sito WordPress, web o app → cap. 9, 10
- [x] Comunicazione: chat e gruppo WhatsApp → cap. 1.3, 5.7
- [x] Privacy di minori e dati sanitari → cap. 13.4


# Allegato I – Modulo di consenso della famiglia (bozza)

Bozza del modulo previsto da FR-CON-01 e DIP-14, da confrontare con la referente in Uganda e da far verificare al referente privacy dell’associazione prima dell’uso. Un solo foglio per famiglia, in italiano e inglese; la referente lo spiega a voce nella lingua della famiglia, e se il genitore non sa leggere un testimone conferma che il modulo è stato letto. I campi tra parentesi quadre sono da completare.

| Italiano | English |
| --- | --- |
| **Modulo di consenso della famiglia – Effatà Italia ODV** | **Family consent form – Effatà Italia ODV** |
| **1. La famiglia** | **1. The family** |
| Nome del genitore o tutore: ______ | Name of parent or guardian: ______ |
| Rapporto con i bambini (madre, padre, nonna, tutore…): ______ | Relationship to the children (mother, father, grandmother, guardian…): ______ |
| Villaggio: ______ | Village: ______ |
| Nomi dei bambini: ______ (codici FAM e BAM compilati dall’associazione) | Children’s names: ______ (FAM and BAM codes filled in by the association) |
| **2. Chi siamo** | **2. Who we are** |
| Effatà Italia ODV, [indirizzo], è un’associazione di volontariato italiana che sostiene bambini e famiglie in Uganda con adozioni a distanza e aiuti concreti. È il titolare del trattamento dei dati. Contatto per la privacy: [email]. In Uganda la potete contattare tramite la referente dell’associazione, [nome]. | Effatà Italia ODV, [address], is an Italian voluntary association that supports children and families in Uganda through long-distance sponsorship and practical help. It is the data controller. Privacy contact: [email]. In Uganda you can reach it through the association’s local representative, [name]. |
| **3. Perché vi chiediamo il consenso** | **3. Why we ask for your consent** |
| Le persone che in Italia aiutano i vostri bambini desiderano sapere come stanno e vedere che l’aiuto è arrivato. Per questo raccogliamo foto, pagelle e notizie. Per ognuno dei punti qui sotto potete scegliere sì o no. **Dire no non cambia l’aiuto che la vostra famiglia riceve.** | The people in Italy who help your children want to know how they are and to see that the help has arrived. This is why we collect photos, school reports and news. For each point below you can choose yes or no. **Saying no does not change the help your family receives.** |
| **4. Le vostre scelte** | **4. Your choices** |
| ☐ Sì ☐ No – **Foto e notizie al sostenitore.** Foto, pagelle e notizie dei bambini sono visibili solo alla persona che li sostiene, nella sua area riservata del gestionale dell’associazione. | ☐ Yes ☐ No – **Photos and news for the sponsor.** Photos, school reports and news about the children can be seen only by the person who sponsors them, in their private area of the association’s management system. |
| ☐ Sì ☐ No – **Pubblicazione.** Foto e brevi storie dei bambini possono essere pubblicate nella vetrina del gestionale, sul sito dell’associazione e sulle sue pagine Facebook e Instagram, con il solo nome di battesimo e mai il villaggio esatto. | ☐ Yes ☐ No – **Publication.** Photos and short stories of the children may be published in the system’s showcase, on the association’s website and on its Facebook and Instagram pages, with the first name only and never the exact village. |
| ☐ Sì ☐ No – **Compleanno.** Il giorno e il mese di nascita (mai l’anno) vengono comunicati al sostenitore, che può mandare gli auguri tramite l’associazione. | ☐ Yes ☐ No – **Birthday.** The day and month of birth (never the year) are shared with the sponsor, who can send wishes through the association. |
| ☐ Sì ☐ No – **Informazioni sulla salute.** Notizie sulla salute dei bambini (per esempio un ricovero) sono conservate solo dall’associazione per organizzare gli aiuti; non vengono mai mostrate al sostenitore né pubblicate. | ☐ Yes ☐ No – **Health information.** News about the children’s health (for example a hospital stay) is kept only by the association to organise help; it is never shown to the sponsor or published. |
| **5. Dove vanno i dati** | **5. Where the data goes** |
| I dati sono conservati nel gestionale dell’associazione, su un server nell’Unione Europea (Francia). Le foto pubblicate vanno su Facebook e Instagram (Meta). Per preparare i testi dei post l’associazione usa un servizio di intelligenza artificiale (Anthropic, Stati Uniti), che legge foto e testi ma non riceve i dati dei sostenitori. I dati non vengono mai venduti né dati ad altri per pubblicità. | The data is stored in the association’s management system, on a server in the European Union (France). Published photos go to Facebook and Instagram (Meta). To prepare the text of posts the association uses an artificial intelligence service (Anthropic, United States), which reads photos and texts but receives no sponsor data. The data is never sold or given to others for advertising. |
| **6. Per quanto tempo** | **6. For how long** |
| Finché dura il sostegno ai vostri bambini e poi per [periodo da definire con il referente privacy]. Le foto pubblicate restano finché non chiedete di toglierle. | As long as your children are supported and then for [period to be defined with the privacy officer]. Published photos remain until you ask for them to be removed. |
| **7. I vostri diritti** | **7. Your rights** |
| Potete cambiare idea in qualsiasi momento, anche per un solo punto, dicendolo alla referente: la modifica vale subito, anche per le foto già caricate. Potete chiedere di vedere, correggere o cancellare i dati e fare reclamo al Garante per la protezione dei dati personali (Italia). | You can change your mind at any time, even for a single point, by telling the local representative: the change applies immediately, including to photos already uploaded. You can ask to see, correct or delete the data and complain to the Italian Data Protection Authority (Garante per la protezione dei dati personali). |
| **8. Firme** | **8. Signatures** |
| Firma o impronta del genitore o tutore: ______ Data: ______ | Signature or fingerprint of parent or guardian: ______ Date: ______ |
| Se impronta, nome e firma del testimone: ______ | If fingerprint, witness’s name and signature: ______ |
| Raccolto da (referente): ______ Data: ______ | Collected by (representative): ______ Date: ______ |
| Per i bambini della casa famiglia firma la referente, come tutrice. | For children in the children’s home, the representative signs as guardian. |

**Come si usa nel gestionale.** La referente fotografa il modulo firmato e lo manda su WhatsApp; l’originale resta a lei. L’amministratore lo carica nella scheda della famiglia e riporta le quattro caselle; il gestionale applica ogni scelta in automatico (FR-CON-01). Una revoca si registra allo stesso modo, con un nuovo modulo o una nota firmata.
