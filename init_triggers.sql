-- ==============================================
-- HISTORIAL Y TRIGGERS DE AUDITORÍA
-- Para: categorias, cartas, platos, regiones,
--       usuarios, ingredientes, ventas
-- ==============================================

-- ========== 1. CATEGORIAS ==========

CREATE TABLE historial_categorias (
    id SERIAL PRIMARY KEY,
    id_categoria INTEGER,
    nombre VARCHAR(100),
    accion VARCHAR(10),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_historial_categoria()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO historial_categorias (id_categoria, nombre, accion)
        VALUES (OLD.id, OLD.nombre, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_categorias (id_categoria, nombre, accion)
        VALUES (NEW.id, NEW.nombre, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_categoria_auditoria
AFTER INSERT OR UPDATE OR DELETE ON categorias
FOR EACH ROW EXECUTE FUNCTION registrar_historial_categoria();


-- ========== 2. CARTAS ==========

CREATE TABLE historial_cartas (
    id SERIAL PRIMARY KEY,
    id_carta INTEGER,
    nombre VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE,
    accion VARCHAR(10),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_historial_carta()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO historial_cartas (id_carta, nombre, fecha_inicio, fecha_fin, accion)
        VALUES (OLD.id, OLD.nombre, OLD.fecha_inicio, OLD.fecha_fin, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_cartas (id_carta, nombre, fecha_inicio, fecha_fin, accion)
        VALUES (NEW.id, NEW.nombre, NEW.fecha_inicio, NEW.fecha_fin, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_carta_auditoria
AFTER INSERT OR UPDATE OR DELETE ON cartas
FOR EACH ROW EXECUTE FUNCTION registrar_historial_carta();


-- ========== 3. PLATOS ==========

CREATE TABLE historial_platos (
    id SERIAL PRIMARY KEY,
    id_plato INTEGER,
    nombre VARCHAR(100),
    descripcion TEXT,
    nivel_complejidad VARCHAR(50),
    foto VARCHAR(255),
    precio_venta NUMERIC(10,2),
    id_region INTEGER,
    id_categoria INTEGER,
    accion VARCHAR(10),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_historial_plato()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO historial_platos (id_plato, nombre, descripcion, nivel_complejidad, foto, precio_venta,
            id_region, id_categoria, accion)
        VALUES (OLD.id, OLD.nombre, OLD.descripcion, OLD.nivel_complejidad, OLD.foto,
            OLD.precio_venta, OLD.id_region, OLD.id_categoria, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_platos (id_plato, nombre, descripcion, nivel_complejidad, foto, precio_venta,
            id_region, id_categoria, accion)
        VALUES (NEW.id, NEW.nombre, NEW.descripcion, NEW.nivel_complejidad, NEW.foto,
            NEW.precio_venta, NEW.id_region, NEW.id_categoria, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_plato_auditoria
AFTER INSERT OR UPDATE OR DELETE ON platos
FOR EACH ROW EXECUTE FUNCTION registrar_historial_plato();


-- ========== 4. REGIONES ==========

CREATE TABLE historial_regiones (
    id SERIAL PRIMARY KEY,
    id_region INTEGER,
    nombre VARCHAR(100),
    encargado VARCHAR(100),
    accion VARCHAR(10),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_historial_region()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO historial_regiones (id_region, nombre, encargado, accion)
        VALUES (OLD.id, OLD.nombre, OLD.encargado, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_regiones (id_region, nombre, encargado, accion)
        VALUES (NEW.id, NEW.nombre, NEW.encargado, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_region_auditoria
AFTER INSERT OR UPDATE OR DELETE ON regiones
FOR EACH ROW EXECUTE FUNCTION registrar_historial_region();


-- ========== 5. USUARIOS ==========

CREATE TABLE historial_usuarios (
    id SERIAL PRIMARY KEY,
    id_usuario INTEGER,
    username VARCHAR(50),
    password TEXT,
    rol VARCHAR(20),
    accion VARCHAR(10),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_historial_usuario()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO historial_usuarios (id_usuario, username, password, rol, accion)
        VALUES (OLD.id, OLD.username, OLD.password, OLD.rol, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_usuarios (id_usuario, username, password, rol, accion)
        VALUES (NEW.id, NEW.username, NEW.password, NEW.rol, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_usuario_auditoria
AFTER INSERT OR UPDATE OR DELETE ON usuarios
FOR EACH ROW EXECUTE FUNCTION registrar_historial_usuario();


-- ========== 6. INGREDIENTES ==========

CREATE TABLE historial_ingredientes (
    id SERIAL PRIMARY KEY,
    id_ingrediente INTEGER,
    nombre VARCHAR(100),
    unidad_medida VARCHAR(20),
    accion VARCHAR(10),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_historial_ingrediente()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO historial_ingredientes (id_ingrediente, nombre, unidad_medida, accion)
        VALUES (OLD.id, OLD.nombre, OLD.unidad_medida, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_ingredientes (id_ingrediente, nombre, unidad_medida, accion)
        VALUES (NEW.id, NEW.nombre, NEW.unidad_medida, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_ingrediente_auditoria
AFTER INSERT OR UPDATE OR DELETE ON ingredientes
FOR EACH ROW EXECUTE FUNCTION registrar_historial_ingrediente();


-- ========== 7. VENTAS ==========

CREATE TABLE historial_ventas (
    id SERIAL PRIMARY KEY,
    id_venta INTEGER,
    fecha TIMESTAMP,
    franja_horaria_id INTEGER,
    accion VARCHAR(10),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_historial_venta()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO historial_ventas (id_venta, fecha, franja_horaria_id, accion)
        VALUES (OLD.id, OLD.fecha, OLD.franja_horaria_id, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_ventas (id_venta, fecha, franja_horaria_id, accion)
        VALUES (NEW.id, NEW.fecha, NEW.franja_horaria_id, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_venta_auditoria
AFTER INSERT OR UPDATE OR DELETE ON ventas
FOR EACH ROW EXECUTE FUNCTION registrar_historial_venta();
