import { INestApplication, ValidationPipe } from "@nestjs/common";
import { ErroreValidazione } from "./errori/errore-validazione";
import { ProblemDetailsFilter } from "./errori/problem-details.filter";

export const PREFISSO_API = "api/v1";

// Impostazioni comuni all'avvio e ai test end-to-end, così i test provano l'app vera.
export function configuraApp(app: INestApplication): void {
  app.setGlobalPrefix(PREFISSO_API);
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true, // i campi sconosciuti vengono rifiutati (cap. 11.3)
      transform: true,
      exceptionFactory: (errori) => ErroreValidazione.daValidazione(errori),
    }),
  );
  app.useGlobalFilters(new ProblemDetailsFilter());
  app.enableShutdownHooks();
}
