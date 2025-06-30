"""
Modelo para manejar la relación N:M entre platos y franjas horarias.

NOTA:
    No se incluye función de actualización. Para modificar la franja, se elimina la relación y se crea una nueva.

Funciones incluidas:
- asignar_franja_a_plato
- obtener_franjas_de_plato
- eliminar_franja_de_plato
"""


from app.db.connection import safe_execute

def asignar_franja_a_plato(id_plato, id_franja):
    """
    Asocia una franja horaria a un plato.

    Args:
        id_plato (int): ID del plato.
        id_franja (int): ID de la franja horaria.

    Returns:
        None
    """
    query ="""
                INSERT INTO plato_franja_horaria (id_plato, id_franja)
                VALUES (%s, %s)
            """
    params =(id_plato, id_franja)
    return safe_execute(query, params)


def obtener_franjas_de_plato(id_plato):
    """
    Obtiene las franjas horarias en las que se puede consumir un plato.

    Args:
        id_plato (int): ID del plato.

    Returns:
        list: Lista de franjas horarias.
    """

    query ="""
                SELECT f.id, f.nombre
                FROM franjas_horarias f
                JOIN plato_franja_horaria pf ON f.id = pf.id_franja
                WHERE pf.id_plato = %s
            """
    params =(id_plato,)
    return safe_execute(query, params, fetch=True) or []


def eliminar_franja_de_plato(id_plato, id_franja):
    """
    Elimina una franja horaria asociada a un plato.

    Args:
        id_plato (int): ID del plato.
        id_franja (int): ID de la franja horaria.

    Returns:
        None
    """
    query ="""
                DELETE FROM plato_franja_horaria
                WHERE id_plato = %s AND id_franja = %s
            """
    params =(id_plato, id_franja)
    return safe_execute(query, params)
    