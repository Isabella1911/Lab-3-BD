import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';

const prisma = new PrismaClient();

export const listarInscripciones = async (_req: Request, res: Response) => {
  const inscripciones = await prisma.inscripcion.findMany({
    include: {
      participante: true,
      evento: true,
    },
  });
  res.render('inscripciones/index', { inscripciones });
};

export const mostrarFormularioCrearInscripcion = async (_req: Request, res: Response) => {
  const participantes = await prisma.participante.findMany();
  const eventos = await prisma.evento.findMany();
  res.render('inscripciones/create', { participantes, eventos });
};

export const crearInscripcion = async (req: Request, res: Response) => {
  const { id_participante, id_evento, estado } = req.body;
  await prisma.inscripcion.create({
    data: {
      id_participante: parseInt(id_participante),
      id_evento: parseInt(id_evento),
      estado,
    },
  });
  res.redirect('/inscripciones');
};

export const eliminarInscripcion = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  await prisma.inscripcion.delete({
    where: { id_inscripcion: id },
  });
  res.redirect('/inscripciones');
};
