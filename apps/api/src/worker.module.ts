import { Module } from "@nestjs/common";
import { ConfigModule } from "@nestjs/config";
import { opzioniConfigurazione } from "./comune/configurazione";
import { DatabaseModule } from "./comune/database/database.module";

// Modulo del worker: lavori lenti e pianificati (cap. 10.2), senza API HTTP.
// Qui arriveranno la coda pg-boss, le email, le foto, i PDF e i lavori notturni.
@Module({
  imports: [ConfigModule.forRoot(opzioniConfigurazione), DatabaseModule],
})
export class WorkerModule {}
