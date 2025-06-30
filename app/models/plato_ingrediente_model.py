"""
Modelo para manejar la relación N:M entre platos e ingredientes.

NOTA:
    No se incluye función de actualización porque se asume que, en caso de cambio, el vínculo se elimina y se crea uno nuevo. 

Funciones incluidas:
- agregar_ingrediente_a_plato
- obtener_ingredientes_de_plato
- eliminar_ingrediente_de_plato
"""

from app.db.connection import safe_execute

def agregar_ingrediente_a_plato(id_plato, id_ingrediente, cantidad, descripcion):
    """
    Asocia un ingrediente a un plato con cantidad y descripción.

    Args:
        id_plato (int): ID del plato.
        id_ingrediente (int): ID del ingrediente.
        cantidad (float): Cantidad necesaria del ingrediente.
        descripcion (str): Descripción del uso en el plato.

    Returns:
        None
    """
    query ="""
                INSERT INTO plato_ingrediente (id_plato, id_ingrediente, cantidad, descripcion)
                VALUES (%s, %s, %s, %s)
            """
    params =(id_plato, id_ingrediente, cantidad, descripcion)
    return safe_execute(query, params)


def obtener_ingredientes_de_plato(id_plato):
    """
    Obtiene todos los ingredientes asignados a un plato específico.

    Args:
        id_plato (int): ID del plato.

    Returns:
        list: Lista de ingredientes con cantidad y unidad de medida.
    """
    query ="""
                SELECT i.id, i.nombre, pi.cantidad, i.unidad_medida, pi.descripcion
                FROM ingredientes i
                JOIN plato_ingrediente pi ON i.id = pi.id_ingrediente
                WHERE pi.id_plato = %s
            """
    params =(id_plato,)
    return safe_execute(query, params, fetch=True) or []
    

def eliminar_ingrediente_de_plato(id_plato, id_ingrediente):
    """
    Elimina la relación entre un ingrediente y un plato.

    Args:
        id_plato (int): ID del plato.
        id_ingrediente (int): ID del ingrediente.

    Returns:
        None
    """
    query ="""
                DELETE FROM plato_ingrediente
                WHERE id_plato = %s AND id_ingrediente = %s
            """
    params = (id_plato, id_ingrediente)
    return safe_execute(query, params)
