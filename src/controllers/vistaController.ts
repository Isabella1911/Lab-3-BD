import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';

const prisma = new PrismaClient();

export const mostrarVistaResultados = async (_req: Request, res: Response) => {
  const resultados = await prisma.$queryRawUnsafe(`
    SELECT * FROM "VistaResultadosCompletos"
  `);
  res.render('vista_resultados/index', { resultados });
};
