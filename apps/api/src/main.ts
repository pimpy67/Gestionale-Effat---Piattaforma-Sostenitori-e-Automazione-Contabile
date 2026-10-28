import "reflect-metadata";
import { Logger } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { NestFactory } from "@nestjs/core";
import { DocumentBuilder, SwaggerModule } from "@nestjs/swagger";
import { AppModule } from "./app.module";
import { configuraApp, PREFISSO_API } from "./comune/configura-app";

// Avvio dell'API (cap. 14.1).
async function avvia(): Promise<void> {
  const app = await NestFactory.create(AppModule);
  configuraApp(app);

  const config = app.get(ConfigService);
  const produzione = config.get("NODE_ENV") === "production";

  // OpenAPI generata dal codice (NFR-12). In produzione sarà visibile solo agli
  // amministratori (cap. 11.4): finché l'accesso non esiste, lì resta spenta.
  if (!produzione) {
    const documento = SwaggerModule.createDocument(
      app,
      new DocumentBuilder().setTitle("Gestionale Effatà – API").setVersion("1").build(),
    );
    SwaggerModule.setup(`${PREFISSO_API}/docs`, app, documento);
  }

  const porta = Number(config.get("PORT") ?? 3000);
  await app.listen(porta);
  Logger.log(`API in ascolto su http://localhost:${porta}/${PREFISSO_API}`, "Avvio");
}

void avvia();
