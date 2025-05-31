// src/controllers/participanteController.ts
import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';

const prisma = new PrismaClient();

export const listarParticipantes = async (_req: Request, res: Response) => {
  const participantes = await prisma.participante.findMany({
    include: { institucion: true },
  });
  res.render('participantes/index', { participantes });
};

export const mostrarFormularioCrear = (_req: Request, res: Response) => {
  res.render('participantes/create');
};

export const crearParticipante = async (req: Request, res: Response) => {
  const { nombre, apellido, genero, fecha_nacimiento, grado_escolar, id_institucion } = req.body;
  await prisma.participante.create({
    data: {
      nombre,
      apellido,
      genero,
      fecha_nacimiento: new Date(fecha_nacimiento),
      grado_escolar,
      id_institucion: parseInt(id_institucion),
    },
  });
  res.redirect('/participantes');
};

export const mostrarFormularioEditar = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  const participante = await prisma.participante.findUnique({ where: { id_participante: id } });
  res.render('participantes/edit', { participante });
};

export const actualizarParticipante = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  const { nombre, apellido, genero, fecha_nacimiento, grado_escolar } = req.body;
  await prisma.participante.update({
    where: { id_participante: id },
    data: {
      nombre,
      apellido,
      genero,
      fecha_nacimiento: new Date(fecha_nacimiento),
      grado_escolar,
    },
  });
  res.redirect('/participantes');
};

export const eliminarParticipante = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  await prisma.participante.delete({ where: { id_participante: id } });
  res.redirect('/participantes');
};
