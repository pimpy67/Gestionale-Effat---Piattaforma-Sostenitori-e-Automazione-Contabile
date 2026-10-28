-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "public";

-- CreateEnum
CREATE TYPE "Ruolo" AS ENUM ('ospite', 'simpatizzante', 'sostenitore', 'volontario', 'amministratore', 'socio');

-- CreateEnum
CREATE TYPE "StatoUtente" AS ENUM ('attivo', 'disattivato', 'archiviato');

-- CreateEnum
CREATE TYPE "TipoSostenitore" AS ENUM ('persona', 'ente');

-- CreateEnum
CREATE TYPE "OrigineDato" AS ENUM ('autoregistrato', 'importato_verifico', 'inserito_amministratore', 'bot');

-- CreateEnum
CREATE TYPE "TipoConsenso" AS ENUM ('informativa_privacy', 'comunicazioni_novita', 'promemoria', 'newsletter', 'post_social');

-- CreateEnum
CREATE TYPE "StatoBambino" AS ENUM ('attivo', 'uscito');

-- CreateEnum
CREATE TYPE "VisibilitaContenuto" AS ENUM ('pubblica', 'riservata');

-- CreateEnum
CREATE TYPE "TipoContenuto" AS ENUM ('foto', 'pagella', 'notizia', 'documento');

-- CreateEnum
CREATE TYPE "TipoCategoria" AS ENUM ('richiesta_personale', 'voce_fissa', 'solo_social');

-- CreateEnum
CREATE TYPE "StatoRichiesta" AS ENUM ('bozza', 'aperta', 'sostenuta', 'chiusa');

-- CreateEnum
CREATE TYPE "StatoAdozione" AS ENUM ('attiva', 'chiusa');

-- CreateEnum
CREATE TYPE "StatoAnnualita" AS ENUM ('in_attesa', 'pagata', 'non_rinnovata');

-- CreateEnum
CREATE TYPE "StatoIntervento" AS ENUM ('pagato', 'in_corso', 'realizzato', 'rendicontato');

-- CreateEnum
CREATE TYPE "MetodoPagamento" AS ENUM ('carta', 'satispay', 'bonifico', 'bonifico_ricorrente', 'contanti', 'altro');

-- CreateEnum
CREATE TYPE "CanaleDonazione" AS ENUM ('gestionale', 'calendario_solidale', 'raccolta_esterna', 'storico');

-- CreateEnum
CREATE TYPE "StatoDonazione" AS ENUM ('impegno', 'dichiarata', 'confermata', 'annullata');

-- CreateEnum
CREATE TYPE "StatoCredito" AS ENUM ('attivo', 'usato', 'scaduto');

-- CreateEnum
CREATE TYPE "StatoRigaEstratto" AS ENUM ('da_abbinare', 'abbinata', 'ignorata');

-- CreateEnum
CREATE TYPE "StatoEsportazione" AS ENUM ('generata', 'caricata');

-- CreateEnum
CREATE TYPE "TipoInvioBot" AS ENUM ('richiesta_aiuto', 'aiuto_consegnato', 'aggiornamento');

-- CreateEnum
CREATE TYPE "EsitoInvioBot" AS ENUM ('ricevuto', 'elaborato', 'rifiutato');

-- CreateEnum
CREATE TYPE "StatoEmail" AS ENUM ('in_coda', 'inviata', 'errore');

-- CreateEnum
CREATE TYPE "StatoSegnalazione" AS ENUM ('aperta', 'chiusa');

