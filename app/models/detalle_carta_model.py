"""
Modelo para manejar la relación N:M entre cartas y platos.

NOTA:
    No hay función de actualización ya que modificar un plato en una carta es equivalente a quitarlo y volverlo a agregar.

Funciones incluidas:
- asociar_plato_a_carta
- obtener_platos_de_carta
- eliminar_plato_de_carta
"""

from app.db.connection import safe_execute


def obtener_platos_de_carta(id_carta):
    """
    Lista los platos incluidos en una carta.

    Args:
        id_carta (int): ID de la carta.

    Returns:
        list: Lista de platos.
    """
    try:
        query = """
            SELECT p.id_plato, p.nombre, p.precio
            FROM plato p
            JOIN detallar d ON p.id_plato = d.id_plato_fk
            WHERE d.id_carta_fk = %s AND p.disponible = TRUE
        """
        return safe_execute(query, (id_carta,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_platos_de_carta] {e}")
        return []

def obtener_platos_de_carta_por_region(id_carta, id_region):
    query = """
        SELECT p.id_plato, p.nombre, p.precio, p.foto
        FROM plato p
        JOIN detallar d ON p.id_plato = d.id_plato_fk
        WHERE d.id_carta_fk = %s AND p.id_region_fk = %s AND p.disponible = TRUE
    """
    return safe_execute(query, (id_carta, id_region), fetch=True) or []

def obtener_platos_de_carta_por_categoria(id_carta, id_categoria):
    query = """
        SELECT p.id_plato, p.nombre, p.precio, p.foto
        FROM plato p
        JOIN detallar d ON p.id_plato = d.id_plato_fk
        WHERE d.id_carta_fk = %s AND p.id_categoria_fk = %s AND p.disponible = TRUE
    """
    return safe_execute(query, (id_carta, id_categoria), fetch=True) or []

def eliminar_plato_de_carta(id_carta, id_plato):
    """
    Elimina un plato de una carta.

    Args:
        id_carta (int): ID de la carta.
        id_plato (int): ID del plato.

    Returns:
        None
    """
    try:
        query = """
            DELETE FROM detallar
            WHERE id_carta_fk = %s AND id_plato_fk = %s
        """
        return safe_execute(query, (id_carta, id_plato))
    except Exception as e:
        print(f"[ERROR eliminar_plato_de_carta] {e}")
        return None
    
def asociar_plato_a_carta(id_carta, id_plato):
    try:
        print(f"[DEBUG asociar_plato_a_carta] Insertando {id_carta} - {id_plato}")
        query = "INSERT INTO detallar (id_carta_fk, id_plato_fk) VALUES (%s, %s)"
        params = (id_carta, id_plato)
        return safe_execute(query, params)
    except Exception as e:
        print(f"[ERROR asociar_plato_a_carta] {e} - Carta: {id_carta}, Plato: {id_plato}")
        return None



def eliminar_todos_platos_de_carta(id_carta):
    try:
        query = "DELETE FROM detallar WHERE id_carta_fk = %s"
        return safe_execute(query, (id_carta,))
    except Exception as e:
        print(f"[ERROR eliminar_todos_platos_de_carta] {e}")
        return None