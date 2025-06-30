from flask import Blueprint, render_template, request, redirect, url_for , session, flash
from app.models import ingrediente_model

#Just TO test
#from app.utils.fake_data import obtener_ingredientes_fake

private_ingrediente_bp = Blueprint('private_ingrediente', __name__, url_prefix='/admin/ingredientes')

@private_ingrediente_bp.before_request
def require_login():
    if 'usuario_id' not in session or session.get('rol') != 'admin':
        flash('Debes iniciar sesión como administrador.', 'warning')
        return redirect(url_for('auth.login'))
    
@private_ingrediente_bp.route('/')
def listado_ingredientes():
    ingredientes = ingrediente_model.obtener_ingredientes()
    #ingredientes = obtener_ingredientes_fake()
    return render_template('private/ingrediente/listado_ingredientes.html', ingredientes=ingredientes)

@private_ingrediente_bp.route('/crear', methods=['GET', 'POST'])
def crear_ingrediente():
    if request.method == 'POST':
        nombre = request.form['nombre']
        unidad = request.form['unidad']
        ingrediente_model.crear_ingrediente(nombre, unidad)
        return redirect(url_for('private_ingrediente.listado_ingredientes'))
    return render_template('private/ingrediente/crear_ingrediente.html')

@private_ingrediente_bp.route('/editar/<int:id>', methods=['GET', 'POST'])
def editar_ingrediente(id):
    ingrediente = ingrediente_model.obtener_ingrediente_por_id(id)
    if not ingrediente:
        return redirect(url_for('private_ingrediente.listado_ingredientes'))

    if request.method == 'POST':
        nuevo_nombre = request.form['nombre']
        nueva_unidad = request.form['unidad']
        ingrediente_model.actualizar_ingrediente(id, nuevo_nombre, nueva_unidad)
        return redirect(url_for('private_ingrediente.listado_ingredientes'))

    return render_template('private/ingrediente/editar_ingrediente.html', ingrediente=ingrediente)

@private_ingrediente_bp.route('/detalle/<int:id>')
def detalle_ingrediente(id):
    ingrediente = ingrediente_model.obtener_ingrediente_por_id(id)
    if not ingrediente:
        return redirect(url_for('private_ingrediente.listado_ingredientes'))
    return render_template('private/ingrediente/detalle_ingrediente.html', ingrediente=ingrediente)

@private_ingrediente_bp.route('/eliminar/<int:id>')
def eliminar_ingrediente(id):
    ingrediente_model.eliminar_ingrediente(id)
    return redirect(url_for('private_ingrediente.listado_ingredientes'))
