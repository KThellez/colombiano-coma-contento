"""
Modelo para manejar la entidad Región.

NOTA:
    Las regiones agrupan platos según su origen geográfico y tienen un encargado asignado.

Funciones incluidas:
- crear_region
- obtener_todas_regiones
- obtener_region_por_id
- actualizar_region
- eliminar_region
"""


from app.db.connection import safe_execute

def crear_region(nombre, encargado):
    """
    Crea una nueva región.

    Args:
        nombre (str): Nombre de la región.
        encargado (str): Nombre del responsable de la región.

    Returns:
        None
    """
    query ="INSERT INTO regiones (nombre, encargado) VALUES (%s, %s)"
    params =(nombre, encargado)
    return safe_execute(query, params)


def obtener_todas_regiones():
    """
    Devuelve todas las regiones registradas.

    Returns:
        list: Lista de regiones.
    """

    query ="SELECT * FROM regiones"
    return safe_execute(query, fetch=True) or []


def obtener_region_por_id(region_id):
    """
    Obtiene una región específica por su ID.

    Args:
        region_id (int): ID de la región.

    Returns:
        tuple: Datos de la región.
    """
    query ="SELECT * FROM regiones WHERE id = %s"
    params =(region_id,)
    return safe_execute(query, params, fetch=True) or []


def actualizar_region(region_id, nombre, encargado):
    """
    Actualiza el nombre y encargado de una región.

    Args:
        region_id (int): ID de la región.
        nombre (str): Nuevo nombre.
        encargado (str): Nuevo responsable.

    Returns:
        None
    """
    query ="UPDATE regiones SET nombre = %s, encargado = %s WHERE id = %s"
    params =(nombre, encargado, region_id)
    return safe_execute(query, params)


def eliminar_region(region_id):
    """
    Elimina una región de forma permanente.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        region_id (int): ID de la región.

    Returns:
        None
    """
    query ="DELETE FROM regiones WHERE id = %s"
    params =(region_id,)
    return safe_execute(query, params)

