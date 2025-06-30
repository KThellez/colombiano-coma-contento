"""
Modelo para manejar la relación N:M entre ventas y platos.

NOTA:
    No se actualiza una línea de venta (detalle_venta). Si se desea cambiar, debe eliminarse y volver a insertarse con los nuevos datos.
    Con esto no es suseptible a modificaciones dentro de los detalles de cada venta. 

Funciones incluidas:
- agregar_plato_a_venta
- obtener_detalle_venta
"""


from app.db.connection import safe_execute

def agregar_plato_a_venta(id_venta, id_plato, cantidad, precio_unitario):
    """
    Agrega un plato al detalle de una venta.

    Args:
        id_venta (int): ID de la venta.
        id_plato (int): ID del plato vendido.
        cantidad (int): Cantidad vendida.
        precio_unitario (float): Precio del plato en ese momento.

    Returns:
        None
    """
    query ="""
                INSERT INTO detalle_venta (id_venta, id_plato, cantidad, precio_unitario)
                VALUES (%s, %s, %s, %s)
            """
    params =(id_venta, id_plato, cantidad, precio_unitario)
    return safe_execute(query, params, fetch=True)


def obtener_detalle_venta(id_venta):
    """
    Obtiene los platos vendidos en una venta específica.

    Args:
        id_venta (int): ID de la venta.

    Returns:
        list: Lista con nombre del plato, cantidad y precio.
    """

    query ="""
                SELECT p.nombre, dv.cantidad, dv.precio_unitario
                FROM detalle_venta dv
                JOIN platos p ON p.id = dv.id_plato
                WHERE dv.id_venta = %s
            """
    params =(id_venta,)
    return safe_execute(query, params, fetch=True) or []

