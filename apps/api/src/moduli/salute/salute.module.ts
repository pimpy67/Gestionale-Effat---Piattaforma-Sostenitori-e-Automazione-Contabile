import { Module } from "@nestjs/common";
import { SaluteController } from "./salute.controller";

@Module({
  controllers: [SaluteController],
})
export class SaluteModule {}
