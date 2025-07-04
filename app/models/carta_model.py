"""
Modelo para manejar la entidad Carta.

NOTA:
    Las modificaciones o eliminaciones deben ser registradas mediante triggers en una tabla histórica.

Funciones incluidas:
- crear_carta
- obtener_cartas
- obtener_carta_por_id
- actualizar_carta
- eliminar_carta
"""

from app.db.connection import safe_execute

def crear_carta(nombre, fecha_inicio, fecha_fin):
    """
    Crea una nueva carta con fechas de vigencia.

    Args:
        nombre (str): Nombre de la carta.
        fecha_inicio (str): Fecha de inicio (formato YYYY-MM-DD).
        fecha_fin (str): Fecha de fin (formato YYYY-MM-DD).

    Returns:
        None
    """
    try:
        query = """
            INSERT INTO carta (nombre, fecha_inicio, fecha_fin)
            VALUES (%s, %s, %s)
        """
        params = (nombre, fecha_inicio, fecha_fin)
        return safe_execute(query, params)
    except Exception as e:
        print(f"[ERROR crear_carta] {e}")
        return None


def obtener_cartas():
    """
    Obtiene todas las cartas registradas.

    Returns:
        list: Lista de cartas.
    """
    try:
        query = "SELECT * FROM carta"
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_cartas] {e}")
        return []


def obtener_carta_por_id(id_carta):
    """
    Obtiene los datos de una carta específica.

    Args:
        id_carta (int): ID de la carta.

    Returns:
        tuple: Datos de la carta.
    """
    try:
        query = "SELECT * FROM carta WHERE id_carta = %s"
        return safe_execute(query, (id_carta,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_carta_por_id] {e}")
        return []


def actualizar_carta(id_carta, nombre, fecha_inicio, fecha_fin):
    """
    Actualiza los datos de una carta existente.

    Args:
        id_carta (int): ID de la carta.
        nombre (str): Nuevo nombre.
        fecha_inicio (str): Nueva fecha inicio.
        fecha_fin (str): Nueva fecha fin.

    Returns:
        None
    """
    try:
        query = """
            UPDATE carta
            SET nombre = %s, fecha_inicio = %s, fecha_fin = %s
            WHERE id_carta = %s
        """
        params = (nombre, fecha_inicio, fecha_fin, id_carta)
        return safe_execute(query, params)
    except Exception as e:
        print(f"[ERROR actualizar_carta] {e}")
        return None


def eliminar_carta(id_carta):
    """
    Elimina una carta de forma permanente.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        id_carta (int): ID de la carta.

    Returns:
        None
    """
    try:
        query = "DELETE FROM carta WHERE id_carta = %s"
        return safe_execute(query, (id_carta,))
    except Exception as e:
        print(f"[ERROR eliminar_carta] {e}")
        return None
