--============ NOTA!==============---
--===Para la insersión inicial es ===---
--===necesario Desactivar todos   ===---
--===los triggers y posteriormente===---
--===reactivarlos                 ===---


-- Desactivar triggers de auditoría e IDs
ALTER TABLE categoria DISABLE TRIGGER trigger_categoria_auditoria;
ALTER TABLE carta DISABLE TRIGGER trigger_carta_auditoria;
ALTER TABLE plato DISABLE TRIGGER trigger_plato_auditoria;
ALTER TABLE region DISABLE TRIGGER trigger_region_auditoria;
ALTER TABLE usuario DISABLE TRIGGER trigger_usuario_auditoria;
ALTER TABLE ingrediente DISABLE TRIGGER trigger_ingrediente_auditoria;
ALTER TABLE venta DISABLE TRIGGER trigger_venta_auditoria;

-- Desactivar triggers de generación de IDs
ALTER TABLE carta DISABLE TRIGGER trigger_id_carta;
ALTER TABLE venta DISABLE TRIGGER trigger_generar_id_venta;
ALTER TABLE region DISABLE TRIGGER trigger_generar_id_region;


--============ INSERTS IMPORANTES==============---
-- INSERT unidad medida --
INSERT INTO unidad_medida VALUES(1, 'gr');
INSERT INTO unidad_medida VALUES(2, 'ml');
INSERT INTO unidad_medida VALUES(3, 'und');


-- INSERT region --
INSERT INTO region VALUES('ca_co', 'Caribe', 'María González');
INSERT INTO region VALUES('pa_co', 'Pacífico', 'Carlos Rodríguez');
INSERT INTO region VALUES('or_co', 'Orinoquía', 'Ana Martínez');
INSERT INTO region VALUES('am_co', 'Amazonía', 'Luis García');
INSERT INTO region VALUES('an_co', 'Andina', 'Diana López');
INSERT INTO region VALUES('in_co', 'Insular', 'Roberto Silva');

--  INSERT nivel_complejidad
INSERT INTO nivel_complejidad VALUES(1, 'fácil');
INSERT INTO nivel_complejidad VALUES(2, 'intermedio');
INSERT INTO nivel_complejidad VALUES(3, 'difícil');



-- INSERT franja_horaria 
INSERT INTO franja_horaria VALUES(1, 'Desayuno');
INSERT INTO franja_horaria VALUES(2, 'Almuerzo');
INSERT INTO franja_horaria VALUES(3, 'Cena');



--=== REACTIVACION DE TRIGGERS ===---
-- Activar triggers de auditoría e IDs
ALTER TABLE categoria ENABLE TRIGGER trigger_categoria_auditoria;
ALTER TABLE carta ENABLE TRIGGER trigger_carta_auditoria;
ALTER TABLE plato ENABLE TRIGGER trigger_plato_auditoria;
ALTER TABLE region ENABLE TRIGGER trigger_region_auditoria;
ALTER TABLE usuario ENABLE TRIGGER trigger_usuario_auditoria;
ALTER TABLE ingrediente ENABLE TRIGGER trigger_ingrediente_auditoria;
ALTER TABLE venta ENABLE TRIGGER trigger_venta_auditoria;

-- Activar triggers de generación de IDs
ALTER TABLE carta ENABLE TRIGGER trigger_id_carta;
ALTER TABLE venta ENABLE TRIGGER trigger_generar_id_venta;
ALTER TABLE region ENABLE TRIGGER trigger_generar_id_region;

