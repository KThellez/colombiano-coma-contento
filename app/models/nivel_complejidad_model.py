"""
Modelo para manejar la entidad Nivel de Complejidad.

NOTA:
    Representa los niveles de dificultad de preparación de los platos (ej: Fácil, Medio, Difícil).

Funciones incluidas:
- crear_nivel_complejidad
- obtener_niveles_complejidad
- obtener_nivel_por_id
- actualizar_nivel_complejidad
- eliminar_nivel_complejidad
"""

from app.db.connection import safe_execute

def crear_nivel_complejidad(nombre):
    """
    Crea un nuevo nivel de complejidad.

    Args:
        nombre (str): Nombre del nivel (ej: Fácil, Intermedio, Difícil).

    Returns:
        None
    """
    try:
        query = "INSERT INTO nivel_complejidad (nombre) VALUES (%s)"
        return safe_execute(query, (nombre,))
    except Exception as e:
        print(f"[ERROR crear_nivel_complejidad] {e}")
        return None


def obtener_niveles_complejidad():
    """
    Obtiene todos los niveles de complejidad existentes.

    Returns:
        list: Lista de niveles.
    """
    try:
        query = "SELECT * FROM nivel_complejidad"
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_niveles_complejidad] {e}")
        return []


def obtener_nivel_por_id(id_nivel):
    """
    Obtiene un nivel de complejidad por ID.

    Args:
        id_nivel (int): ID del nivel.

    Returns:
        tuple: Datos del nivel.
    """
    try:
        query = "SELECT * FROM nivel_complejidad WHERE id_nivel_complejidad = %s"
        return safe_execute(query, (id_nivel,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_nivel_por_id] {e}")
        return []


def actualizar_nivel_complejidad(id_nivel, nuevo_nombre):
    """
    Actualiza el nombre de un nivel de complejidad.

    Args:
        id_nivel (int): ID del nivel.
        nuevo_nombre (str): Nuevo nombre.

    Returns:
        None
    """
    try:
        query = "UPDATE nivel_complejidad SET nombre = %s WHERE id_nivel_complejidad = %s"
        return safe_execute(query, (nuevo_nombre, id_nivel))
    except Exception as e:
        print(f"[ERROR actualizar_nivel_complejidad] {e}")
        return None


def eliminar_nivel_complejidad(id_nivel):
    """
    Elimina un nivel de complejidad.

    Args:
        id_nivel (int): ID del nivel.

    Returns:
        None
    """
    try:
        query = "DELETE FROM nivel_complejidad WHERE id_nivel_complejidad = %s"
        return safe_execute(query, (id_nivel,))
    except Exception as e:
        print(f"[ERROR eliminar_nivel_complejidad] {e}")
        return None
