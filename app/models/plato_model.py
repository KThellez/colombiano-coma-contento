"""
Modelo para manejar la entidad Plato.

NOTA:
    Las modificaciones y eliminaciones serán auditadas mediante triggers y tablas de histórico.

Funciones incluidas:
- crear_plato
- obtener_platos
- obtener_plato_por_id
- actualizar_plato
- eliminar_plato
"""

from app.db.connection import safe_execute

def crear_plato(data):
    """
    Crea un nuevo plato con su información básica.

    Args:
        data (dict): Diccionario con claves:
            - nombre (str)
            - descripcion (str)
            - foto (str)
            - precio (float)
            - id_region_fk (int)
            - id_categoria_fk (int)
            - id_nivel_complejidad_fk (int)

    Returns:
        None
    """
    try:
        query = """
            INSERT INTO plato (
                nombre, descripcion, id_nivel_complejidad_fk,
                foto, precio, id_region_fk, id_categoria_fk
            ) VALUES (%s, %s, %s, %s, %s, %s, %s)
            RETURNING id_plato
        """
        params = (
            data["nombre"],
            data["descripcion"],
            data["id_nivel_complejidad_fk"],  
            data["foto"],
            data["precio"],                 
            data["id_region_fk"],            
            data["id_categoria_fk"]         
        )
        return safe_execute(query, params, fetch=True)
    except Exception as e:
        print(f"[ERROR crear_plato] {e}")
        print(f"[ERROR crear_plato] {e}")
        raise


def obtener_platos():
    """
    Devuelve todos los platos registrados en la base de datos.

    Returns:
        list: Lista de platos.
    """
    try:
        query = "SELECT * FROM plato ORDER BY id_plato"
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_platos] {e}")
        return []


def obtener_plato_por_id(id_plato):
    """
    Obtiene la información de un plato específico por ID.

    Args:
        id_plato (int): ID del plato.

    Returns:
        tuple: Datos del plato (una sola tupla) o None si no existe.
    """
    try:
        query = "SELECT id_plato,nombre,descripcion, foto,precio, id_region_fk, id_categoria_fk, id_nivel_complejidad_fk FROM plato WHERE id_plato = %s"
        resultado = safe_execute(query, (id_plato,), fetch=True)
        return resultado[0] if resultado else None
    except Exception as e:
        print(f"[ERROR obtener_plato_por_id] {e}")
        return None


def actualizar_plato(id_plato, data):
    """
    Actualiza los datos de un plato existente.

    Args:
        id_plato (int): ID del plato a actualizar.
        data (dict): Diccionario con los campos a modificar.

    Returns:
        None
    """
    try:
        query = """
            UPDATE plato
            SET nombre = %s,
                descripcion = %s,
                foto = %s,
                precio = %s,
                id_region_fk = %s,
                id_categoria_fk = %s,
                id_nivel_complejidad_fk = %s
            WHERE id_plato = %s
        """
        params = (
            data["nombre"], data["descripcion"], data["foto"], data["precio"],
            data["id_region_fk"], data["id_categoria_fk"], data["id_nivel_complejidad_fk"], id_plato
        )
        return safe_execute(query, params)
    except Exception as e:
        print(f"[ERROR actualizar_plato] {e}")
        return None


def eliminar_plato(id_plato):
    """
    Elimina un plato permanentemente de la base de datos.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        id_plato (int): ID del plato a eliminar.

    Returns:
        None
    """
    try:
        # Eliminar relaciones N:M antes del DELETE en 'plato'
        safe_execute("DELETE FROM contener WHERE id_plato_fk = %s", (id_plato,))
        safe_execute("DELETE FROM ofrecer WHERE id_plato_fk = %s", (id_plato,))
        safe_execute("DELETE FROM detallar WHERE id_plato_fk = %s", (id_plato,))

        # Ahora sí eliminar el plato
        query = "DELETE FROM plato WHERE id_plato = %s"
        return safe_execute(query, (id_plato,))
    except Exception as e:
        print(f"[ERROR eliminar_plato] {e}")
        return None
    

    
def eliminar_ingredientes_de_plato(id_plato):
    """
    Elimina todos los ingredientes asociados a un plato específico
    (relación N:M en la tabla 'contener').
    """
    try:
        query = "DELETE FROM contener WHERE id_plato_fk = %s"
        return safe_execute(query, (id_plato,))
    except Exception as e:
        print(f"[ERROR eliminar_ingredientes_de_plato] {e}")
        return None
