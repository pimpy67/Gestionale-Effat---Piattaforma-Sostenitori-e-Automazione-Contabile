import path from "node:path";
import { ConfigModuleOptions } from "@nestjs/config";

// Le variabili arrivano dal file .env nella radice del monorepo (cap. 13.5):
// mai valori reali nella repository, solo .env.example.
export const opzioniConfigurazione: ConfigModuleOptions = {
  isGlobal: true,
  envFilePath: path.resolve(__dirname, "../../../../.env"),
  validate: (variabili: Record<string, unknown>) => {
    if (!variabili.DATABASE_URL) {
      throw new Error("Variabile DATABASE_URL mancante: copia .env.example in .env e compilalo.");
    }
    return variabili;
  },
};
