
"""
Modelo para manejar la entidad Venta.

NOTA:
    Para mantener un histórico financiero, se usan triggers que guarden las ventas y detalles al eliminar.

Funciones incluidas:
- registrar_venta
- obtener_ventas
- obtener_venta_por_id
- eliminar_venta
"""


from app.db.connection import safe_execute

def registrar_venta(franja_horaria_id):
    """
    Registra una nueva venta con franja horaria.

    Args:
        franja_horaria_id (int): ID de la franja horaria asociada.

    Returns:
        int: ID de la venta registrada.
    """
    query ="""
                INSERT INTO ventas (franja_horaria_id)
                VALUES (%s)
                RETURNING id
            """
    params =(franja_horaria_id,)
    return safe_execute(query, params)
    

def obtener_ventas():
    """
    Devuelve todas las ventas registradas.

    Returns:
        list: Lista de ventas.
    """

    query ="""
                SELECT v.id, v.fecha, f.nombre AS franja
                FROM ventas v
                JOIN franjas_horarias f ON v.franja_horaria_id = f.id
            """
    
    return safe_execute(query, fetch=True) or []


def obtener_venta_por_id(id_venta):
    """
    Obtiene los datos de una venta específica.

    Args:
        id_venta (int): ID de la venta.

    Returns:
        tuple: Datos de la venta.
    """

    query ="SELECT * FROM ventas WHERE id = %s"
    params =(id_venta,)
    return safe_execute(query, params, fetch=True) or []


def eliminar_venta(id_venta):
    """
    Elimina una venta permanentemente.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        id_venta (int): ID de la venta.

    Returns:
        None
    """
    query ="DELETE FROM ventas WHERE id = %s"
    params =(id_venta,)
    return safe_execute(query, params)

