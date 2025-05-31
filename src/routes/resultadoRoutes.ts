import { Router } from 'express';
import {
  listarResultados,
  mostrarFormularioCrearResultado,
  crearResultado,
  eliminarResultado
} from '../controllers/resultadoController';

const router = Router();

router.get('/', listarResultados);
router.get('/nuevo', mostrarFormularioCrearResultado);
router.post('/nuevo', crearResultado);
router.post('/eliminar/:id', eliminarResultado);

export default router;
