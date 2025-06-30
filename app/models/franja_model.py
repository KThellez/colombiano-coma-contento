"""
Modelo para manejar la entidad Franja Horaria.

NOTA:
    Las franjas horarias indican en qué momento del día se consumen los platos
    (desayuno, almuerzo, cena).

Funciones incluidas:
- crear_franja
- obtener_franjas
- obtener_franja_por_id
- actualizar_franja
- eliminar_franja
"""


from app.db.connection import safe_execute

def crear_franja(nombre):
    """
    Crea una nueva franja horaria.

    Args:
        nombre (str): Nombre de la franja (ej. desayuno).

    Returns:
        None
    """

    query ="INSERT INTO franjas_horarias (nombre) VALUES (%s)"
    params =(nombre,)
    return safe_execute(query, params)



def obtener_franjas():
    """
    Devuelve todas las franjas horarias existentes.

    Returns:
        list: Lista de franjas horarias.
    """

    query = "SELECT * FROM franjas_horarias"
    return safe_execute(query, fetch=True) or []


def obtener_franja_por_id(id_franja):
    """
    Obtiene una franja horaria específica por su ID.

    Args:
        id_franja (int): ID de la franja horaria.

    Returns:
        tuple: Datos de la franja.
    """

    query ="SELECT * FROM franjas_horarias WHERE id = %s"
    params =(id_franja,)
    return safe_execute(query, params, fetch=True) or []
    

def actualizar_franja(id_franja, nuevo_nombre):
    """
    Actualiza el nombre de una franja horaria.

    Args:
        id_franja (int): ID de la franja.
        nuevo_nombre (str): Nuevo nombre.

    Returns:
        None
    """
    query ="UPDATE franjas_horarias SET nombre = %s WHERE id = %s"
    params =(nuevo_nombre, id_franja)
    return safe_execute(query, params)


def eliminar_franja(id_franja):
    """
    Elimina una franja horaria.

    Args:
        id_franja (int): ID de la franja.

    Returns:
        None
    """

    query ="DELETE FROM franjas_horarias WHERE id = %s"
    params =(id_franja,)
    return safe_execute(query, params)

