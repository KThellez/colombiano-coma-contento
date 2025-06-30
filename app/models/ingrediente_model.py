"""
Modelo para manejar la entidad Ingrediente.

NOTA:
    Cada ingrediente tiene una unidad de medida y puede estar asociado a múltiples platos.

Funciones incluidas:
- crear_ingrediente
- obtener_ingredientes
- obtener_ingrediente_por_id
- actualizar_ingrediente
- eliminar_ingrediente
"""


from app.db.connection import safe_execute

def crear_ingrediente(nombre, unidad):
    """
    Crea un nuevo ingrediente.

    Args:
        nombre (str): Nombre del ingrediente.
        unidad (str): Unidad de medida (ej. gramos, ml).

    Returns:
        None
    """
    query ="INSERT INTO ingredientes (nombre, unidad_medida) VALUES (%s, %s)"
    params =(nombre, unidad)
    return safe_execute(query, params)


def obtener_ingredientes():
    """
    Devuelve todos los ingredientes registrados.

    Returns:
        list: Lista de ingredientes.
    """
    query ="SELECT * FROM ingredientes"
    return safe_execute(query, fetch=True) or []


def obtener_ingrediente_por_id(id_ingrediente):
    """
    Obtiene un ingrediente por ID.

    Args:
        id_ingrediente (int): ID del ingrediente.

    Returns:
        tuple: Datos del ingrediente.
    """
    query ="SELECT * FROM ingredientes WHERE id = %s"
    params =(id_ingrediente,)
    return safe_execute(query, params, fetch=True) or []


def actualizar_ingrediente(id_ingrediente, nuevo_nombre, nueva_unidad):
    """
    Actualiza los datos de un ingrediente.

    Args:
        id_ingrediente (int): ID del ingrediente.
        nuevo_nombre (str): Nuevo nombre.
        nueva_unidad (str): Nueva unidad de medida.

    Returns:
        None
    """
    query ="UPDATE ingredientes SET nombre = %s, unidad_medida = %s WHERE id = %s"
    params =(nuevo_nombre, nueva_unidad, id_ingrediente)
    return safe_execute(query, params)


def eliminar_ingrediente(id_ingrediente):
    """
    Elimina un ingrediente de forma permanente.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        id_ingrediente (int): ID del ingrediente.

    Returns:
        None
    """
    query ="DELETE FROM ingredientes WHERE id = %s"
    params =(id_ingrediente,)
    return safe_execute(query, params)
