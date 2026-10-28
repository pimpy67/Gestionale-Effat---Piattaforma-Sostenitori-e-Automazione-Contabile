import { ArgumentsHost, Catch, ExceptionFilter, HttpException, HttpStatus, Logger } from "@nestjs/common";
import type { Request, Response } from "express";
import { CampoNonValido, ErroreValidazione } from "./errore-validazione";

const BASE_TIPI = "https://gestionale.effataitalia.it/errori";

// Titolo in italiano e tipo per ogni stato HTTP usato dalle API.
const DESCRIZIONI: Record<number, { tipo: string; titolo: string }> = {
  400: { tipo: "richiesta-non-valida", titolo: "Richiesta non valida" },
  401: { tipo: "non-autenticato", titolo: "Accesso richiesto" },
  403: { tipo: "non-autorizzato", titolo: "Operazione non consentita" },
  404: { tipo: "non-trovato", titolo: "Risorsa non trovata" },
  409: { tipo: "conflitto", titolo: "Operazione in conflitto con lo stato attuale" },
  422: { tipo: "regola-non-rispettata", titolo: "Regola non rispettata" },
  429: { tipo: "troppe-richieste", titolo: "Troppe richieste" },
  503: { tipo: "non-disponibile", titolo: "Servizio non disponibile" },
};

export interface ProblemDetails {
  type: string;
  title: string;
  status: number;
  detail: string;
  instance: string;
  errors?: CampoNonValido[];
}

// Tutti gli errori in formato RFC 9457 (cap. 11.3, NFR-13b): messaggio comprensibile
// per l'utente, dettagli tecnici solo nei log.
@Catch()
export class ProblemDetailsFilter implements ExceptionFilter {
  private readonly logger = new Logger("Errori");

  catch(eccezione: unknown, host: ArgumentsHost): void {
    const contesto = host.switchToHttp();
    const richiesta = contesto.getRequest<Request>();
    const risposta = contesto.getResponse<Response>();

    const problema = this.costruisci(eccezione, richiesta.originalUrl ?? richiesta.url);
    if (problema.status >= 500) {
      this.logger.error(`${richiesta.method} ${problema.instance}`, eccezione instanceof Error ? eccezione.stack : String(eccezione));
    }
    risposta.status(problema.status).type("application/problem+json").json(problema);
  }

  costruisci(eccezione: unknown, istanza: string): ProblemDetails {
    if (eccezione instanceof ErroreValidazione) {
      return {
        type: `${BASE_TIPI}/validazione`,
        title: "Dati non validi",
        status: HttpStatus.BAD_REQUEST,
        detail: eccezione.message,
        instance: istanza,
        errors: eccezione.campi,
      };
    }
    if (eccezione instanceof HttpException) {
      const stato = eccezione.getStatus();
      const descrizione = DESCRIZIONI[stato] ?? { tipo: "errore", titolo: "Errore" };
      // Express risponde "Cannot GET /percorso" per le route che non esistono.
      const routeInesistente = stato === HttpStatus.NOT_FOUND && eccezione.message.startsWith("Cannot ");
      return {
        type: `${BASE_TIPI}/${descrizione.tipo}`,
        title: descrizione.titolo,
        status: stato,
        detail: routeInesistente ? "L'indirizzo richiesto non esiste." : eccezione.message,
        instance: istanza,
      };
    }
    return {
      type: `${BASE_TIPI}/errore-interno`,
      title: "Errore interno",
      status: HttpStatus.INTERNAL_SERVER_ERROR,
      detail: "Si è verificato un problema. Riprova più tardi.",
      instance: istanza,
    };
  }
}
