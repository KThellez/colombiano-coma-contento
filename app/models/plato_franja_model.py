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
    try:
        query = """
            INSERT INTO ofrecer (id_plato, id_franja_horaria)
            VALUES (%s, %s)
        """
        return safe_execute(query, (id_plato, id_franja))
    except Exception as e:
        print(f"[ERROR asignar_franja_a_plato] {e}")
        return None


def obtener_franjas_de_plato(id_plato):
    """
    Obtiene las franjas horarias en las que se puede consumir un plato.

    Args:
        id_plato (int): ID del plato.

    Returns:
        list: Lista de franjas horarias.
    """
    try:
        query = """
            SELECT f.id_franja_horaria, f.nombre
            FROM franja_horaria f
            JOIN ofrecer o ON f.id_franja_horaria = o.id_franja_horaria
            WHERE o.id_plato = %s
        """
        return safe_execute(query, (id_plato,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_franjas_de_plato] {e}")
        return []


def eliminar_franja_de_plato(id_plato, id_franja):
    """
    Elimina una franja horaria asociada a un plato.

    Args:
        id_plato (int): ID del plato.
        id_franja (int): ID de la franja horaria.

    Returns:
        None
    """
    try:
        query = """
            DELETE FROM ofrecer
            WHERE id_plato = %s AND id_franja_horaria = %s
        """
        return safe_execute(query, (id_plato, id_franja))
    except Exception as e:
        print(f"[ERROR eliminar_franja_de_plato] {e}")
        return None
