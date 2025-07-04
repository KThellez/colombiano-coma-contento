
-- =========================
-- MODELO RELACIONAL NORMALIZADO (FINAL)
-- =========================

DROP TABLE IF EXISTS facturar, detallar, ofrecer, contener,
    plato_franja_horaria, carta, venta, plato, ingrediente, unidad_medida,
    region, categoria, nivel_complejidad, franja_horaria, usuario CASCADE;

-- Tabla: unidad_medida
CREATE TABLE unidad_medida (
    id_unidad_medida SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla: ingrediente
CREATE TABLE ingrediente (
    id_ingrediente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_unidad_medida_fk INTEGER NOT NULL REFERENCES unidad_medida(id_unidad_medida)
);

-- Tabla: region
CREATE TABLE region (
    id_region SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    encargado VARCHAR(100) NOT NULL
);

-- Tabla: categoria
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla: nivel_complejidad
CREATE TABLE nivel_complejidad (
    id_nivel_complejidad SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla: franja_horaria
CREATE TABLE franja_horaria (
    id_franja_horaria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla: plato
CREATE TABLE plato (
    id_plato SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    foto TEXT,
    precio NUMERIC(10,2) NOT NULL CHECK (precio > 0),
    disponible BOOLEAN DEFAULT TRUE,
    id_region_fk INTEGER NOT NULL REFERENCES region(id_region),
    id_categoria_fk INTEGER NOT NULL REFERENCES categoria(id_categoria),
    id_nivel_complejidad_fk INTEGER NOT NULL REFERENCES nivel_complejidad(id_nivel_complejidad)
);

-- Tabla: carta
CREATE TABLE carta (
    id_carta SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

-- Tabla: detallar (plato en carta)
CREATE TABLE detallar (
    id_carta_fk INTEGER NOT NULL REFERENCES carta(id_carta),
    id_plato_fk INTEGER NOT NULL REFERENCES plato(id_plato),
    PRIMARY KEY (id_carta_fk, id_plato_fk)
);

-- Tabla: ofrecer (plato en franja)
CREATE TABLE ofrecer (
    id_franja_horaria INTEGER NOT NULL REFERENCES franja_horaria(id_franja_horaria),
    id_plato INTEGER NOT NULL REFERENCES plato(id_plato),
    PRIMARY KEY (id_franja_horaria, id_plato)
);

-- Tabla: venta
CREATE TABLE venta (
    id_venta SERIAL PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_franja_horaria_fk INTEGER NOT NULL REFERENCES franja_horaria(id_franja_horaria)
);

-- Tabla: facturar (detalle de venta)
CREATE TABLE facturar (
    id_venta_fk INTEGER NOT NULL REFERENCES venta(id_venta),
    id_plato_fk INTEGER NOT NULL REFERENCES plato(id_plato),
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (id_venta_fk, id_plato_fk)
);

-- Tabla: contener (ingredientes del plato)
CREATE TABLE contener (
    id_plato_fk INTEGER NOT NULL REFERENCES plato(id_plato),
    id_ingrediente_fk INTEGER NOT NULL REFERENCES ingrediente(id_ingrediente),
    cantidad NUMERIC(10,2) NOT NULL,
    breve_descripcion TEXT,
    PRIMARY KEY (id_plato_fk, id_ingrediente_fk)
);

-- Tabla: usuario
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    rol VARCHAR(20) DEFAULT 'cliente' CHECK (rol IN ('cliente', 'admin'))
);
