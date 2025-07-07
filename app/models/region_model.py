"""
Modelo para manejar la entidad Región.

NOTA:
    Las regiones agrupan platos según su origen geográfico y tienen un encargado asignado.

Funciones incluidas:
- crear_region
- obtener_todas_regiones
- obtener_region_por_id
- actualizar_region
- eliminar_region
"""

from app.db.connection import safe_execute

def crear_region(nombre, encargado):
    """
    Crea una nueva región.

    Args:
        nombre (str): Nombre de la región.
        encargado (str): Nombre del responsable de la región.

    Returns:
        None
    """
    try:
        query = "INSERT INTO region (nombre, encargado) VALUES (%s, %s)"
        return safe_execute(query, (nombre, encargado))
    except Exception as e:
        print(f"[ERROR crear_region] {e}")
        return None


def obtener_todas_regiones():
    """
    Devuelve todas las regiones registradas.

    Returns:
        list: Lista de regiones.
    """
    try:
        query = "SELECT * FROM region"
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_todas_regiones] {e}")
        return []


def obtener_region_por_id(region_id):
    """
    Obtiene una región específica por su ID.

    Args:
        region_id (int): ID de la región.

    Returns:
        tuple: Datos de la región.
    """
    try:
        query = "SELECT * FROM region WHERE id_region = %s"
        return safe_execute(query, (region_id,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_region_por_id] {e}")
        return []


def actualizar_region(region_id, nombre, encargado):
    """
    Actualiza el nombre y encargado de una región.

    Args:
        region_id (int): ID de la región.
        nombre (str): Nuevo nombre.
        encargado (str): Nuevo responsable.

    Returns:
        None
    """
    try:
        query = "UPDATE region SET nombre = %s, encargado = %s WHERE id_region = %s"
        return safe_execute(query, (nombre, encargado, region_id))
    except Exception as e:
        print(f"[ERROR actualizar_region] {e}")
        return None


def eliminar_region(region_id):
    """
    Elimina una región de forma permanente.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        region_id (int): ID de la región.

    Returns:
        None
    """
    try:
        query = "DELETE FROM region WHERE id_region = %s"
        return safe_execute(query, (region_id,))
    except Exception as e:
        print(f"[ERROR eliminar_region] {e}")
        return None
