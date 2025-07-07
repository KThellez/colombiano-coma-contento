"""
Modelo para manejar la entidad Unidad de Medida.

NOTA:
    Esta tabla representa las unidades usadas en ingredientes (ej: gramos, mililitros, unidades).

Funciones incluidas:
- crear_unidad_medida
- obtener_unidades_medida
- obtener_unidad_por_id
- actualizar_unidad_medida
- eliminar_unidad_medida
"""

from app.db.connection import safe_execute

def crear_unidad_medida(nombre):
    """
    Crea una nueva unidad de medida.

    Args:
        nombre (str): Nombre de la unidad (ej: gramos, ml).

    Returns:
        None
    """
    try:
        query = "INSERT INTO unidad_medida (nombre) VALUES (%s)"
        return safe_execute(query, (nombre,))
    except Exception as e:
        print(f"[ERROR crear_unidad_medida] {e}")
        return None


def obtener_unidades_medida():
    """
    Retorna todas las unidades de medida registradas.

    Returns:
        list: Lista de unidades de medida.
    """
    try:
        query = "SELECT * FROM unidad_medida"
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_unidades_medida] {e}")
        return []


def obtener_unidad_por_id(id_unidad):
    """
    Obtiene una unidad de medida por su ID.

    Args:
        id_unidad (int): ID de la unidad de medida.

    Returns:
        tuple: Datos de la unidad.
    """
    try:
        query = "SELECT * FROM unidad_medida WHERE id_unidad_medida = %s"
        return safe_execute(query, (id_unidad,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_unidad_por_id] {e}")
        return []


def actualizar_unidad_medida(id_unidad, nuevo_nombre):
    """
    Actualiza el nombre de una unidad de medida.

    Args:
        id_unidad (int): ID de la unidad.
        nuevo_nombre (str): Nuevo nombre.

    Returns:
        None
    """
    try:
        query = "UPDATE unidad_medida SET nombre = %s WHERE id_unidad_medida = %s"
        return safe_execute(query, (nuevo_nombre, id_unidad))
    except Exception as e:
        print(f"[ERROR actualizar_unidad_medida] {e}")
        return None


def eliminar_unidad_medida(id_unidad):
    """
    Elimina una unidad de medida.

    Args:
        id_unidad (int): ID de la unidad.

    Returns:
        None
    """
    try:
        query = "DELETE FROM unidad_medida WHERE id_unidad_medida = %s"
        return safe_execute(query, (id_unidad,))
    except Exception as e:
        print(f"[ERROR eliminar_unidad_medida] {e}")
        return None
