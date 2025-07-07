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
    try:
        query = "INSERT INTO categoria (nombre) VALUES (%s)"
        return safe_execute(query, (nombre,))
    except Exception as e:
        print(f"[ERROR crear_categoria] {e}")
        return None


def obtener_categorias():
    """
    Obtiene todas las categorías registradas.

    Returns:
        list: Lista de categorías.
    """
    try:
        query = "SELECT * FROM categoria"
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_categorias] {e}")
        return []


def obtener_categoria_por_id(id_categoria):
    """
    Obtiene una categoría por su ID.

    Args:
        id_categoria (int): ID de la categoría.

    Returns:
        tuple: Datos de la categoría.
    """
    try:
        query = "SELECT * FROM categoria WHERE id_categoria = %s"
        return safe_execute(query, (id_categoria,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_categoria_por_id] {e}")
        return []


def actualizar_categoria(id_categoria, nuevo_nombre):
    """
    Actualiza el nombre de una categoría.

    Args:
        id_categoria (int): ID de la categoría.
        nuevo_nombre (str): Nuevo nombre.

    Returns:
        None
    """
    try:
        query = "UPDATE categoria SET nombre = %s WHERE id_categoria = %s"
        return safe_execute(query, (nuevo_nombre, id_categoria))
    except Exception as e:
        print(f"[ERROR actualizar_categoria] {e}")
        return None


def eliminar_categoria(id_categoria):
    """
    Elimina una categoría de forma permanente.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        id_categoria (int): ID de la categoría.

    Returns:
        None
    """
    try:
        query = "DELETE FROM categoria WHERE id_categoria = %s"
        return safe_execute(query, (id_categoria,))
    except Exception as e:
        print(f"[ERROR eliminar_categoria] {e}")
        return None
