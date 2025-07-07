-- =============================
-- DROP de funciones existentes
-- =============================
DROP FUNCTION IF EXISTS sp_ventas_por_dificultad();
DROP FUNCTION IF EXISTS sp_top_ingredientes_usados();
DROP FUNCTION IF EXISTS sp_platos_por_categoria_mes();
DROP FUNCTION IF EXISTS sp_precio_promedio_por_region();
DROP FUNCTION IF EXISTS sp_ventas_por_dia_semana();
DROP FUNCTION IF EXISTS sp_top_platos_por_franja();
DROP FUNCTION IF EXISTS sp_platos_por_region_dificultad();

-- =============================
-- SP 1: Ventas por Dificultad
-- =============================
CREATE OR REPLACE FUNCTION sp_ventas_por_dificultad()
RETURNS TABLE (nivel VARCHAR, total_vendidos BIGINT) AS $$
BEGIN
  RETURN QUERY
  SELECT nc.nombre, SUM(f.cantidad)
  FROM facturar f
  JOIN plato p ON p.id_plato = f.id_plato_fk
  JOIN nivel_complejidad nc ON nc.id_nivel_complejidad = p.id_nivel_complejidad_fk
  GROUP BY nc.nombre
  ORDER BY SUM(f.cantidad) DESC;
END;
$$ LANGUAGE plpgsql;

-- =============================
-- SP 2: Ingredientes más usados
-- =============================
CREATE OR REPLACE FUNCTION sp_top_ingredientes_usados()
RETURNS TABLE (ingrediente VARCHAR, usos BIGINT) AS $$
BEGIN
  RETURN QUERY
  SELECT i.nombre, COUNT(*)
  FROM contener c
  JOIN ingrediente i ON i.id_ingrediente = c.id_ingrediente_fk
  GROUP BY i.nombre
  ORDER BY COUNT(*) DESC
  LIMIT 10;
END;
$$ LANGUAGE plpgsql;

-- =============================
-- SP 3: Platos por Categoría por Mes
-- =============================
CREATE OR REPLACE FUNCTION sp_platos_por_categoria_mes()
RETURNS TABLE (mes TEXT, categoria VARCHAR, total BIGINT) AS $$
BEGIN
  RETURN QUERY
  SELECT TO_CHAR(v.fecha, 'Mon') AS mes, c.nombre, COUNT(*)
  FROM venta v
  JOIN facturar f ON f.id_venta_fk = v.id_venta
  JOIN plato p ON p.id_plato = f.id_plato_fk
  JOIN categoria c ON c.id_categoria = p.id_categoria_fk
  GROUP BY mes, c.nombre
  ORDER BY mes, c.nombre;
END;
$$ LANGUAGE plpgsql;

-- =============================
-- SP 4: Precio Promedio por Región
-- =============================
CREATE OR REPLACE FUNCTION sp_precio_promedio_por_region()
RETURNS TABLE (region VARCHAR, promedio NUMERIC) AS $$
BEGIN
  RETURN QUERY
  SELECT r.nombre, ROUND(AVG(p.precio), 2)
  FROM plato p
  JOIN region r ON r.id_region = p.id_region_fk
  GROUP BY r.nombre
  ORDER BY ROUND(AVG(p.precio), 2) DESC;
END;
$$ LANGUAGE plpgsql;

-- =============================
-- SP 5: Ventas por Día de la Semana
-- =============================
CREATE OR REPLACE FUNCTION sp_ventas_por_dia_semana()
RETURNS TABLE (dia TEXT, total BIGINT) AS $$
BEGIN
  RETURN QUERY
  SELECT TO_CHAR(fecha, 'Day') AS dia, COUNT(*)
  FROM venta
  GROUP BY dia
  ORDER BY COUNT(*) DESC;
END;
$$ LANGUAGE plpgsql;

-- =============================
-- SP 6: Top Platos por Franja Horaria
-- =============================
CREATE OR REPLACE FUNCTION sp_top_platos_por_franja()
RETURNS TABLE (franja VARCHAR, plato VARCHAR, total BIGINT) AS $$
BEGIN
  RETURN QUERY
  SELECT fh.nombre, p.nombre, SUM(f.cantidad)
  FROM facturar f
  JOIN venta v ON v.id_venta = f.id_venta_fk
  JOIN plato p ON p.id_plato = f.id_plato_fk
  JOIN franja_horaria fh ON fh.id_franja_horaria = v.id_franja_horaria_fk
  GROUP BY fh.nombre, p.nombre
  ORDER BY fh.nombre, SUM(f.cantidad) DESC;
END;
$$ LANGUAGE plpgsql;

-- =============================
-- SP 7: Distribución de Platos por Región y Dificultad
-- =============================
CREATE OR REPLACE FUNCTION sp_platos_por_region_dificultad()
RETURNS TABLE (region VARCHAR, dificultad VARCHAR, total BIGINT) AS $$
BEGIN
  RETURN QUERY
  SELECT r.nombre, nc.nombre, COUNT(*)
  FROM plato p
  JOIN region r ON r.id_region = p.id_region_fk
  JOIN nivel_complejidad nc ON nc.id_nivel_complejidad = p.id_nivel_complejidad_fk
  GROUP BY r.nombre, nc.nombre
  ORDER BY r.nombre, nc.nombre;
END;
$$ LANGUAGE plpgsql;
