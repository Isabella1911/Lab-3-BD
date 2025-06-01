-- 1. Instituciones (3 registros)
INSERT INTO "Institucion" (nombre, direccion, telefono, correo_contacto) VALUES
('Colegio Nacional', 'Av. Libertad 123', '1234567', 'colegionacional@edu.com'),
('Instituto Técnico', 'Calle 45 #67-89', '7654321', 'info@institutotecnico.edu'),
('Escuela Primaria Libertad', 'Carrera 12 #34-56', '9876543', 'contacto@libertad.edu');

-- 2. Categorias (3 registros)
INSERT INTO "Categoria" (nombre, descripcion) VALUES
('Matemáticas', 'Competencias de cálculo y razonamiento lógico'),
('Ciencias', 'Eventos científicos y experimentales'),
('Literatura', 'Concursos de escritura creativa');

-- 3. Eventos (5 registros con relaciones a categorias)
INSERT INTO "Evento" (id_categoria, nombre, fecha, modalidad) VALUES
(1, 'Olimpiada Matemática 2023', '2023-05-15', 'Presencial'),
(1, 'Torneo Geometría Avanzada', '2023-06-20', 'Virtual'),
(2, 'Feria de Ciencias Nacional', '2023-07-10', 'Presencial'),
(3, 'Concurso Cuento Corto', '2023-08-05', 'Híbrida'),
(2, 'Competencia Robótica', '2023-09-12', 'Presencial');

-- 4. Participantes (10 registros con relaciones a instituciones)
INSERT INTO "Participante" (nombre, apellido, genero, fecha_nacimiento, grado_escolar, id_institucion) VALUES
('María', 'Gómez', 'F', '2010-03-15', '6to grado', 1),
('Carlos', 'López', 'M', '2009-05-22', '7mo grado', 1),
('Ana', 'Martínez', 'F', '2008-01-10', '8vo grado', 2),
('Pedro', 'Rodríguez', 'M', '2007-07-14', '9no grado', 2),
('Laura', 'Hernández', 'F', '2006-09-05', '10mo grado', 3),
('Jorge', 'Díaz', 'M', '2010-04-18', '6to grado', 1),
('Sofía', 'Torres', 'F', '2009-12-25', '7mo grado', 2),
('Miguel', 'Vargas', 'M', '2008-08-08', '8vo grado', 3),
('Lucía', 'Ramírez', 'F', '2007-04-01', '9no grado', 1),
('Diego', 'Sánchez', 'M', '2006-11-30', '10mo grado', 3);

-- 5. Inscripciones (10 registros con relaciones multiples)
INSERT INTO "Inscripcion" (id_participante, id_evento, estado) VALUES
(1, 1, 'Confirmada'),
(2, 1, 'Confirmada'),
(3, 2, 'Pendiente'),
(4, 3, 'Confirmada'),
(5, 3, 'Confirmada'),
(1, 3, 'Cancelada'),  
(6, 4, 'Confirmada'),
(7, 4, 'Confirmada'),
(8, 5, 'Pendiente'),
(9, 5, 'Confirmada'),
(10, 1, 'Confirmada'),  
(3, 3, 'Confirmada');  

-- 6. Jueces (5 registros)
INSERT INTO "Juez" (nombre, correo, especialidad) VALUES
('Roberto Sánchez', 'roberto@example.com', 'Matemáticas'),
('Elena Morales', 'elena@example.com', 'Ciencias'),
('Diego Fernández', 'diego@example.com', 'Literatura'),
('Carmen Ruiz', 'carmen@example.com', 'Robótica'),
('Javier López', 'javier@example.com', 'Tecnología');

-- 7. Evaluaciones (10 registros con relaciones multiples)
INSERT INTO "Evaluacion" (id_inscripcion, id_juez, puntaje) VALUES
(1, 1, 85.5),    
(1, 2, 90.0),    
(2, 1, 78.5),    
(4, 2, 92.0),
(5, 2, 88.5),
(6, 3, 76.0),
(7, 3, 89.5),
(8, 4, 95.0),
(9, 4, 82.5),
(10, 5, 91.0),
(11, 5, 87.0),
(12, 3, 84.5); 

-- 8. Resultados Finales (5 registros con relaciones)
INSERT INTO "ResultadoFinal" (id_evento, id_participante, puntaje_total, posicion, medalla) VALUES
(1, 2, 92.5, 1, 'Oro'),       -- Evento 1
(3, 5, 95.0, 1, 'Oro'),       -- Evento 3
(3, 4, 90.5, 2, 'Plata'),     -- Mismo evento, diferente participante
(4, 7, 89.0, 1, 'Oro'),       -- Evento 4
(5, 9, 93.5, 1, 'Oro');       -- Evento 5

-- 9. Feedback (10 registros)
INSERT INTO "Feedback" (id_participante, comentario, calificacion) VALUES
(1, 'Excelente organización del evento', 5),
(2, 'Los problemas fueron desafiantes', 4),
(3, NULL, NULL),
(4, 'Me gustaría más tiempo', 3),
(5, 'Increíble experiencia', 5),
(6, 'Los jueces fueron muy profesionales', 4),
(7, 'El lugar era muy pequeño', 3),
(8, NULL, NULL),
(9, 'Aprendí mucho', 5),
(10, 'Buen nivel de competencia', 4);

-- 10. Usuarios (2 registros)
INSERT INTO "Usuario" (nombre, correo, contraseña, rol) VALUES
('Admin Principal', 'admin@system.com', 'securepass123', 'Administrador'),
('Juez Asistente', 'asistente@judges.com', 'judgepass456', 'Juez');