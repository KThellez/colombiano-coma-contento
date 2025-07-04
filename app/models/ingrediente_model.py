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

def crear_ingrediente(nombre, unidad_id):
    """
    Crea un nuevo ingrediente.

    Args:
        nombre (str): Nombre del ingrediente.
        id_unidad (int): ID de la unidad de medida.

    Returns:
        None
    """
    try:
        query = "INSERT INTO ingrediente (nombre, id_unidad_medida_fk) VALUES (%s, %s)"

        return safe_execute(query, (nombre, unidad_id))
    except Exception as e:
        print(f"[ERROR crear_ingrediente] {e}")
        return None


def obtener_ingredientes():
    """
    Devuelve todos los ingredientes registrados, con su unidad de medida.

    Returns:
        list: Lista de ingredientes.
    """
    try:
        query = """
            SELECT i.id_ingrediente, i.nombre, u.nombre AS unidad
            FROM ingrediente i
            JOIN unidad_medida u ON i.id_unidad_medida_fk = u.id_unidad_medida
        """
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_ingredientes] {e}")
        return []

def obtener_unidades():
    """
    Obtiene todas las unidades de medidas disponibles
    """
    query = "SELECT id, nombre FROM unidad_medida ORDER BY nombre"
    return safe_execute(query, fetch=True) or []

def obtener_ingrediente_por_id(id_ingrediente):
    """
    Obtiene un ingrediente por ID.

    Args:
        id_ingrediente (int): ID del ingrediente.

    Returns:
        tuple: Datos del ingrediente.
    """
    try:
        query = """
            SELECT i.id_ingrediente, i.nombre, u.nombre AS unidad
            FROM ingrediente i
            JOIN unidad_medida u ON i.id_unidad_medida_fk = u.id_unidad_medida
            WHERE i.id_ingrediente = %s
        """
        return safe_execute(query, (id_ingrediente,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_ingrediente_por_id] {e}")
        return []


def actualizar_ingrediente(id_ingrediente, nuevo_nombre, nueva_unidad_fk):
    """
    Actualiza los datos de un ingrediente.

    Args:
        id_ingrediente (int): ID del ingrediente.
        nuevo_nombre (str): Nuevo nombre.
        nueva_unidad_fk (int): Nuevo ID de unidad de medida.

    Returns:
        None
    """
    try:
        query = """
            UPDATE ingrediente
            SET nombre = %s, id_unidad_medida_fk = %s
            WHERE id_ingrediente = %s
        """
        return safe_execute(query, (nuevo_nombre, nueva_unidad_fk, id_ingrediente))
    except Exception as e:
        print(f"[ERROR actualizar_ingrediente] {e}")
        return None


def eliminar_ingrediente(id_ingrediente):
    """
    Elimina un ingrediente de forma permanente.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        id_ingrediente (int): ID del ingrediente.

    Returns:
        None
    """
    try:
        query = "DELETE FROM ingrediente WHERE id_ingrediente = %s"
        return safe_execute(query, (id_ingrediente,))
    except Exception as e:
        print(f"[ERROR eliminar_ingrediente] {e}")
        return None
    
def existe_ingrediente(nombre):
    """
    Verifica si ya existe un ingrediente con ese nombre (insensible a mayúsculas).
    """
    try:
        query = "SELECT COUNT(*) FROM ingrediente WHERE LOWER(nombre) = LOWER(%s)"
        resultado = safe_execute(query, (nombre,), fetch=True)
        return resultado[0][0] > 0
    except Exception as e:
        print(f"[ERROR existe_ingrediente] {e}")
        return False

