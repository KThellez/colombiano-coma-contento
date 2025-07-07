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


--============ INSERTS USUARIO==============---

INSERT INTO usuario (username, password, rol)
VALUES ('Master', 'pbkdf2:sha256:1000000$qOhsubRV$60bb580f7208152de0e259188fd6bef65695d64b8fa891d8106d28cb91b84e28', 'admin');

--============ INSERTS A==============---


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

