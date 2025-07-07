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
    try:
        query = """
            INSERT INTO contener (id_plato_fk, id_ingrediente_fk, cantidad, breve_descripcion)
            VALUES (%s, %s, %s, %s)
        """
        return safe_execute(query, (id_plato, id_ingrediente, cantidad, descripcion))
    except Exception as e:
        print(f"[ERROR agregar_ingrediente_a_plato] {e}")
        return None


def obtener_ingredientes_de_plato(id_plato):
    """
    Obtiene todos los ingredientes asignados a un plato específico.

    Args:
        id_plato (int): ID del plato.

    Returns:
        list: Lista de ingredientes con cantidad y unidad de medida.
    """
    try:
        query = """
        SELECT 
            i.id_ingrediente, 
            i.nombre, 
            u.nombre AS unidad, 
            c.cantidad, 
            c.breve_descripcion AS breve_descripcion
        FROM 
            contener c
        JOIN ingrediente i ON i.id_ingrediente = c.id_ingrediente_fk
        JOIN unidad_medida u ON u.id_unidad_medida = i.id_unidad_medida_fk
        WHERE 
            c.id_plato_fk = %s
        """
        return safe_execute(query, (id_plato,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_ingredientes_de_plato] {e}")
        return []
        

def eliminar_ingrediente_de_plato(id_plato, id_ingrediente):
    """
    Elimina la relación entre un ingrediente y un plato.

    Args:
        id_plato (int): ID del plato.
        id_ingrediente (int): ID del ingrediente.

    Returns:
        None
    """
    try:
        query = """
            DELETE FROM contener
            WHERE id_plato_fk = %s AND id_ingrediente_fk = %s
        """
        return safe_execute(query, (id_plato, id_ingrediente))
    except Exception as e:
        print(f"[ERROR eliminar_ingrediente_de_plato] {e}")
        return None
