import { Router } from 'express';
import {
  listarInscripciones,
  mostrarFormularioCrearInscripcion,
  crearInscripcion,
  eliminarInscripcion,
} from '../controllers/inscripcionController';

const router = Router();

router.get('/', listarInscripciones);
router.get('/nuevo', mostrarFormularioCrearInscripcion);
router.post('/nuevo', crearInscripcion);
router.post('/eliminar/:id', eliminarInscripcion);

export default router;
