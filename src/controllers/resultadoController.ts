import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';

const prisma = new PrismaClient();

export const listarResultados = async (_req: Request, res: Response) => {
  const resultados = await prisma.resultadoFinal.findMany({
    include: {
      evento: true,
      participante: true,
    },
  });
  res.render('resultados/index', { resultados });
};

export const mostrarFormularioCrearResultado = async (_req: Request, res: Response) => {
  const eventos = await prisma.evento.findMany();
  const participantes = await prisma.participante.findMany();
  res.render('resultados/create', { eventos, participantes });
};

export const crearResultado = async (req: Request, res: Response) => {
  const { id_evento, id_participante, puntaje_total, posicion, medalla } = req.body;
  await prisma.resultadoFinal.create({
    data: {
      id_evento: parseInt(id_evento),
      id_participante: parseInt(id_participante),
      puntaje_total: parseFloat(puntaje_total),
      posicion: parseInt(posicion),
      medalla: medalla || null,
    },
  });
  res.redirect('/resultados');
};

export const eliminarResultado = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  await prisma.resultadoFinal.delete({ where: { id_resultado: id } });
  res.redirect('/resultados');
};
