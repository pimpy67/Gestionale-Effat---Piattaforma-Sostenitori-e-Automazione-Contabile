import { Controller, Get, ServiceUnavailableException } from "@nestjs/common";
import { ApiOkResponse, ApiOperation, ApiServiceUnavailableResponse, ApiTags } from "@nestjs/swagger";
import { PrismaService } from "../../comune/database/prisma.service";

export class StatoSalute {
  stato: "ok";
  database: "ok";
}

// Controllo di salute pubblico, usato dal rilascio e dal monitoraggio (cap. 11.1, cap. 16).
@ApiTags("salute")
@Controller("salute")
export class SaluteController {
  constructor(private readonly prisma: PrismaService) {}

  @Get()
  @ApiOperation({ summary: "Controlla che API e database rispondano" })
  @ApiOkResponse({ type: StatoSalute })
  @ApiServiceUnavailableResponse({ description: "Database non raggiungibile" })
  async controlla(): Promise<StatoSalute> {
    try {
      await this.prisma.$queryRaw`SELECT 1`;
    } catch {
      throw new ServiceUnavailableException("Il database non risponde.");
    }
    return { stato: "ok", database: "ok" };
  }
}
