// Dati di fantasia per lo sviluppo (cap. 13.5 e 14.4): nessun dato reale.
// Nomi, codici fiscali, IBAN ed email sono inventati.
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const euro = (valore: number) => Math.round(valore * 100);

async function codice(tipo: "FAM" | "BAM" | "RIC"): Promise<string> {
  const [riga] = await prisma.$queryRaw<{ codice: string }[]>`SELECT genera_codice(${tipo}) AS codice`;
  return riga.codice;
}

async function main() {
  if ((await prisma.utente.count()) > 0) {
    console.log("Il database contiene già dei dati: seed saltato (usa npm run db:reset).");
    return;
  }

  // Capitoli di imputazione (FR-INT-02, FR-INT-05, FR-INT-07)
  const [adozioni, struttura, famiglie, cure, gestioneCasa, cassa] = await Promise.all(
    [
      { nome: "Adozioni scolastiche", id_progetto_verifico: "215.020.01", obiettivo_annuale_centesimi: euro(150000) },
      { nome: "Casa struttura", id_progetto_verifico: "215.020.02" },
      { nome: "Aiuto famiglie in difficoltà", id_progetto_verifico: "215.020.03" },
      { nome: "Cure ospedaliere", id_progetto_verifico: "215.020.04" },
      { nome: "Gestione casa famiglia Effatà" }, // progetto e conto da definire (Allegato F)
      { nome: "Cassa sostegno Effatà" }, // progetto e conto da definire (Allegato F)
    ].map((data) => prisma.capitolo.create({ data })),
  );

  // Categorie e checklist (FR-CAT-01, FR-INT-03)
  const adozioneScolastica = await prisma.categoria.create({
    data: { nome: "Adozione scolastica", tipo: "richiesta_personale", capitolo_id: adozioni.id, costo_listino_centesimi: euro(180) },
  });
  await prisma.categoria.create({
    data: { nome: "Adozione in casa famiglia", tipo: "richiesta_personale", capitolo_id: gestioneCasa.id, costo_listino_centesimi: euro(180) },
  });
  const casa = await prisma.categoria.create({
    data: {
      nome: "Costruzione casa",
      tipo: "richiesta_personale",
      capitolo_id: famiglie.id,
      costo_listino_centesimi: euro(1500),
      voci_checklist: {
        create: [
          { nome: "Foto della casa finita", ordine: 1 },
          { nome: "Contratto", ordine: 2 },
          { nome: "Fattura", ordine: 3 },
        ],
      },
    },
    include: { voci_checklist: true },
  });
  await prisma.categoria.create({
    data: {
      nome: "Carrozzina",
      tipo: "richiesta_personale",
      capitolo_id: cure.id,
      costo_listino_centesimi: euro(250),
      voci_checklist: { create: [{ nome: "Foto della consegna", ordine: 1 }] },
    },
  });
  const materassi = await prisma.categoria.create({
    data: {
      nome: "Materassi",
      tipo: "voce_fissa",
      capitolo_id: famiglie.id,
      costo_listino_centesimi: euro(10),
      voci_checklist: { create: [{ nome: "Foto della consegna", ordine: 1 }] },
    },
  });
  for (const [specie, prezzo] of [["capra", 40], ["gallina", 8], ["maiale", 60]] as const) {
    await prisma.categoria.create({
      data: { nome: `Animali – ${specie}`, gruppo: "Animali", tipo: "voce_fissa", capitolo_id: famiglie.id, costo_listino_centesimi: euro(prezzo) },
    });
  }
  await prisma.categoria.create({ data: { nome: "Opere della casa famiglia", tipo: "voce_fissa", capitolo_id: struttura.id } });
  await prisma.categoria.create({ data: { nome: "Sostegno della casa famiglia", tipo: "voce_fissa", capitolo_id: gestioneCasa.id, costo_listino_centesimi: euro(50) } });

  // Persone (password non impostate: i valori veri si creano al primo accesso)
  const amministratore = await prisma.utente.create({
    data: { email: "amministratore@esempio.invalid", hash_password: "!non-impostata", ruoli: { create: [{ ruolo: "amministratore" }] } },
  });
  const volontaria = await prisma.utente.create({
    data: {
      email: "volontaria@esempio.invalid",
      hash_password: "!non-impostata",
      ruoli: { create: [{ ruolo: "volontario" }] },
      permessi: { create: [{ azione: "carica_prove" }, { azione: "aggiorna_schede" }] },
    },
  });
  const utenteSostenitrice = await prisma.utente.create({
    data: { email: "laura.esempio@esempio.invalid", hash_password: "!non-impostata", ruoli: { create: [{ ruolo: "sostenitore" }] } },
  });
  const laura = await prisma.sostenitore.create({
    data: {
      utente_id: utenteSostenitrice.id,
      nome: "Laura",
      cognome: "Esempio",
      codice_fiscale: "XMPLRA80A41L407X", // inventato
      email: "laura.esempio@esempio.invalid",
      provincia: "TV",
      iban: { create: [{ iban: "IT00X0000000000000000000001" }] }, // inventato
      consensi: { create: [{ tipo: "informativa_privacy", informativa_versione: "1.0", dato_il: new Date() }] },
    },
  });
  const padrinoStorico = await prisma.sostenitore.create({
    data: { nome: "Mario", cognome: "Prova", email: "mario.prova@esempio.invalid", origine: "importato_verifico", padrino_storico: true },
  });

  // Beneficiari con modulo di consenso (FR-CON-01)
  const famigliaMary = await prisma.famiglia.create({
    data: {
      codice: await codice("FAM"),
      genitore_tutore: "Mary (nome di fantasia)",
      villaggio: "Villaggio di prova",
      distretto: "Distretto di prova",
      moduli_consenso: {
        create: [{ firmato_il: new Date("2026-09-01"), raccolto_da: "Referente", percorso_file: "consensi/esempio.pdf", consenso_padrino: true, consenso_pubblicazione: true, consenso_compleanno: true }],
      },
    },
  });
  const grace = await prisma.bambino.create({
    data: { codice: await codice("BAM"), famiglia_id: famigliaMary.id, nome: "Grace", data_nascita: new Date("2016-03-12"), villaggio: "Villaggio di prova", scuola: "Scuola di prova", classe: "P4" },
  });
  const joseph = await prisma.bambino.create({
    data: { codice: await codice("BAM"), famiglia_id: famigliaMary.id, nome: "Joseph", data_nascita: new Date("2018-07-02"), villaggio: "Villaggio di prova" },
  });

  // Adozione di Grace: richiesta pagata, adozione attiva, annualità 2026 pagata (FR-ADO-04, FR-ADO-06)
  const richiestaGrace = await prisma.richiesta.create({
    data: {
      codice: await codice("RIC"),
      categoria_id: adozioneScolastica.id,
      bambino_id: grace.id,
      titolo: "La scuola di Grace",
      storia: "Storia di fantasia per lo sviluppo.",
      costo_centesimi: euro(180),
      stato: "sostenuta",
      approvata_il: new Date("2026-09-10"),
      sostenuta_il: new Date("2026-09-15"),
    },
  });
  const adozione = await prisma.adozione.create({
    data: {
      sostenitore_id: laura.id,
      bambino_id: grace.id,
      richiesta_id: richiestaGrace.id,
      importo_annuale_centesimi: euro(180),
      inizio: new Date("2026-09-15"),
      annualita: { create: [{ anno: 2026, importo_centesimi: euro(180), stato: "pagata" }] },
    },
    include: { annualita: true },
  });
  await prisma.donazione.create({
    data: {
      sostenitore_id: laura.id,
      importo_centesimi: euro(200),
      metodo: "carta",
      stato: "confermata",
      pagata_il: new Date("2026-09-15"),
      confermata_il: new Date("2026-09-15"),
      stripe_id: "pi_prova_0001",
      causale: `EROGAZIONE LIBERALE – ADOZIONE ${grace.codice}`,
      quote: {
        create: [
          { capitolo_id: adozioni.id, richiesta_id: richiestaGrace.id, annualita_adozione_id: adozione.annualita[0].id, importo_centesimi: euro(180) },
          { capitolo_id: cassa.id, importo_centesimi: euro(20) }, // il resto va in cassa (FR-INT-06)
        ],
      },
    },
  });

  // Casa per la famiglia di Mary: richiesta pagata, intervento con una prova caricata
  const richiestaCasa = await prisma.richiesta.create({
    data: {
      codice: await codice("RIC"),
      categoria_id: casa.id,
      famiglia_id: famigliaMary.id,
      titolo: "Una casa per la famiglia di Mary",
      storia: "Storia di fantasia per lo sviluppo.",
      costo_centesimi: euro(1500),
      stato: "sostenuta",
      approvata_il: new Date("2026-08-01"),
      sostenuta_il: new Date("2026-08-20"),
    },
  });
  const intervento = await prisma.intervento.create({
    data: { categoria_id: casa.id, richiesta_id: richiestaCasa.id, famiglia_id: famigliaMary.id, costo_centesimi: euro(1500), stato: "in_corso" },
  });
  await prisma.donazione.create({
    data: {
      sostenitore_id: padrinoStorico.id,
      importo_centesimi: euro(1500),
      metodo: "bonifico",
      stato: "confermata",
      pagata_il: new Date("2026-08-20"),
      confermata_il: new Date("2026-09-05"),
      quote: { create: [{ capitolo_id: famiglie.id, richiesta_id: richiestaCasa.id, intervento_id: intervento.id, importo_centesimi: euro(1500) }] },
    },
  });
  const invio = await prisma.invioBot.create({ data: { chiave_invio: "invio-prova-0001", volontario_id: volontaria.id, tipo: "aiuto_consegnato", esito: "elaborato" } });
  await prisma.prova.create({
    data: {
      intervento_id: intervento.id,
      voce_checklist_id: casa.voci_checklist[0].id,
      contenuti: {
        create: [
          { famiglia_id: famigliaMary.id, autore_id: volontaria.id, invio_bot_id: invio.id, tipo: "foto", percorso_file: "foto/casa-1.jpg", testo_referente: "La casa è finita!" },
          { famiglia_id: famigliaMary.id, autore_id: volontaria.id, invio_bot_id: invio.id, tipo: "foto", percorso_file: "foto/casa-2.jpg", ordine: 1 },
        ],
      },
    },
  });

  // Aggiornamento della scheda di Grace: non è una prova (FR-ADO-06)
  await prisma.contenuto.create({
    data: { bambino_id: grace.id, autore_id: volontaria.id, tipo: "foto", percorso_file: "foto/grace-divisa.jpg", testo_referente: "È felicissima, l'ha indossata subito" },
  });

  // Voce fissa in attesa di consegna (FR-INT-08) e una richiesta aperta in vetrina
  await prisma.donazione.create({
    data: {
      sostenitore_id: laura.id,
      importo_centesimi: euro(30),
      metodo: "satispay",
      stato: "confermata",
      pagata_il: new Date("2026-10-01"),
      confermata_il: new Date("2026-10-01"),
      quote: { create: [{ capitolo_id: famiglie.id, categoria_id: materassi.id, importo_centesimi: euro(30) }] },
    },
  });
  await prisma.richiesta.create({
    data: {
      codice: await codice("RIC"),
      categoria_id: adozioneScolastica.id,
      bambino_id: joseph.id,
      titolo: "La scuola di Joseph",
      storia: "Storia di fantasia per lo sviluppo.",
      costo_centesimi: euro(180),
      stato: "aperta",
      approvata_il: new Date("2026-10-10"),
    },
  });

  // Impostazioni con i valori predefiniti di FR-IMP-01
  await prisma.impostazione.createMany({
    data: [
      { chiave: "scadenza_credito_solidale_mesi", valore: 1 },
      { chiave: "segnalazione_richieste_senza_sostenitori_giorni", valore: 30 },
      { chiave: "bambini_senza_aggiornamenti_mesi", valore: 6 },
      { chiave: "promemoria_impegno_bonifico_giorni", valore: [7, 30] },
    ],
  });

  await prisma.notizia.create({
    data: { autore_id: amministratore.id, titolo: "Benvenuti nel gestionale", testo: "Notizia di prova.", pubblicata_il: new Date() },
  });

  await prisma.$executeRaw`REFRESH MATERIALIZED VIEW vista_andamento_mensile`;
  await prisma.$executeRaw`REFRESH MATERIALIZED VIEW vista_storico_annuale_sostenitore`;

  console.log("Seed completato con dati di fantasia.");
}

main()
  .catch((errore) => {
    console.error(errore);
    process.exitCode = 1;
  })
  .finally(() => prisma.$disconnect());
