"""
Modelo para manejar la relación N:M entre ventas y platos.

NOTA:
    No se actualiza una línea de venta (detalle_venta). Si se desea cambiar, debe eliminarse y volver a insertarse con los nuevos datos.
    Con esto no es suceptible a modificaciones dentro de los detalles de cada venta. 

Funciones incluidas:
- agregar_plato_a_venta
- obtener_detalle_venta
- crear_detalle_venta
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
    try:
        query = """
            INSERT INTO facturar (id_venta_fk, id_plato_fk, cantidad, precio_unitario)
            VALUES (%s, %s, %s, %s)
        """
        params = (id_venta, id_plato, cantidad, precio_unitario)
        return safe_execute(query, params)
    except Exception as e:
        print(f"[ERROR agregar_plato_a_venta] {e}")
        return None


def obtener_detalle_venta(id_venta):
    """
    Obtiene los platos vendidos en una venta específica.

    Args:
        id_venta (int): ID de la venta.

    Returns:
        list: Lista con nombre del plato, cantidad y precio.
    """
    try:
        query = """
            SELECT p.nombre, f.cantidad, f.precio_unitario
            FROM facturar f
            JOIN plato p ON p.id_plato = f.id_plato_fk
            WHERE f.id_venta_fk = %s
        """
        return safe_execute(query, (id_venta,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_detalle_venta] {e}")
        return []


def crear_detalle_venta(id_venta, id_plato, cantidad, precio_unitario):
    """
    Función duplicada de agregar_plato_a_venta, útil si se llama desde otro flujo.

    Args:
        id_venta (int)
        id_plato (int)
        cantidad (int)
        precio_unitario (float)

    Returns:
        None
    """
    try:
        query = """
            INSERT INTO facturar (id_venta_fk, id_plato_fk, cantidad, precio_unitario)
            VALUES (%s, %s, %s, %s)
        """
        params = (id_venta, id_plato, cantidad, precio_unitario)
        return safe_execute(query, params)
    except Exception as e:
        print(f"[ERROR crear_detalle_venta] {e}")
        return None
