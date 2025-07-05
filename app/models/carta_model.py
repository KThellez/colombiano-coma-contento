from app.db.connection import safe_execute
import uuid

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

def crear_carta(nombre, fecha_inicio, fecha_fin):
    """
    Crea una nueva carta con fechas de vigencia.
    El ID se genera automáticamente por el trigger en la base de datos.

    Args:
        nombre (str): Nombre de la carta.
        fecha_inicio (str): Fecha de inicio.
        fecha_fin (str): Fecha de fin.

    Returns:
        str: ID de la carta creada o None si falla.
    """
    try:
        insert = """
            INSERT INTO carta (nombre, fecha_inicio, fecha_fin)
            VALUES (%s, %s, %s)
            RETURNING id_carta
        """
        result = safe_execute(insert, (nombre, fecha_inicio, fecha_fin), fetch=True)
        if result:
            id_carta = result[0][0]
            print(f"[SUCCESS] Carta insertada correctamente: {id_carta}")
            return id_carta
        else:
            print("[ERROR crear_carta] Falló el insert.")
            return None
    except Exception as e:
        import traceback
        print(f"[EXCEPTION crear_carta] {e}")
        traceback.print_exc()
        return None

def obtener_cartas():
    """
    Obtiene todas las cartas registradas.

    Returns:
        list: Lista de cartas.
    """
    try:
        query = "SELECT * FROM carta ORDER BY fecha_inicio DESC"
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_cartas] {e}")
        return []

def obtener_carta_por_id(id_carta):
    """
    Obtiene los datos de una carta específica.

    Args:
        id_carta (str): ID de la carta.

    Returns:
        list[tuple]: Datos de la carta.
    """
    try:
        query = "SELECT * FROM carta WHERE id_carta = %s"
        return safe_execute(query, (id_carta,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_carta_por_id] {e}")
        return []

def obtener_carta_vigente():
    """
    Obtiene la carta actualmente vigente según la fecha del sistema.

    Returns:
        list[tuple]: Carta vigente o lista vacía.
    """
    try:
        query = """
            SELECT * FROM carta
            WHERE CURRENT_DATE BETWEEN fecha_inicio AND fecha_fin
            ORDER BY fecha_inicio DESC
            LIMIT 1
        """
        return safe_execute(query, fetch=True)
    except Exception as e:
        print(f"[ERROR obtener_carta_vigente] {e}")
        return []

def actualizar_carta(id_carta, nombre, fecha_inicio, fecha_fin):
    """
    Actualiza los datos de una carta existente.

    Args:
        id_carta (str): ID de la carta.
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
    También elimina sus asociaciones con platos.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        id_carta (str): ID de la carta.

    Returns:
        None
    """
    try:
        # Eliminar asociaciones primero
        from app.models import detalle_carta_model
        detalle_carta_model.eliminar_todos_platos_de_carta(id_carta)

        # Luego eliminar la carta
        query = "DELETE FROM carta WHERE id_carta = %s"
        return safe_execute(query, (id_carta,))
    except Exception as e:
        print(f"[ERROR eliminar_carta] {e}")
        return None
