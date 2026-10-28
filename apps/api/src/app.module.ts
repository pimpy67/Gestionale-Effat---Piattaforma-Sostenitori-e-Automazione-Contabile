import { Module } from "@nestjs/common";
import { ConfigModule } from "@nestjs/config";
import { opzioniConfigurazione } from "./comune/configurazione";
import { DatabaseModule } from "./comune/database/database.module";
import { SaluteModule } from "./moduli/salute/salute.module";

// Modulo radice dell'API. I moduli di business (cap. 14.1) si aggiungono qui, uno per cartella di src/moduli.
@Module({
  imports: [ConfigModule.forRoot(opzioniConfigurazione), DatabaseModule, SaluteModule],
})
export class AppModule {}
