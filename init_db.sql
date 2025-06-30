-- Elimina las tablas si ya existen (para reinicio limpio)
DROP TABLE IF EXISTS detalle_venta, detalle_carta, plato_ingrediente,
    platos, ingredientes, franjas_horarias, categorias, regiones, cartas, ventas, usuarios CASCADE;

-- Tabla de regiones
CREATE TABLE regiones (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    encargado VARCHAR(100) NOT NULL
);

-- Tabla de categorías
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de franjas horarias
CREATE TABLE franjas_horarias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL -- desayuno, almuerzo, cena
);

-- Tabla de ingredientes
CREATE TABLE ingredientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    unidad_medida VARCHAR(20) NOT NULL
);

-- Tabla de platos
CREATE TABLE platos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    nivel_complejidad VARCHAR(50),
    foto VARCHAR(255),
    precio_venta NUMERIC(10,2) CHECK (precio_venta > 0),
    disponible BOOLEAN DEFAULT TRUE,

    id_region INTEGER REFERENCES regiones(id),
    id_categoria INTEGER REFERENCES categorias(id)
);

-- Tabla intermedia para franja horaria de cada plato
CREATE TABLE plato_franja_horaria (
    id_plato INTEGER REFERENCES platos(id),
    id_franja INTEGER REFERENCES franjas_horarias(id),
    PRIMARY KEY (id_plato, id_franja)
);

-- Tabla intermedia para ingredientes de cada plato
CREATE TABLE plato_ingrediente (
    id_plato INTEGER REFERENCES platos(id),
    id_ingrediente INTEGER REFERENCES ingredientes(id),
    cantidad NUMERIC(10,2) NOT NULL,
    descripcion TEXT,
    PRIMARY KEY (id_plato, id_ingrediente)
);

-- Tabla carta
CREATE TABLE cartas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

-- Tabla intermedia entre cartas y platos
CREATE TABLE detalle_carta (
    id_carta INTEGER REFERENCES cartas(id),
    id_plato INTEGER REFERENCES platos(id),
    PRIMARY KEY (id_carta, id_plato)
);

-- Tabla de ventas
CREATE TABLE ventas (
    id SERIAL PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    franja_horaria_id INTEGER REFERENCES franjas_horarias(id)
);

-- Detalle de platos vendidos en cada venta
CREATE TABLE detalle_venta (
    id_venta INTEGER REFERENCES ventas(id),
    id_plato INTEGER REFERENCES platos(id),
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (id_venta, id_plato)
);

-- Usuario
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    rol VARCHAR(20) DEFAULT 'cliente' -- cliente o admin
);
