"""
Modelo para manejar la entidad Categoría.

NOTA:
    Las categorías agrupan platos según tipo (ej. entrada, bebida, postre).
    Para mantener un historial, debe manejarse a través de triggers.

Funciones incluidas:
- crear_categoria
- obtener_categorias
- obtener_categoria_por_id
- actualizar_categoria
- eliminar_categoria
"""


from app.db.connection import safe_execute

def crear_categoria(nombre):
    """
    Crea una nueva categoría.

    Args:
        nombre (str): Nombre de la categoría.

    Returns:
        None
    """

    query ="INSERT INTO categorias (nombre) VALUES (%s)"
    params =(nombre,)
    return safe_execute(query, params)


def obtener_categorias():
    """
    Obtiene todas las categorías registradas.

    Returns:
        list: Lista de categorías.
    """
    query ="SELECT * FROM categorias"
    return safe_execute(query, fetch=True) or []


def obtener_categoria_por_id(id_categoria):
    """
    Obtiene una categoría por su ID.

    Args:
        id_categoria (int): ID de la categoría.

    Returns:
        tuple: Datos de la categoría.
    """
    query ="SELECT * FROM categorias WHERE id = %s"
    params =(id_categoria,)
    return safe_execute(query, params, fetch=True) or []


def actualizar_categoria(id_categoria, nuevo_nombre):
    """
    Actualiza el nombre de una categoría.

    Args:
        id_categoria (int): ID de la categoría.
        nuevo_nombre (str): Nuevo nombre.

    Returns:
        None
    """
    query ="UPDATE categorias SET nombre = %s WHERE id = %s"
    params =(nuevo_nombre, id_categoria)
    return safe_execute(query, params)


def eliminar_categoria(id_categoria):
    """
    Elimina una categoría de forma permanente.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        id_categoria (int): ID de la categoría.

    Returns:
        None
    """
    query ="DELETE FROM categorias WHERE id = %s"
    params =(id_categoria,)
    return safe_execute(query, params)

