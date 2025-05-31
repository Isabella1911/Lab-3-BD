import { Router } from 'express';
import { mostrarVistaResultados } from '../controllers/vistaController';

const router = Router();
router.get('/', mostrarVistaResultados);
export default router;
