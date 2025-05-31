// src/routes/participanteRoutes.ts
import { Router } from 'express';
import {
  listarParticipantes,
  mostrarFormularioCrear,
  crearParticipante,
  mostrarFormularioEditar,
  actualizarParticipante,
  eliminarParticipante
} from '../controllers/participanteController';

const router = Router();

router.get('/', listarParticipantes);
router.get('/nuevo', mostrarFormularioCrear);
router.post('/nuevo', crearParticipante);
router.get('/editar/:id', mostrarFormularioEditar);
router.post('/editar/:id', actualizarParticipante);
router.post('/eliminar/:id', eliminarParticipante);

export default router;
