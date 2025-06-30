from functools import wraps
from flask import session, redirect, url_for, flash

def login_required(f):
    """
    Decorador para proteger rutas privadas.
    Verifica si el usuario está autenticado y tiene rol válido.
    """
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'usuario_id' not in session or session.get('rol') != 'admin':
            flash('Debes iniciar sesión como administrador para acceder a esta sección.', 'warning')
            return redirect(url_for('auth.login'))
        return f(*args, **kwargs)
    return decorated_function
