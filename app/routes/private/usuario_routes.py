from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from app.models import usuario_model

#Just TO test
from app.utils.fake_data import obtener_usuarios_fake


private_usuario_bp = Blueprint('private_usuario', __name__, url_prefix='/admin/usuarios')

@private_usuario_bp.before_request
def require_login():
    if 'usuario_id' not in session or session.get('rol') != 'admin':
        flash('Debes iniciar sesión como administrador.', 'warning')
        return redirect(url_for('auth.login'))
    
@private_usuario_bp.route('/')
def listado_usuarios():
    usuarios = usuario_model.obtener_usuarios()
    #usuarios = obtener_usuarios_fake()
    return render_template('private/usuario/listado_usuarios.html', usuarios=usuarios)

@private_usuario_bp.route('/crear', methods=['GET', 'POST'])
def crear_usuario():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']  # ¡Asegúrate de encriptar esto en producción!
        rol = request.form['rol']
        usuario_model.crear_usuario(username, password, rol)
        return redirect(url_for('private_usuario.listado_usuarios'))
    return render_template('private/usuario/crear_usuario.html')

@private_usuario_bp.route('/editar/<int:id>', methods=['GET', 'POST'])
def editar_usuario(id):
    usuario = usuario_model.obtener_usuario_por_id(id)
    if not usuario:
        return redirect(url_for('private_usuario.listado_usuarios'))

    if request.method == 'POST':
        new_data = {
            "username": request.form['username'],
            "password": request.form['password'],  # También encriptar aquí
            "rol": request.form['rol']
        }
        usuario_model.actualizar_usuario(id, new_data)
        return redirect(url_for('private_usuario.listado_usuarios'))

    return render_template('private/usuario/editar_usuario.html', usuario=usuario)

@private_usuario_bp.route('/detalle/<int:id>')
def detalle_usuario(id):
    usuario = usuario_model.obtener_usuario_por_id(id)
    if not usuario:
        return redirect(url_for('private_usuario.listado_usuarios'))
    return render_template('private/usuario/detalle_usuario.html', usuario=usuario)

@private_usuario_bp.route('/eliminar/<int:id>')
def eliminar_usuario(id):
    usuario_model.eliminar_usuario(id)
    return redirect(url_for('private_usuario.listado_usuarios'))
