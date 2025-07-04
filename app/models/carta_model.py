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
    
    query ="""
                INSERT INTO cartas (nombre, fecha_inicio, fecha_fin)
                VALUES (%s, %s, %s)
            """
    params = (nombre, fecha_inicio, fecha_fin)
    
    return safe_execute(query, params)
    
def obtener_cartas():
    """
    Obtiene todas las cartas registradas.

    Returns:
        list: Lista de cartas.
    """
    query = "SELECT * FROM cartas"

    return safe_execute(query, fetch=True) or []


def obtener_carta_por_id(id_carta):
    """
    Obtiene los datos de una carta específica.

    Args:
        id_carta (int): ID de la carta.

    Returns:
        tuple: Datos de la carta.
    """
    query ="SELECT * FROM cartas WHERE id = %s"
    params =(id_carta,)
    return safe_execute(query, params, fetch=True) or[]
    

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
    query ="""
                UPDATE cartas
                SET nombre = %s, fecha_inicio = %s, fecha_fin = %s
                WHERE id = %s
            """
    params =(nombre, fecha_inicio, fecha_fin, id_carta)
    return safe_execute(query, params)
    

def eliminar_carta(id_carta):
    """
    Elimina una carta de forma permanente.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        id_carta (int): ID de la carta.

    Returns:
        None
    """
    query = "DELETE FROM cartas WHERE id = %s"
    params =(id_carta,)
    return safe_execute(query, params)
