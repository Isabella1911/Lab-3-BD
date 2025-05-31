import { Router } from 'express';
import {
  listarEventos,
  mostrarFormularioCrearEvento,
  crearEvento,
  mostrarFormularioEditarEvento,
  actualizarEvento,
  eliminarEvento
} from '../controllers/eventoController';

const router = Router();

router.get('/', listarEventos);
router.get('/nuevo', mostrarFormularioCrearEvento);
router.post('/nuevo', crearEvento);
router.get('/editar/:id', mostrarFormularioEditarEvento);
router.post('/editar/:id', actualizarEvento);
router.post('/eliminar/:id', eliminarEvento);

export default router;
