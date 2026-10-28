import { BadRequestException, ValidationError } from "@nestjs/common";

export interface CampoNonValido {
  campo: string;
  messaggio: string;
}

// Errore dei dati in ingresso, con l'elenco dei campi non validi (cap. 11.3).
export class ErroreValidazione extends BadRequestException {
  constructor(readonly campi: CampoNonValido[]) {
    super("Alcuni campi non sono corretti.");
  }

  static daValidazione(errori: ValidationError[], prefisso = ""): ErroreValidazione {
    const campi: CampoNonValido[] = [];
    const raccogli = (lista: ValidationError[], percorso: string) => {
      for (const errore of lista) {
        const campo = percorso ? `${percorso}.${errore.property}` : errore.property;
        for (const messaggio of Object.values(errore.constraints ?? {})) {
          campi.push({ campo, messaggio });
        }
        if (errore.children?.length) raccogli(errore.children, campo);
      }
    };
    raccogli(errori, prefisso);
    return new ErroreValidazione(campi);
  }
}
