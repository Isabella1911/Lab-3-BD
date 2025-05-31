// src/main.ts
import express from 'express';
import bodyParser from 'body-parser';
import participanteRoutes from './routes/participanteRoutes';
import path from 'path';
import eventoRoutes from './routes/eventoRoutes';
import inscripcionRoutes from './routes/inscripcionRoutes';
import resultadoRoutes from './routes/resultadoRoutes';
import vistaRoutes from './routes/vistaRoutes';


const app = express();
const PORT = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use('/participantes', participanteRoutes);
app.use('/eventos', eventoRoutes);
app.use('/inscripciones', inscripcionRoutes);
app.use('/resultados', resultadoRoutes);
app.use('/vista', vistaRoutes);

app.get('/', (_req, res) => {
  res.redirect('/participantes');
});

app.listen(PORT, () => {
  console.log(`Servidor escuchando en http://localhost:${PORT}`);
});
