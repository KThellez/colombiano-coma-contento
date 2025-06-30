"""
Modelo para manejar la relación N:M entre cartas y platos.

NOTA:
    No hay función de actualización ya que modificar un plato en una carta es equivalente a quitarlo y volverlo a agregar.

Funciones incluidas:
- agregar_plato_a_carta
- obtener_platos_de_carta
- eliminar_plato_de_carta
"""


from app.db.connection import safe_execute

def agregar_plato_a_carta(id_carta, id_plato):
    """
    Asocia un plato a una carta.

    Args:
        id_carta (int): ID de la carta.
        id_plato (int): ID del plato.

    Returns:
        None
    """
    query ="""
                INSERT INTO detalle_carta (id_carta, id_plato)
                VALUES (%s, %s)
            """
    params =(id_carta, id_plato)
    return safe_execute(query, params)


def obtener_platos_de_carta(id_carta):
    """
    Lista los platos incluidos en una carta.

    Args:
        id_carta (int): ID de la carta.

    Returns:
        list: Lista de platos.
    """
    query ="""
                SELECT p.id, p.nombre, p.precio_venta
                FROM platos p
                JOIN detalle_carta dc ON p.id = dc.id_plato
                WHERE dc.id_carta = %s AND p.disponible = TRUE
            """
    params =(id_carta,)
    return safe_execute(query, params, fetch=True) or []


def eliminar_plato_de_carta(id_carta, id_plato):
    """
    Elimina un plato de una carta.

    Args:
        id_carta (int): ID de la carta.
        id_plato (int): ID del plato.

    Returns:
        None
    """
    query ="""
                DELETE FROM detalle_carta
                WHERE id_carta = %s AND id_plato = %s
            """
    params =(id_carta, id_plato)
    return safe_execute(query, params)

