
-- ==============================================
-- HISTORIAL Y TRIGGERS DE AUDITORÍA ACTUALIZADOS
-- Para: categoria, carta, plato, region,
--       usuario, ingrediente, venta
-- ==============================================

-- ========== 1. CATEGORIA ==========

CREATE TABLE historial_categoria (
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
        INSERT INTO historial_categoria (id_categoria, nombre, accion)
        VALUES (OLD.id_categoria, OLD.nombre, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_categoria (id_categoria, nombre, accion)
        VALUES (NEW.id_categoria, NEW.nombre, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_categoria_auditoria
AFTER INSERT OR UPDATE OR DELETE ON categoria
FOR EACH ROW EXECUTE FUNCTION registrar_historial_categoria();


-- ========== 2. CARTA ==========

CREATE TABLE historial_carta (
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
        INSERT INTO historial_carta (id_carta, nombre, fecha_inicio, fecha_fin, accion)
        VALUES (OLD.id_carta, OLD.nombre, OLD.fecha_inicio, OLD.fecha_fin, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_carta (id_carta, nombre, fecha_inicio, fecha_fin, accion)
        VALUES (NEW.id_carta, NEW.nombre, NEW.fecha_inicio, NEW.fecha_fin, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_carta_auditoria
AFTER INSERT OR UPDATE OR DELETE ON carta
FOR EACH ROW EXECUTE FUNCTION registrar_historial_carta();


-- ========== 3. PLATO ==========

CREATE TABLE historial_plato (
    id SERIAL PRIMARY KEY,
    id_plato INTEGER,
    nombre VARCHAR(100),
    descripcion TEXT,
    foto TEXT,
    precio NUMERIC(10,2),
    disponible BOOLEAN,
    id_region_fk INTEGER,
    id_categoria_fk INTEGER,
    id_nivel_complejidad_fk INTEGER,
    accion VARCHAR(10),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_historial_plato()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO historial_plato (id_plato, nombre, descripcion, foto, precio, disponible,
                                     id_region_fk, id_categoria_fk, id_nivel_complejidad_fk, accion)
        VALUES (OLD.id_plato, OLD.nombre, OLD.descripcion, OLD.foto, OLD.precio, OLD.disponible,
                OLD.id_region_fk, OLD.id_categoria_fk, OLD.id_nivel_complejidad_fk, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_plato (id_plato, nombre, descripcion, foto, precio, disponible,
                                     id_region_fk, id_categoria_fk, id_nivel_complejidad_fk, accion)
        VALUES (NEW.id_plato, NEW.nombre, NEW.descripcion, NEW.foto, NEW.precio, NEW.disponible,
                NEW.id_region_fk, NEW.id_categoria_fk, NEW.id_nivel_complejidad_fk, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_plato_auditoria
AFTER INSERT OR UPDATE OR DELETE ON plato
FOR EACH ROW EXECUTE FUNCTION registrar_historial_plato();


-- ========== 4. REGION ==========

CREATE TABLE historial_region (
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
        INSERT INTO historial_region (id_region, nombre, encargado, accion)
        VALUES (OLD.id_region, OLD.nombre, OLD.encargado, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_region (id_region, nombre, encargado, accion)
        VALUES (NEW.id_region, NEW.nombre, NEW.encargado, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_region_auditoria
AFTER INSERT OR UPDATE OR DELETE ON region
FOR EACH ROW EXECUTE FUNCTION registrar_historial_region();


-- ========== 5. USUARIO ==========

CREATE TABLE historial_usuario (
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
        INSERT INTO historial_usuario (id_usuario, username, password, rol, accion)
        VALUES (OLD.id, OLD.username, OLD.password, OLD.rol, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_usuario (id_usuario, username, password, rol, accion)
        VALUES (NEW.id, NEW.username, NEW.password, NEW.rol, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_usuario_auditoria
AFTER INSERT OR UPDATE OR DELETE ON usuario
FOR EACH ROW EXECUTE FUNCTION registrar_historial_usuario();


-- ========== 6. INGREDIENTE ==========

CREATE TABLE historial_ingrediente (
    id SERIAL PRIMARY KEY,
    id_ingrediente INTEGER,
    nombre VARCHAR(100),
    id_unidad_medida_fk INTEGER,
    accion VARCHAR(10),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_historial_ingrediente()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO historial_ingrediente (id_ingrediente, nombre, id_unidad_medida_fk, accion)
        VALUES (OLD.id_ingrediente, OLD.nombre, OLD.id_unidad_medida_fk, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_ingrediente (id_ingrediente, nombre, id_unidad_medida_fk, accion)
        VALUES (NEW.id_ingrediente, NEW.nombre, NEW.id_unidad_medida_fk, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_ingrediente_auditoria
AFTER INSERT OR UPDATE OR DELETE ON ingrediente
FOR EACH ROW EXECUTE FUNCTION registrar_historial_ingrediente();


-- ========== 7. VENTA ==========

CREATE TABLE historial_venta (
    id SERIAL PRIMARY KEY,
    id_venta INTEGER,
    fecha TIMESTAMP,
    id_franja_horaria_fk INTEGER,
    accion VARCHAR(10),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_historial_venta()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO historial_venta (id_venta, fecha, id_franja_horaria_fk, accion)
        VALUES (OLD.id_venta, OLD.fecha, OLD.id_franja_horaria_fk, TG_OP);
        RETURN OLD;
    ELSE
        INSERT INTO historial_venta (id_venta, fecha, id_franja_horaria_fk, accion)
        VALUES (NEW.id_venta, NEW.fecha, NEW.id_franja_horaria_fk, TG_OP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_venta_auditoria
AFTER INSERT OR UPDATE OR DELETE ON venta
FOR EACH ROW EXECUTE FUNCTION registrar_historial_venta();
