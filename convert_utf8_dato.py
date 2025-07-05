from app.db.connection import safe_execute

safe_execute("UPDATE nivel_complejidad SET nombre = %s WHERE id_nivel_complejidad = 1", ("fácil",))
safe_execute("UPDATE nivel_complejidad SET nombre = %s WHERE id_nivel_complejidad = 2", ("intermedio",))
safe_execute("UPDATE nivel_complejidad SET nombre = %s WHERE id_nivel_complejidad = 3", ("difícil",))
