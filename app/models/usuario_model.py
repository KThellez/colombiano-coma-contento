"""
Modelo para manejar usuarios del sistema (admin o cliente).

NOTA:
    Las modificaciones o bajas deben registrarse en una tabla de histórico mediante triggers.

Funciones incluidas:
- crear_usuario
- obtener_usuarios
- obtener_usuario_por_username
- obtener_usuario_por_id
- actualizar_usuario
- eliminar_usuario
"""


from app.db.connection import safe_execute

def crear_usuario(username, password, rol='cliente'):
    """
    Crea un nuevo usuario.

    Args:
        username (str): Nombre de usuario.
        password (str): Contraseña ya encriptada.
        rol (str): Rol asignado (cliente, admin, etc.).

    Returns:
        None
    """
    query ="""
                INSERT INTO usuarios (username, password, rol)
                VALUES (%s, %s, %s)
            """
    params =(username, password, rol)
    return safe_execute(query, params)

def obtener_usuarios():
    """
    Lista todos los usuarios registrados.

    Returns:
        list: Lista de usuarios.
    """
    query ="SELECT * FROM usuarios"
    return safe_execute(query, fetch=True) or []


def obtener_usuario_por_username(username):
    """
    Busca un usuario por su nombre de usuario.

    Args:
        username (str): Nombre de usuario.

    Returns:
        tuple: Datos del usuario.
    """

    query ="SELECT * FROM usuarios WHERE username = %s"
    params =(username,)
    return safe_execute(query, params, fetch=True) or []


def obtener_usuario_por_id(user_id):
    """
    Obtiene un usuario por ID.

    Args:
        user_id (int): ID del usuario.

    Returns:
        tuple: Datos del usuario.
    """
    query ="SELECT * FROM usuarios WHERE id = %s"
    params =(user_id,)
    return safe_execute(query, params, fetch=True) or []


def actualizar_usuario(user_id, new_data):
    """
    Actualiza los datos de un usuario.

    Args:
        user_id (int): ID del usuario.
        new_data (dict): username, password, rol

    Returns:
        None
    """

    query ="""
                UPDATE usuarios
                SET username = %s, password = %s, rol = %s
                WHERE id = %s
            """
    params =(
                new_data["username"], new_data["password"],
                new_data["rol"], user_id
            )
    return safe_execute(query, params)


def eliminar_usuario(user_id):
    """
    Elimina un usuario del sistema.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        user_id (int): ID del usuario.

    Returns:
        None
    """
    query ="DELETE FROM usuarios WHERE id = %s"
    params =(user_id,)
    return safe_execute(query, params)

