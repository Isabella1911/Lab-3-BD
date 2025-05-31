-- Tipos personalizados
CREATE TYPE tipo_rol AS ENUM ('admin', 'juez', 'organizador');
CREATE TYPE tipo_genero AS ENUM ('masculino', 'femenino', 'otro');
CREATE TYPE tipo_modalidad AS ENUM ('presencial', 'virtual');
CREATE TYPE tipo_estado_inscripcion AS ENUM ('inscrito', 'cancelado', 'finalizado');
CREATE TYPE tipo_medalla AS ENUM ('oro', 'plata', 'bronce');

-- Tabla de usuarios
CREATE TABLE Usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(100) NOT NULL,
    rol tipo_rol NOT NULL
);

-- Tabla de instituciones
CREATE TABLE Instituciones (
    id_institucion SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    direccion TEXT NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo_contacto VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de participantes
CREATE TABLE Participantes (
    id_participante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    genero tipo_genero NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    grado_escolar VARCHAR(50) NOT NULL,
    id_institucion INT NOT NULL REFERENCES Instituciones(id_institucion)
);

-- Tabla de categorías
CREATE TABLE Categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Tabla de eventos
CREATE TABLE Eventos (
    id_evento SERIAL PRIMARY KEY,
    id_categoria INT NOT NULL REFERENCES Categorias(id_categoria),
    nombre VARCHAR(150) NOT NULL,
    fecha DATE NOT NULL,
    modalidad tipo_modalidad NOT NULL
);

-- Tabla de inscripciones
CREATE TABLE Inscripciones (
    id_inscripcion SERIAL PRIMARY KEY,
    id_participante INT NOT NULL REFERENCES Participantes(id_participante),
    id_evento INT NOT NULL REFERENCES Eventos(id_evento),
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado tipo_estado_inscripcion NOT NULL,
    UNIQUE(id_participante, id_evento)
);

-- Tabla de jueces
CREATE TABLE Jueces (
    id_juez SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    especialidad VARCHAR(100) NOT NULL
);

-- Tabla de evaluaciones
CREATE TABLE Evaluaciones (
    id_evaluacion SERIAL PRIMARY KEY,
    id_inscripcion INT NOT NULL REFERENCES Inscripciones(id_inscripcion),
    id_juez INT NOT NULL REFERENCES Jueces(id_juez),
    puntaje DECIMAL(5,2) NOT NULL CHECK (puntaje >= 0 AND puntaje <= 100),
    UNIQUE(id_inscripcion, id_juez)
);

-- Tabla de resultados finales
CREATE TABLE ResultadosFinales (
    id_resultado SERIAL PRIMARY KEY,
    id_evento INT NOT NULL REFERENCES Eventos(id_evento),
    id_participante INT NOT NULL REFERENCES Participantes(id_participante),
    puntaje_total DECIMAL(5,2) NOT NULL CHECK (puntaje_total >= 0),
    posicion INT NOT NULL CHECK (posicion >= 1),
    medalla tipo_medalla,
    UNIQUE(id_evento, id_
