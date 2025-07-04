CREATE DATABASE colombiano_coma_contento;

DROP TABLE IF EXISTS facturar, detallar, ofrecer, contener,
    plato_franja_horaria, carta, venta, plato, ingrediente, unidad_medida,
    region, categoria, nivel_complejidad, franja_horaria, usuario CASCADE;

-- Tabla: unidad_medida
CREATE TABLE unidad_medida (
    id_unidad_medida SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla: ingrediente
CREATE TABLE ingrediente (
    id_ingrediente SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    id_unidad_medida_fk INTEGER NOT NULL,
    FOREIGN KEY (id_unidad_medida_fk) REFERENCES unidad_medida(id_unidad_medida)
);

-- Tabla: region
CREATE TABLE region (
    id_region SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    encargado VARCHAR(100) NOT NULL
);

-- Tabla: categoria
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla: nivel_complejidad
CREATE TABLE nivel_complejidad (
    id_nivel_complejidad SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla: franja_horaria
CREATE TABLE franja_horaria (
    id_franja_horaria SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla: plato
CREATE TABLE plato (
    id_plato SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    foto TEXT,
    precio NUMERIC(10,2) NOT NULL CHECK (precio > 0),
    disponible BOOLEAN DEFAULT TRUE,
    id_region_fk INTEGER NOT NULL,
    id_categoria_fk INTEGER NOT NULL,
    id_nivel_complejidad_fk INTEGER NOT NULL,
    FOREIGN KEY (id_region_fk) REFERENCES region(id_region),
    FOREIGN KEY (id_categoria_fk) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_nivel_complejidad_fk) REFERENCES nivel_complejidad(id_nivel_complejidad)
);

-- Tabla: carta
CREATE TABLE carta (
    id_carta SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

-- Tabla: detallar (plato en carta)
CREATE TABLE detallar (
    id_carta_fk INTEGER NOT NULL,
    id_plato_fk INTEGER NOT NULL,
    PRIMARY KEY (id_carta_fk, id_plato_fk),
    FOREIGN KEY (id_carta_fk) REFERENCES carta(id_carta),
    FOREIGN KEY (id_plato_fk) REFERENCES plato(id_plato)
);

-- Tabla: ofrecer (plato en franja)
CREATE TABLE ofrecer (
    id_franja_horaria_fk INTEGER NOT NULL,
    id_plato_fk INTEGER NOT NULL,
    PRIMARY KEY (id_franja_horaria_fk, id_plato_fk),
    FOREIGN KEY (id_franja_horaria_fk) REFERENCES franja_horaria(id_franja_horaria),
    FOREIGN KEY (id_plato_fk) REFERENCES plato(id_plato)
);

-- Tabla: venta
CREATE TABLE venta (
    id_venta SERIAL PRIMARY KEY NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_franja_horaria_fk INTEGER NOT NULL,
    FOREIGN KEY (id_franja_horaria_fk) REFERENCES franja_horaria(id_franja_horaria)
);

-- Tabla: facturar (detalle de venta)
CREATE TABLE facturar (
    id_venta_fk INTEGER NOT NULL,
    id_plato_fk INTEGER NOT NULL,
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (id_venta_fk, id_plato_fk),
    FOREIGN KEY (id_venta_fk) REFERENCES venta(id_venta),
    FOREIGN KEY (id_plato_fk) REFERENCES plato(id_plato)
);

-- Tabla: contener (ingredientes del plato)
CREATE TABLE contener (
    id_plato_fk INTEGER NOT NULL,
    id_ingrediente_fk INTEGER NOT NULL,
    cantidad NUMERIC(10,2) NOT NULL,
    breve_descripcion TEXT,
    PRIMARY KEY (id_plato_fk, id_ingrediente_fk),
    FOREIGN KEY (id_plato_fk) REFERENCES plato(id_plato),
    FOREIGN KEY (id_ingrediente_fk) REFERENCES ingrediente(id_ingrediente)
);

-- Tabla: usuario
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    rol VARCHAR(20) DEFAULT 'cliente' CHECK (rol IN ('cliente', 'admin'))
);