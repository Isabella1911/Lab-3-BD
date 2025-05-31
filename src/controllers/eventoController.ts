import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';

const prisma = new PrismaClient();

export const listarEventos = async (_req: Request, res: Response) => {
  const eventos = await prisma.evento.findMany({
    include: { categoria: true }
  });
  res.render('eventos/index', { eventos });
};

export const mostrarFormularioCrearEvento = (_req: Request, res: Response) => {
  res.render('eventos/create');
};

export const crearEvento = async (req: Request, res: Response) => {
  const { nombre, fecha, modalidad, id_categoria } = req.body;
  await prisma.evento.create({
    data: {
      nombre,
      fecha: new Date(fecha),
      modalidad,
      id_categoria: parseInt(id_categoria)
    }
  });
  res.redirect('/eventos');
};

export const mostrarFormularioEditarEvento = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  const evento = await prisma.evento.findUnique({ where: { id_evento: id } });
  res.render('eventos/edit', { evento });
};

export const actualizarEvento = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  const { nombre, fecha, modalidad } = req.body;
  await prisma.evento.update({
    where: { id_evento: id },
    data: {
      nombre,
      fecha: new Date(fecha),
      modalidad
    }
  });
  res.redirect('/eventos');
};

export const eliminarEvento = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  await prisma.evento.delete({ where: { id_evento: id } });
  res.redirect('/eventos');
};
