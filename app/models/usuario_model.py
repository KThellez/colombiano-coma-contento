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
    try:
        query = """
            INSERT INTO usuario (username, password, rol)
            VALUES (%s, %s, %s)
        """
        return safe_execute(query, (username, password, rol))
    except Exception as e:
        print(f"[ERROR crear_usuario] {e}")
        return None


def obtener_usuarios():
    """
    Lista todos los usuarios registrados.

    Returns:
        list: Lista de usuarios.
    """
    try:
        query = "SELECT * FROM usuario"
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_usuarios] {e}")
        return []


def obtener_usuario_por_username(username):
    """
    Busca un usuario por su nombre de usuario.

    Args:
        username (str): Nombre de usuario.

    Returns:
        tuple: Datos del usuario.
    """
    try:
        query = "SELECT * FROM usuario WHERE username = %s"
        resultados = safe_execute(query, (username,), fetch=True)
        return resultados[0] if resultados else None
    except Exception as e:
        print(f"[ERROR obtener_usuario_por_username] {e}")
        return None


def obtener_usuario_por_id(user_id):
    """
    Obtiene un usuario por ID.

    Args:
        user_id (int): ID del usuario.

    Returns:
        tuple: Datos del usuario.
    """
    try:
        query = "SELECT * FROM usuario WHERE id = %s"
        return safe_execute(query, (user_id,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_usuario_por_id] {e}")
        return []


def actualizar_usuario(user_id, new_data):
    """
    Actualiza los datos de un usuario.

    Args:
        user_id (int): ID del usuario.
        new_data (dict): username, password, rol

    Returns:
        None
    """
    try:
        query = """
            UPDATE usuario
            SET username = %s, password = %s, rol = %s
            WHERE id = %s
        """
        params = (
            new_data["username"], new_data["password"],
            new_data["rol"], user_id
        )
        return safe_execute(query, params)
    except Exception as e:
        print(f"[ERROR actualizar_usuario] {e}")
        return None


def eliminar_usuario(user_id):
    """
    Elimina un usuario del sistema.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        user_id (int): ID del usuario.

    Returns:
        None
    """
    try:
        query = "DELETE FROM usuario WHERE id = %s"
        return safe_execute(query, (user_id,))
    except Exception as e:
        print(f"[ERROR eliminar_usuario] {e}")
        return None