-- CreateTable
CREATE TABLE "utente" (
    "id" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "hash_password" TEXT NOT NULL,
    "stato" "StatoUtente" NOT NULL DEFAULT 'attivo',
    "totp_segreto" TEXT,
    "telegram_id" TEXT,
    "ultimo_accesso_il" TIMESTAMPTZ(6),
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "utente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ruolo_utente" (
    "id" UUID NOT NULL,
    "utente_id" UUID NOT NULL,
    "ruolo" "Ruolo" NOT NULL,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "ruolo_utente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permesso_volontario" (
    "id" UUID NOT NULL,
    "utente_id" UUID NOT NULL,
    "azione" TEXT NOT NULL,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "permesso_volontario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ospite" (
    "id" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "informativa_versione" TEXT NOT NULL,
    "informativa_letta_il" TIMESTAMPTZ(6) NOT NULL,
    "scade_il" TIMESTAMPTZ(6) NOT NULL,
    "utente_id" UUID,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "ospite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sostenitore" (
    "id" UUID NOT NULL,
    "utente_id" UUID,
    "tipo" "TipoSostenitore" NOT NULL DEFAULT 'persona',
    "nome" TEXT,
    "cognome" TEXT,
    "ragione_sociale" TEXT,
    "codice_fiscale" TEXT,
    "email" TEXT NOT NULL,
    "telefono" TEXT,
    "provincia" TEXT,
    "avente_diritto_nome" TEXT,
    "avente_diritto_cognome" TEXT,
    "avente_diritto_cf" TEXT,
    "opposizione_agenzia_entrate" BOOLEAN NOT NULL DEFAULT false,
    "id_verifico" TEXT,
    "origine" "OrigineDato" NOT NULL DEFAULT 'autoregistrato',
    "padrino_storico" BOOLEAN NOT NULL DEFAULT false,
    "indizi_recupero" TEXT,
    "archiviato_il" TIMESTAMPTZ(6),
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "sostenitore_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "iban_sostenitore" (
    "id" UUID NOT NULL,
    "sostenitore_id" UUID NOT NULL,
    "iban" TEXT NOT NULL,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "iban_sostenitore_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consenso" (
    "id" UUID NOT NULL,
    "utente_id" UUID,
    "sostenitore_id" UUID,
    "ospite_id" UUID,
    "tipo" "TipoConsenso" NOT NULL,
    "informativa_versione" TEXT,
    "dato_il" TIMESTAMPTZ(6) NOT NULL,
    "revocato_il" TIMESTAMPTZ(6),
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "consenso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "famiglia" (
    "id" UUID NOT NULL,
    "codice" TEXT,
    "genitore_tutore" TEXT NOT NULL,
    "villaggio" TEXT NOT NULL,
    "distretto" TEXT NOT NULL,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "famiglia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "modulo_consenso" (
    "id" UUID NOT NULL,
    "famiglia_id" UUID NOT NULL,
    "firmato_il" DATE NOT NULL,
    "raccolto_da" TEXT NOT NULL,
    "percorso_file" TEXT NOT NULL,
    "consenso_padrino" BOOLEAN NOT NULL DEFAULT false,
    "consenso_pubblicazione" BOOLEAN NOT NULL DEFAULT false,
    "consenso_compleanno" BOOLEAN NOT NULL DEFAULT false,
    "consenso_salute" BOOLEAN NOT NULL DEFAULT false,
    "revoca_padrino_il" TIMESTAMPTZ(6),
    "revoca_pubblicazione_il" TIMESTAMPTZ(6),
    "revoca_compleanno_il" TIMESTAMPTZ(6),
    "revoca_salute_il" TIMESTAMPTZ(6),
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "modulo_consenso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bambino" (
    "id" UUID NOT NULL,
    "codice" TEXT,
    "famiglia_id" UUID NOT NULL,
    "nome" TEXT NOT NULL,
    "cognome" TEXT,
    "data_nascita" DATE NOT NULL,
    "villaggio" TEXT NOT NULL,
    "scuola" TEXT,
    "classe" TEXT,
    "storia" TEXT,
    "stato" "StatoBambino" NOT NULL DEFAULT 'attivo',
    "uscito_il" DATE,
    "motivo_uscita" TEXT,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "bambino_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dato_sanitario" (
    "id" UUID NOT NULL,
    "bambino_id" UUID NOT NULL,
    "testo" TEXT NOT NULL,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "dato_sanitario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contenuto" (
    "id" UUID NOT NULL,
    "bambino_id" UUID,
    "famiglia_id" UUID,
    "prova_id" UUID,
    "invio_bot_id" UUID,
    "autore_id" UUID NOT NULL,
    "tipo" "TipoContenuto" NOT NULL,
    "visibilita" "VisibilitaContenuto" NOT NULL DEFAULT 'riservata',
    "testo_referente" TEXT,
    "percorso_file" TEXT,
    "ordine" INTEGER NOT NULL DEFAULT 0,
    "nascosto" BOOLEAN NOT NULL DEFAULT false,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "contenuto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "adozione" (
    "id" UUID NOT NULL,
    "sostenitore_id" UUID NOT NULL,
    "bambino_id" UUID NOT NULL,
    "richiesta_id" UUID,
    "importo_annuale_centesimi" INTEGER NOT NULL,
    "inizio" DATE NOT NULL,
    "fine" DATE,
    "motivo_chiusura" TEXT,
    "stato" "StatoAdozione" NOT NULL DEFAULT 'attiva',
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "adozione_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "annualita_adozione" (
    "id" UUID NOT NULL,
    "adozione_id" UUID NOT NULL,
    "anno" INTEGER NOT NULL,
    "importo_centesimi" INTEGER NOT NULL,
    "stato" "StatoAnnualita" NOT NULL DEFAULT 'in_attesa',
    "promemoria_inviati" INTEGER NOT NULL DEFAULT 0,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "annualita_adozione_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "capitolo" (
    "id" UUID NOT NULL,
    "nome" TEXT NOT NULL,
    "id_progetto_verifico" TEXT,
    "obiettivo_annuale_centesimi" INTEGER,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "capitolo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "raccolta_fondi" (
    "id" UUID NOT NULL,
    "capitolo_id" UUID NOT NULL,
    "nome" TEXT NOT NULL,
    "id_raccoltafondi_verifico" TEXT,
    "inizio" DATE,
    "fine" DATE,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "raccolta_fondi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categoria" (
    "id" UUID NOT NULL,
    "capitolo_id" UUID NOT NULL,
    "nome" TEXT NOT NULL,
    "tipo" "TipoCategoria" NOT NULL,
    "gruppo" TEXT,
    "costo_listino_centesimi" INTEGER,
    "in_vetrina" BOOLEAN NOT NULL DEFAULT true,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "categoria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "voce_checklist" (
    "id" UUID NOT NULL,
    "categoria_id" UUID NOT NULL,
    "nome" TEXT NOT NULL,
    "ordine" INTEGER NOT NULL DEFAULT 0,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "voce_checklist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "richiesta" (
    "id" UUID NOT NULL,
    "codice" TEXT,
    "categoria_id" UUID NOT NULL,
    "bambino_id" UUID,
    "famiglia_id" UUID,
    "titolo" TEXT NOT NULL,
    "storia" TEXT NOT NULL,
    "costo_centesimi" INTEGER NOT NULL,
    "stato" "StatoRichiesta" NOT NULL DEFAULT 'bozza',
    "approvata_il" TIMESTAMPTZ(6),
    "sostenuta_il" TIMESTAMPTZ(6),
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "richiesta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "foto_richiesta" (
    "id" UUID NOT NULL,
    "richiesta_id" UUID NOT NULL,
    "contenuto_id" UUID NOT NULL,
    "ordine" INTEGER NOT NULL DEFAULT 0,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "foto_richiesta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "intervento" (
    "id" UUID NOT NULL,
    "categoria_id" UUID NOT NULL,
    "richiesta_id" UUID,
    "bambino_id" UUID,
    "famiglia_id" UUID,
    "costo_centesimi" INTEGER NOT NULL,
    "stato" "StatoIntervento" NOT NULL DEFAULT 'pagato',
    "presa_in_carico_da" UUID,
    "presa_in_carico_il" TIMESTAMPTZ(6),
    "rendicontato_il" TIMESTAMPTZ(6),
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "intervento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "prova" (
    "id" UUID NOT NULL,
    "intervento_id" UUID NOT NULL,
    "voce_checklist_id" UUID NOT NULL,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "prova_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "notizia" (
    "id" UUID NOT NULL,
    "autore_id" UUID NOT NULL,
    "titolo" TEXT NOT NULL,
    "testo" TEXT NOT NULL,
    "link_newsletter" TEXT,
    "pubblicata_il" TIMESTAMPTZ(6) NOT NULL,
    "fine_il" TIMESTAMPTZ(6),
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "notizia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "carrello" (
    "id" UUID NOT NULL,
    "utente_id" UUID,
    "ospite_id" UUID,
    "richiesta_id" UUID,
    "categoria_id" UUID,
    "importo_centesimi" INTEGER NOT NULL,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "carrello_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "preferito" (
    "id" UUID NOT NULL,
    "utente_id" UUID,
    "ospite_id" UUID,
    "richiesta_id" UUID,
    "categoria_id" UUID,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "preferito_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "donazione" (
    "id" UUID NOT NULL,
    "sostenitore_id" UUID NOT NULL,
    "importo_centesimi" INTEGER NOT NULL,
    "metodo" "MetodoPagamento" NOT NULL,
    "canale" "CanaleDonazione" NOT NULL DEFAULT 'gestionale',
    "stato" "StatoDonazione" NOT NULL,
    "motivo_annullamento" TEXT,
    "pagata_il" TIMESTAMPTZ(6) NOT NULL,
    "confermata_il" TIMESTAMPTZ(6),
    "stripe_id" TEXT,
    "causale" VARCHAR(140),
    "avente_diritto_nome" TEXT,
    "avente_diritto_cognome" TEXT,
    "avente_diritto_cf" TEXT,
    "riga_estratto_id" UUID,
    "versamento_stripe_id" UUID,
    "esportazione_verifico_id" UUID,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "donazione_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quota_donazione" (
    "id" UUID NOT NULL,
    "donazione_id" UUID NOT NULL,
    "capitolo_id" UUID NOT NULL,
    "richiesta_id" UUID,
    "intervento_id" UUID,
    "annualita_adozione_id" UUID,
    "categoria_id" UUID,
    "raccolta_fondi_id" UUID,
    "importo_centesimi" INTEGER NOT NULL,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "quota_donazione_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quietanza" (
    "id" UUID NOT NULL,
    "donazione_id" UUID NOT NULL,
    "percorso_file" TEXT NOT NULL,
    "importo_centesimi" INTEGER NOT NULL,
    "data_bonifico" DATE NOT NULL,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "quietanza_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "credito_solidale" (
    "id" UUID NOT NULL,
    "donazione_id" UUID NOT NULL,
    "categoria_id" UUID NOT NULL,
    "importo_centesimi" INTEGER NOT NULL,
    "scade_il" TIMESTAMPTZ(6) NOT NULL,
    "stato" "StatoCredito" NOT NULL DEFAULT 'attivo',
    "richiesta_utilizzo_id" UUID,
    "usato_il" TIMESTAMPTZ(6),
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "credito_solidale_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "estratto_conto" (
    "id" UUID NOT NULL,
    "nome_file" TEXT NOT NULL,
    "impronta_file" TEXT NOT NULL,
    "periodo_dal" DATE NOT NULL,
    "periodo_al" DATE NOT NULL,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "estratto_conto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "riga_estratto" (
    "id" UUID NOT NULL,
    "estratto_conto_id" UUID NOT NULL,
    "impronta" TEXT NOT NULL,
    "data_operazione" DATE NOT NULL,
    "importo_centesimi" INTEGER NOT NULL,
    "ordinante" TEXT,
    "iban_ordinante" TEXT,
    "causale" TEXT,
    "stato" "StatoRigaEstratto" NOT NULL DEFAULT 'da_abbinare',
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "riga_estratto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "esportazione_verifico" (
    "id" UUID NOT NULL,
    "mese" DATE NOT NULL,
    "totale_centesimi" INTEGER NOT NULL,
    "file_generati" JSONB NOT NULL,
    "stato" "StatoEsportazione" NOT NULL DEFAULT 'generata',
    "caricata_il" TIMESTAMPTZ(6),
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "esportazione_verifico_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "invio_bot" (
    "id" UUID NOT NULL,
    "chiave_invio" TEXT NOT NULL,
    "volontario_id" UUID NOT NULL,
    "tipo" "TipoInvioBot" NOT NULL,
    "esito" "EsitoInvioBot" NOT NULL DEFAULT 'ricevuto',
    "motivo_rifiuto" TEXT,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "invio_bot_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "registro_modifiche" (
    "id" UUID NOT NULL,
    "utente_id" UUID NOT NULL,
    "tabella" TEXT NOT NULL,
    "record_id" UUID NOT NULL,
    "campo" TEXT,
    "valore_precedente" TEXT,
    "valore_nuovo" TEXT,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "registro_modifiche_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "impostazione" (
    "id" UUID NOT NULL,
    "chiave" TEXT NOT NULL,
    "valore" JSONB NOT NULL,
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "impostazione_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "email_inviata" (
    "id" UUID NOT NULL,
    "sostenitore_id" UUID,
    "ospite_id" UUID,
    "indirizzo" TEXT NOT NULL,
    "modello" TEXT NOT NULL,
    "stato" "StatoEmail" NOT NULL DEFAULT 'in_coda',
    "tentativi" INTEGER NOT NULL DEFAULT 0,
    "inviata_il" TIMESTAMPTZ(6),
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "email_inviata_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "segnalazione" (
    "id" UUID NOT NULL,
    "tipo" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "tabella" TEXT,
    "record_id" UUID,
    "stato" "StatoSegnalazione" NOT NULL DEFAULT 'aperta',
    "chiusa_il" TIMESTAMPTZ(6),
    "creato_il" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aggiornato_il" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "segnalazione_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "utente_email_key" ON "utente"("email");

-- CreateIndex
CREATE UNIQUE INDEX "utente_telegram_id_key" ON "utente"("telegram_id");

-- CreateIndex
CREATE UNIQUE INDEX "ruolo_utente_utente_id_ruolo_key" ON "ruolo_utente"("utente_id", "ruolo");

-- CreateIndex
CREATE UNIQUE INDEX "permesso_volontario_utente_id_azione_key" ON "permesso_volontario"("utente_id", "azione");

-- CreateIndex
CREATE UNIQUE INDEX "ospite_utente_id_key" ON "ospite"("utente_id");

-- CreateIndex
CREATE INDEX "ospite_email_idx" ON "ospite"("email");

-- CreateIndex
CREATE UNIQUE INDEX "sostenitore_utente_id_key" ON "sostenitore"("utente_id");

-- CreateIndex
CREATE UNIQUE INDEX "sostenitore_email_key" ON "sostenitore"("email");

-- CreateIndex
CREATE UNIQUE INDEX "sostenitore_id_verifico_key" ON "sostenitore"("id_verifico");

-- CreateIndex
CREATE INDEX "sostenitore_codice_fiscale_idx" ON "sostenitore"("codice_fiscale");

-- CreateIndex
CREATE INDEX "iban_sostenitore_iban_idx" ON "iban_sostenitore"("iban");

-- CreateIndex
CREATE UNIQUE INDEX "iban_sostenitore_sostenitore_id_iban_key" ON "iban_sostenitore"("sostenitore_id", "iban");

-- CreateIndex
CREATE UNIQUE INDEX "famiglia_codice_key" ON "famiglia"("codice");

-- CreateIndex
CREATE UNIQUE INDEX "bambino_codice_key" ON "bambino"("codice");

-- CreateIndex
CREATE INDEX "bambino_famiglia_id_idx" ON "bambino"("famiglia_id");

-- CreateIndex
CREATE INDEX "contenuto_bambino_id_idx" ON "contenuto"("bambino_id");

-- CreateIndex
CREATE INDEX "contenuto_famiglia_id_idx" ON "contenuto"("famiglia_id");

-- CreateIndex
CREATE UNIQUE INDEX "adozione_richiesta_id_key" ON "adozione"("richiesta_id");

-- CreateIndex
CREATE INDEX "adozione_sostenitore_id_idx" ON "adozione"("sostenitore_id");

-- CreateIndex
CREATE UNIQUE INDEX "annualita_adozione_adozione_id_anno_key" ON "annualita_adozione"("adozione_id", "anno");

-- CreateIndex
CREATE UNIQUE INDEX "capitolo_nome_key" ON "capitolo"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "categoria_nome_key" ON "categoria"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "voce_checklist_categoria_id_nome_key" ON "voce_checklist"("categoria_id", "nome");

-- CreateIndex
CREATE UNIQUE INDEX "richiesta_codice_key" ON "richiesta"("codice");

-- CreateIndex
CREATE INDEX "richiesta_stato_idx" ON "richiesta"("stato");

-- CreateIndex
CREATE UNIQUE INDEX "foto_richiesta_richiesta_id_contenuto_id_key" ON "foto_richiesta"("richiesta_id", "contenuto_id");

-- CreateIndex
CREATE UNIQUE INDEX "intervento_richiesta_id_key" ON "intervento"("richiesta_id");

-- CreateIndex
CREATE INDEX "intervento_stato_idx" ON "intervento"("stato");

-- CreateIndex
CREATE UNIQUE INDEX "prova_intervento_id_voce_checklist_id_key" ON "prova"("intervento_id", "voce_checklist_id");

-- CreateIndex
CREATE UNIQUE INDEX "donazione_stripe_id_key" ON "donazione"("stripe_id");

-- CreateIndex
CREATE UNIQUE INDEX "donazione_riga_estratto_id_key" ON "donazione"("riga_estratto_id");

-- CreateIndex
CREATE INDEX "donazione_stato_pagata_il_idx" ON "donazione"("stato", "pagata_il");

-- CreateIndex
CREATE INDEX "donazione_sostenitore_id_idx" ON "donazione"("sostenitore_id");

-- CreateIndex
CREATE INDEX "quota_donazione_donazione_id_idx" ON "quota_donazione"("donazione_id");

-- CreateIndex
CREATE INDEX "quota_donazione_intervento_id_idx" ON "quota_donazione"("intervento_id");

-- CreateIndex
CREATE UNIQUE INDEX "quietanza_donazione_id_key" ON "quietanza"("donazione_id");

-- CreateIndex
CREATE UNIQUE INDEX "credito_solidale_donazione_id_key" ON "credito_solidale"("donazione_id");

-- CreateIndex
CREATE UNIQUE INDEX "credito_solidale_richiesta_utilizzo_id_key" ON "credito_solidale"("richiesta_utilizzo_id");

-- CreateIndex
CREATE INDEX "credito_solidale_stato_scade_il_idx" ON "credito_solidale"("stato", "scade_il");

-- CreateIndex
CREATE UNIQUE INDEX "estratto_conto_impronta_file_key" ON "estratto_conto"("impronta_file");

-- CreateIndex
CREATE UNIQUE INDEX "riga_estratto_impronta_key" ON "riga_estratto"("impronta");

-- CreateIndex
CREATE UNIQUE INDEX "esportazione_verifico_mese_key" ON "esportazione_verifico"("mese");

-- CreateIndex
CREATE UNIQUE INDEX "invio_bot_chiave_invio_key" ON "invio_bot"("chiave_invio");

-- CreateIndex
CREATE INDEX "registro_modifiche_tabella_record_id_idx" ON "registro_modifiche"("tabella", "record_id");

-- CreateIndex
CREATE UNIQUE INDEX "impostazione_chiave_key" ON "impostazione"("chiave");

-- CreateIndex
CREATE INDEX "segnalazione_stato_idx" ON "segnalazione"("stato");

-- AddForeignKey
ALTER TABLE "ruolo_utente" ADD CONSTRAINT "ruolo_utente_utente_id_fkey" FOREIGN KEY ("utente_id") REFERENCES "utente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permesso_volontario" ADD CONSTRAINT "permesso_volontario_utente_id_fkey" FOREIGN KEY ("utente_id") REFERENCES "utente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ospite" ADD CONSTRAINT "ospite_utente_id_fkey" FOREIGN KEY ("utente_id") REFERENCES "utente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sostenitore" ADD CONSTRAINT "sostenitore_utente_id_fkey" FOREIGN KEY ("utente_id") REFERENCES "utente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "iban_sostenitore" ADD CONSTRAINT "iban_sostenitore_sostenitore_id_fkey" FOREIGN KEY ("sostenitore_id") REFERENCES "sostenitore"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "consenso" ADD CONSTRAINT "consenso_utente_id_fkey" FOREIGN KEY ("utente_id") REFERENCES "utente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "consenso" ADD CONSTRAINT "consenso_sostenitore_id_fkey" FOREIGN KEY ("sostenitore_id") REFERENCES "sostenitore"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "consenso" ADD CONSTRAINT "consenso_ospite_id_fkey" FOREIGN KEY ("ospite_id") REFERENCES "ospite"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "modulo_consenso" ADD CONSTRAINT "modulo_consenso_famiglia_id_fkey" FOREIGN KEY ("famiglia_id") REFERENCES "famiglia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bambino" ADD CONSTRAINT "bambino_famiglia_id_fkey" FOREIGN KEY ("famiglia_id") REFERENCES "famiglia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dato_sanitario" ADD CONSTRAINT "dato_sanitario_bambino_id_fkey" FOREIGN KEY ("bambino_id") REFERENCES "bambino"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contenuto" ADD CONSTRAINT "contenuto_bambino_id_fkey" FOREIGN KEY ("bambino_id") REFERENCES "bambino"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contenuto" ADD CONSTRAINT "contenuto_famiglia_id_fkey" FOREIGN KEY ("famiglia_id") REFERENCES "famiglia"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contenuto" ADD CONSTRAINT "contenuto_prova_id_fkey" FOREIGN KEY ("prova_id") REFERENCES "prova"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contenuto" ADD CONSTRAINT "contenuto_invio_bot_id_fkey" FOREIGN KEY ("invio_bot_id") REFERENCES "invio_bot"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contenuto" ADD CONSTRAINT "contenuto_autore_id_fkey" FOREIGN KEY ("autore_id") REFERENCES "utente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "adozione" ADD CONSTRAINT "adozione_sostenitore_id_fkey" FOREIGN KEY ("sostenitore_id") REFERENCES "sostenitore"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "adozione" ADD CONSTRAINT "adozione_bambino_id_fkey" FOREIGN KEY ("bambino_id") REFERENCES "bambino"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "adozione" ADD CONSTRAINT "adozione_richiesta_id_fkey" FOREIGN KEY ("richiesta_id") REFERENCES "richiesta"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "annualita_adozione" ADD CONSTRAINT "annualita_adozione_adozione_id_fkey" FOREIGN KEY ("adozione_id") REFERENCES "adozione"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "raccolta_fondi" ADD CONSTRAINT "raccolta_fondi_capitolo_id_fkey" FOREIGN KEY ("capitolo_id") REFERENCES "capitolo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categoria" ADD CONSTRAINT "categoria_capitolo_id_fkey" FOREIGN KEY ("capitolo_id") REFERENCES "capitolo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "voce_checklist" ADD CONSTRAINT "voce_checklist_categoria_id_fkey" FOREIGN KEY ("categoria_id") REFERENCES "categoria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "richiesta" ADD CONSTRAINT "richiesta_categoria_id_fkey" FOREIGN KEY ("categoria_id") REFERENCES "categoria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "richiesta" ADD CONSTRAINT "richiesta_bambino_id_fkey" FOREIGN KEY ("bambino_id") REFERENCES "bambino"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "richiesta" ADD CONSTRAINT "richiesta_famiglia_id_fkey" FOREIGN KEY ("famiglia_id") REFERENCES "famiglia"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "foto_richiesta" ADD CONSTRAINT "foto_richiesta_richiesta_id_fkey" FOREIGN KEY ("richiesta_id") REFERENCES "richiesta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "foto_richiesta" ADD CONSTRAINT "foto_richiesta_contenuto_id_fkey" FOREIGN KEY ("contenuto_id") REFERENCES "contenuto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "intervento" ADD CONSTRAINT "intervento_categoria_id_fkey" FOREIGN KEY ("categoria_id") REFERENCES "categoria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "intervento" ADD CONSTRAINT "intervento_richiesta_id_fkey" FOREIGN KEY ("richiesta_id") REFERENCES "richiesta"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "intervento" ADD CONSTRAINT "intervento_bambino_id_fkey" FOREIGN KEY ("bambino_id") REFERENCES "bambino"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "intervento" ADD CONSTRAINT "intervento_famiglia_id_fkey" FOREIGN KEY ("famiglia_id") REFERENCES "famiglia"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "intervento" ADD CONSTRAINT "intervento_presa_in_carico_da_fkey" FOREIGN KEY ("presa_in_carico_da") REFERENCES "utente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "prova" ADD CONSTRAINT "prova_intervento_id_fkey" FOREIGN KEY ("intervento_id") REFERENCES "intervento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "prova" ADD CONSTRAINT "prova_voce_checklist_id_fkey" FOREIGN KEY ("voce_checklist_id") REFERENCES "voce_checklist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notizia" ADD CONSTRAINT "notizia_autore_id_fkey" FOREIGN KEY ("autore_id") REFERENCES "utente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "carrello" ADD CONSTRAINT "carrello_utente_id_fkey" FOREIGN KEY ("utente_id") REFERENCES "utente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "carrello" ADD CONSTRAINT "carrello_ospite_id_fkey" FOREIGN KEY ("ospite_id") REFERENCES "ospite"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "carrello" ADD CONSTRAINT "carrello_richiesta_id_fkey" FOREIGN KEY ("richiesta_id") REFERENCES "richiesta"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "carrello" ADD CONSTRAINT "carrello_categoria_id_fkey" FOREIGN KEY ("categoria_id") REFERENCES "categoria"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "preferito" ADD CONSTRAINT "preferito_utente_id_fkey" FOREIGN KEY ("utente_id") REFERENCES "utente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "preferito" ADD CONSTRAINT "preferito_ospite_id_fkey" FOREIGN KEY ("ospite_id") REFERENCES "ospite"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "preferito" ADD CONSTRAINT "preferito_richiesta_id_fkey" FOREIGN KEY ("richiesta_id") REFERENCES "richiesta"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "preferito" ADD CONSTRAINT "preferito_categoria_id_fkey" FOREIGN KEY ("categoria_id") REFERENCES "categoria"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "donazione" ADD CONSTRAINT "donazione_sostenitore_id_fkey" FOREIGN KEY ("sostenitore_id") REFERENCES "sostenitore"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "donazione" ADD CONSTRAINT "donazione_riga_estratto_id_fkey" FOREIGN KEY ("riga_estratto_id") REFERENCES "riga_estratto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "donazione" ADD CONSTRAINT "donazione_versamento_stripe_id_fkey" FOREIGN KEY ("versamento_stripe_id") REFERENCES "riga_estratto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "donazione" ADD CONSTRAINT "donazione_esportazione_verifico_id_fkey" FOREIGN KEY ("esportazione_verifico_id") REFERENCES "esportazione_verifico"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quota_donazione" ADD CONSTRAINT "quota_donazione_donazione_id_fkey" FOREIGN KEY ("donazione_id") REFERENCES "donazione"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quota_donazione" ADD CONSTRAINT "quota_donazione_capitolo_id_fkey" FOREIGN KEY ("capitolo_id") REFERENCES "capitolo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quota_donazione" ADD CONSTRAINT "quota_donazione_richiesta_id_fkey" FOREIGN KEY ("richiesta_id") REFERENCES "richiesta"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quota_donazione" ADD CONSTRAINT "quota_donazione_intervento_id_fkey" FOREIGN KEY ("intervento_id") REFERENCES "intervento"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quota_donazione" ADD CONSTRAINT "quota_donazione_annualita_adozione_id_fkey" FOREIGN KEY ("annualita_adozione_id") REFERENCES "annualita_adozione"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quota_donazione" ADD CONSTRAINT "quota_donazione_categoria_id_fkey" FOREIGN KEY ("categoria_id") REFERENCES "categoria"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quota_donazione" ADD CONSTRAINT "quota_donazione_raccolta_fondi_id_fkey" FOREIGN KEY ("raccolta_fondi_id") REFERENCES "raccolta_fondi"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quietanza" ADD CONSTRAINT "quietanza_donazione_id_fkey" FOREIGN KEY ("donazione_id") REFERENCES "donazione"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "credito_solidale" ADD CONSTRAINT "credito_solidale_donazione_id_fkey" FOREIGN KEY ("donazione_id") REFERENCES "donazione"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "credito_solidale" ADD CONSTRAINT "credito_solidale_categoria_id_fkey" FOREIGN KEY ("categoria_id") REFERENCES "categoria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "credito_solidale" ADD CONSTRAINT "credito_solidale_richiesta_utilizzo_id_fkey" FOREIGN KEY ("richiesta_utilizzo_id") REFERENCES "richiesta"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "riga_estratto" ADD CONSTRAINT "riga_estratto_estratto_conto_id_fkey" FOREIGN KEY ("estratto_conto_id") REFERENCES "estratto_conto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "invio_bot" ADD CONSTRAINT "invio_bot_volontario_id_fkey" FOREIGN KEY ("volontario_id") REFERENCES "utente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registro_modifiche" ADD CONSTRAINT "registro_modifiche_utente_id_fkey" FOREIGN KEY ("utente_id") REFERENCES "utente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "email_inviata" ADD CONSTRAINT "email_inviata_sostenitore_id_fkey" FOREIGN KEY ("sostenitore_id") REFERENCES "sostenitore"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "email_inviata" ADD CONSTRAINT "email_inviata_ospite_id_fkey" FOREIGN KEY ("ospite_id") REFERENCES "ospite"("id") ON DELETE SET NULL ON UPDATE CASCADE;


-- =============================================================
-- Vincoli che Prisma non sa esprimere (PRD v3.0, cap. 12)
-- =============================================================

-- "Uno e uno solo": due o più chiavi esterne facoltative, una sola valorizzata (cap. 12.2)
ALTER TABLE "consenso"      ADD CONSTRAINT "consenso_un_titolare"       CHECK (num_nonnulls("utente_id", "sostenitore_id", "ospite_id") = 1);
ALTER TABLE "contenuto"     ADD CONSTRAINT "contenuto_un_titolare"      CHECK (num_nonnulls("bambino_id", "famiglia_id") = 1);
ALTER TABLE "richiesta"     ADD CONSTRAINT "richiesta_un_beneficiario"  CHECK (num_nonnulls("bambino_id", "famiglia_id") = 1);
ALTER TABLE "intervento"    ADD CONSTRAINT "intervento_un_beneficiario" CHECK (num_nonnulls("bambino_id", "famiglia_id") = 1);
ALTER TABLE "carrello"      ADD CONSTRAINT "carrello_un_proprietario"   CHECK (num_nonnulls("utente_id", "ospite_id") = 1);
ALTER TABLE "carrello"      ADD CONSTRAINT "carrello_una_voce"          CHECK (num_nonnulls("richiesta_id", "categoria_id") = 1);
ALTER TABLE "preferito"     ADD CONSTRAINT "preferito_un_proprietario"  CHECK (num_nonnulls("utente_id", "ospite_id") = 1);
ALTER TABLE "preferito"     ADD CONSTRAINT "preferito_una_voce"         CHECK (num_nonnulls("richiesta_id", "categoria_id") = 1);
ALTER TABLE "email_inviata" ADD CONSTRAINT "email_un_destinatario"      CHECK (num_nonnulls("sostenitore_id", "ospite_id") = 1);

-- Al massimo un'adozione attiva per bambino (FR-ADO-01)
CREATE UNIQUE INDEX "adozione_una_attiva_per_bambino" ON "adozione" ("bambino_id") WHERE "stato" = 'attiva';

-- Importi in centesimi: mai negativi né nulli (cap. 12.4)
ALTER TABLE "donazione"          ADD CONSTRAINT "donazione_importo_positivo"  CHECK ("importo_centesimi" > 0);
ALTER TABLE "quota_donazione"    ADD CONSTRAINT "quota_importo_positivo"      CHECK ("importo_centesimi" > 0);
ALTER TABLE "annualita_adozione" ADD CONSTRAINT "annualita_importo_positivo"  CHECK ("importo_centesimi" > 0);
ALTER TABLE "adozione"           ADD CONSTRAINT "adozione_importo_positivo"   CHECK ("importo_annuale_centesimi" > 0);
ALTER TABLE "credito_solidale"   ADD CONSTRAINT "credito_importo_positivo"    CHECK ("importo_centesimi" > 0);
ALTER TABLE "carrello"           ADD CONSTRAINT "carrello_importo_positivo"   CHECK ("importo_centesimi" > 0);
ALTER TABLE "quietanza"          ADD CONSTRAINT "quietanza_importo_positivo"  CHECK ("importo_centesimi" > 0);
ALTER TABLE "richiesta"          ADD CONSTRAINT "richiesta_costo_positivo"    CHECK ("costo_centesimi" > 0);
ALTER TABLE "intervento"         ADD CONSTRAINT "intervento_costo_positivo"   CHECK ("costo_centesimi" > 0);
ALTER TABLE "categoria"          ADD CONSTRAINT "categoria_listino_positivo"  CHECK ("costo_listino_centesimi" IS NULL OR "costo_listino_centesimi" > 0);

-- Coerenza di date e stati
ALTER TABLE "adozione"           ADD CONSTRAINT "adozione_date_coerenti"   CHECK ("fine" IS NULL OR "fine" >= "inizio");
ALTER TABLE "adozione"           ADD CONSTRAINT "adozione_chiusa_con_data" CHECK ("stato" <> 'chiusa' OR ("fine" IS NOT NULL AND "motivo_chiusura" IS NOT NULL));
ALTER TABLE "annualita_adozione" ADD CONSTRAINT "annualita_anno_valido"    CHECK ("anno" BETWEEN 2000 AND 2100);
ALTER TABLE "donazione"          ADD CONSTRAINT "donazione_annullata_con_motivo" CHECK ("stato" <> 'annullata' OR "motivo_annullamento" IS NOT NULL);
ALTER TABLE "credito_solidale"   ADD CONSTRAINT "credito_usato_con_richiesta"    CHECK ("stato" <> 'usato' OR "richiesta_utilizzo_id" IS NOT NULL);
ALTER TABLE "bambino"            ADD CONSTRAINT "bambino_uscito_con_data"  CHECK ("stato" <> 'uscito' OR "uscito_il" IS NOT NULL);

-- Codici di business BAM, FAM, RIC: progressivi, mai cambiati né riusati (FR-COD-01, cap. 12.3)
CREATE SEQUENCE "seq_codice_famiglia";
CREATE SEQUENCE "seq_codice_bambino";
CREATE SEQUENCE "seq_codice_richiesta";

CREATE FUNCTION "genera_codice"(tipo text) RETURNS text
LANGUAGE plpgsql AS $$
BEGIN
  CASE tipo
    WHEN 'FAM' THEN RETURN 'FAM-' || lpad(nextval('seq_codice_famiglia')::text, 4, '0');
    WHEN 'BAM' THEN RETURN 'BAM-' || lpad(nextval('seq_codice_bambino')::text, 4, '0');
    WHEN 'RIC' THEN RETURN 'RIC-' || lpad(nextval('seq_codice_richiesta')::text, 4, '0');
    ELSE RAISE EXCEPTION 'Tipo di codice sconosciuto: %', tipo;
  END CASE;
END;
$$;

ALTER TABLE "famiglia"  ADD CONSTRAINT "famiglia_codice_formato"  CHECK ("codice" IS NULL OR "codice" ~ '^FAM-[0-9]{4,}$');
ALTER TABLE "bambino"   ADD CONSTRAINT "bambino_codice_formato"   CHECK ("codice" IS NULL OR "codice" ~ '^BAM-[0-9]{4,}$');
ALTER TABLE "richiesta" ADD CONSTRAINT "richiesta_codice_formato" CHECK ("codice" IS NULL OR "codice" ~ '^RIC-[0-9]{4,}$');

-- =============================================================
-- Letture precalcolate, aggiornate ogni notte dal worker (cap. 12.5)
-- REFRESH MATERIALIZED VIEW CONCURRENTLY "vista_andamento_mensile";
-- =============================================================

-- Andamento mese per mese per capitolo, solo donazioni confermate (FR-DASH-02)
CREATE MATERIALIZED VIEW "vista_andamento_mensile" AS
SELECT date_trunc('month', d."pagata_il")::date AS "mese",
       q."capitolo_id",
       sum(q."importo_centesimi")::bigint         AS "totale_centesimi",
       count(DISTINCT d."id")                      AS "numero_donazioni"
FROM "quota_donazione" q
JOIN "donazione" d ON d."id" = q."donazione_id"
WHERE d."stato" = 'confermata'
GROUP BY 1, 2;
CREATE UNIQUE INDEX "vista_andamento_mensile_chiave" ON "vista_andamento_mensile" ("mese", "capitolo_id");

-- Storico per anno di ogni sostenitore, base del riepilogo annuale (SOS-08)
CREATE MATERIALIZED VIEW "vista_storico_annuale_sostenitore" AS
SELECT d."sostenitore_id",
       extract(year FROM d."pagata_il")::int AS "anno",
       sum(d."importo_centesimi")::bigint     AS "totale_centesimi",
       count(*)                               AS "numero_donazioni"
FROM "donazione" d
WHERE d."stato" = 'confermata'
GROUP BY 1, 2;
CREATE UNIQUE INDEX "vista_storico_annuale_chiave" ON "vista_storico_annuale_sostenitore" ("sostenitore_id", "anno");
