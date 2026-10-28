import "reflect-metadata";
import { Logger } from "@nestjs/common";
import { NestFactory } from "@nestjs/core";
import { WorkerModule } from "./worker.module";

// Avvio del worker (cap. 14.1): stesso codice dell'API, processo separato.
async function avvia(): Promise<void> {
  const app = await NestFactory.createApplicationContext(WorkerModule);
  app.enableShutdownHooks();
  Logger.log("Worker avviato: nessun lavoro ancora registrato.", "Worker");
  // Tiene vivo il processo finché non arrivano i lavori della coda.
  setInterval(() => undefined, 60_000);
}

void avvia();
