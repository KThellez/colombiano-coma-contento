"""
Modelo para manejar la entidad Franja Horaria.

NOTA:
    Las franjas horarias indican en qué momento del día se consumen los platos
    (desayuno, almuerzo, cena).

Funciones incluidas:
- crear_franja
- obtener_franjas
- obtener_franja_por_id
- actualizar_franja
- eliminar_franja
"""

from app.db.connection import safe_execute

def crear_franja(nombre):
    """
    Crea una nueva franja horaria.

    Args:
        nombre (str): Nombre de la franja (ej. desayuno).

    Returns:
        None
    """
    try:
        query = "INSERT INTO franja_horaria (nombre) VALUES (%s)"
        return safe_execute(query, (nombre,))
    except Exception as e:
        print(f"[ERROR crear_franja] {e}")
        return None


def obtener_franjas():
    """
    Devuelve todas las franjas horarias existentes.

    Returns:
        list: Lista de franjas horarias.
    """
    try:
        query = "SELECT * FROM franja_horaria"
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_franjas] {e}")
        return []


def obtener_franja_por_id(id_franja):
    """
    Obtiene una franja horaria específica por su ID.

    Args:
        id_franja (int): ID de la franja horaria.

    Returns:
        tuple: Datos de la franja.
    """
    try:
        query = "SELECT * FROM franja_horaria WHERE id_franja_horaria = %s"
        return safe_execute(query, (id_franja,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_franja_por_id] {e}")
        return []


def actualizar_franja(id_franja, nuevo_nombre):
    """
    Actualiza el nombre de una franja horaria.

    Args:
        id_franja (int): ID de la franja.
        nuevo_nombre (str): Nuevo nombre.

    Returns:
        None
    """
    try:
        query = "UPDATE franja_horaria SET nombre = %s WHERE id_franja_horaria = %s"
        return safe_execute(query, (nuevo_nombre, id_franja))
    except Exception as e:
        print(f"[ERROR actualizar_franja] {e}")
        return None


def eliminar_franja(id_franja):
    """
    Elimina una franja horaria.

    Args:
        id_franja (int): ID de la franja.

    Returns:
        None
    """
    try:
        query = "DELETE FROM franja_horaria WHERE id_franja_horaria = %s"
        return safe_execute(query, (id_franja,))
    except Exception as e:
        print(f"[ERROR eliminar_franja] {e}")
        return None
