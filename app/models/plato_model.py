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
            - nivel_complejidad (str)
            - foto (str)
            - precio_venta (float)
            - id_region (int)
            - id_categoria (int)

    Returns:
        None
    """
    query ="""
                INSERT INTO platos (nombre, descripcion, nivel_complejidad, foto, precio_venta, id_region, id_categoria)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """
    params =(
                data["nombre"], data["descripcion"], data["nivel_complejidad"], data["foto"],
                data["precio_venta"], data["id_region"], data["id_categoria"]
            )
    return safe_execute(query, params)


def obtener_platos():
    """
    Devuelve todos los platos registrados en la base de datos.

    Returns:
        list: Lista de platos.
    """
    query ="SELECT * FROM platos"
    return safe_execute(query, fetch=True) or []


def obtener_plato_por_id(id_plato):
    """
    Obtiene la información de un plato específico por ID.

    Args:
        id_plato (int): ID del plato.

    Returns:
        tuple: Datos del plato.
    """
    query ="SELECT * FROM platos WHERE id = %s"
    params =(id_plato,)
    return safe_execute(query, params, fetch=True)


def actualizar_plato(id_plato, data):
    """
    Actualiza los datos de un plato existente.

    Args:
        id_plato (int): ID del plato a actualizar.
        data (dict): Diccionario con los campos a modificar.

    Returns:
        None
    """
    query ="""
                UPDATE platos
                SET nombre = %s, descripcion = %s, nivel_complejidad = %s,
                    foto = %s, precio_venta = %s, id_region = %s, id_categoria = %s
                WHERE id = %s
            """
    params =(
                data["nombre"], data["descripcion"], data["nivel_complejidad"], data["foto"],
                data["precio_venta"], data["id_region"], data["id_categoria"], id_plato
            )
    return safe_execute(query, params)
    

def eliminar_plato(id_plato):
    """
    Elimina un plato permanentemente de la base de datos.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        id_plato (int): ID del plato a eliminar.

    Returns:
        None
    """
    query ="DELETE FROM platos WHERE id = %s"
    params =(id_plato,)
    return safe_execute(query, params)

