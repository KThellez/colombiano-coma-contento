-- Ingrediente: nombre único insensible a mayúsculas
CREATE UNIQUE INDEX ingrediente_nombre_unique ON ingrediente (LOWER(nombre));

-- Unidad de medida
CREATE UNIQUE INDEX unidad_medida_nombre_unique ON unidad_medida (LOWER(nombre));

-- Región
CREATE UNIQUE INDEX region_nombre_unique ON region (LOWER(nombre));

-- Categoría
CREATE UNIQUE INDEX categoria_nombre_unique ON categoria (LOWER(nombre));

-- Nivel de complejidad
CREATE UNIQUE INDEX nivel_complejidad_nombre_unique ON nivel_complejidad (LOWER(nombre));

-- Franja horaria
CREATE UNIQUE INDEX franja_horaria_nombre_unique ON franja_horaria (LOWER(nombre));

-- Plato
CREATE UNIQUE INDEX plato_nombre_unique ON plato (LOWER(nombre));

-- Carta
CREATE UNIQUE INDEX carta_nombre_unique ON carta (LOWER(nombre));
