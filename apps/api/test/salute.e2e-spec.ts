import { INestApplication } from "@nestjs/common";
import { Test } from "@nestjs/testing";
import request from "supertest";
import { AppModule } from "../src/app.module";
import { configuraApp } from "../src/comune/configura-app";

// Richiede un PostgreSQL raggiungibile con DATABASE_URL (npm run db:avvia e db:migra).
describe("API (end-to-end)", () => {
  let app: INestApplication;

  beforeAll(async () => {
    const modulo = await Test.createTestingModule({ imports: [AppModule] }).compile();
    app = modulo.createNestApplication();
    configuraApp(app);
    await app.init();
  });

  afterAll(async () => {
    await app.close();
  });

  it("GET /api/v1/salute risponde ok con il database collegato", async () => {
    const risposta = await request(app.getHttpServer()).get("/api/v1/salute").expect(200);
    expect(risposta.body).toEqual({ stato: "ok", database: "ok" });
  });

  it("una route inesistente risponde in formato RFC 9457", async () => {
    const risposta = await request(app.getHttpServer()).get("/api/v1/inesistente").expect(404);
    expect(risposta.headers["content-type"]).toContain("application/problem+json");
    expect(risposta.body).toMatchObject({
      status: 404,
      title: "Risorsa non trovata",
      detail: "L'indirizzo richiesto non esiste.",
      instance: "/api/v1/inesistente",
    });
  });
});
