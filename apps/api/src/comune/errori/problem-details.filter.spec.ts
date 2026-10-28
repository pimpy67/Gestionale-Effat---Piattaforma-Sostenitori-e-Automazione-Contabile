import { ForbiddenException, NotFoundException } from "@nestjs/common";
import { ErroreValidazione } from "./errore-validazione";
import { ProblemDetailsFilter } from "./problem-details.filter";

describe("ProblemDetailsFilter (RFC 9457, cap. 11.3)", () => {
  const filtro = new ProblemDetailsFilter();

  it("trasforma un errore di validazione con l'elenco dei campi", () => {
    const errore = ErroreValidazione.daValidazione([
      { property: "codiceFiscale", constraints: { formato: "Il codice fiscale non è valido." }, children: [] },
    ]);
    expect(filtro.costruisci(errore, "/api/v1/me/dati-fiscali")).toEqual({
      type: "https://gestionale.effataitalia.it/errori/validazione",
      title: "Dati non validi",
      status: 400,
      detail: "Alcuni campi non sono corretti.",
      instance: "/api/v1/me/dati-fiscali",
      errors: [{ campo: "codiceFiscale", messaggio: "Il codice fiscale non è valido." }],
    });
  });

  it("raccoglie anche i campi annidati", () => {
    const errore = ErroreValidazione.daValidazione([
      {
        property: "aventeDiritto",
        children: [{ property: "cognome", constraints: { obbligatorio: "Il cognome è obbligatorio." }, children: [] }],
      },
    ]);
    expect(errore.campi).toEqual([{ campo: "aventeDiritto.cognome", messaggio: "Il cognome è obbligatorio." }]);
  });

  it("usa titolo e tipo in italiano per gli errori HTTP", () => {
    const problema = filtro.costruisci(new ForbiddenException("Non puoi vedere questo bambino."), "/api/v1/bambini/BAM-0001");
    expect(problema).toMatchObject({ status: 403, title: "Operazione non consentita", detail: "Non puoi vedere questo bambino." });
    expect(filtro.costruisci(new NotFoundException(), "/x").type).toBe("https://gestionale.effataitalia.it/errori/non-trovato");
  });

  it("non espone i dettagli tecnici di un errore imprevisto", () => {
    const problema = filtro.costruisci(new Error("connessione rifiutata a 10.0.0.5"), "/api/v1/salute");
    expect(problema.status).toBe(500);
    expect(problema.detail).not.toContain("10.0.0.5");
  });
});
