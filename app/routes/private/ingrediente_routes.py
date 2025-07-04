from flask import Blueprint, render_template, request, redirect, url_for , session, flash
from app.models import ingrediente_model, unidad_medida_model

private_ingrediente_bp = Blueprint('private_ingrediente', __name__, url_prefix='/admin/ingredientes')

@private_ingrediente_bp.before_request
def require_login():
    if 'usuario_id' not in session or session.get('rol') != 'admin':
        flash('Debes iniciar sesión como administrador.', 'warning')
        return redirect(url_for('auth.login'))

@private_ingrediente_bp.route('/')
def listado_ingredientes():
    ingredientes = ingrediente_model.obtener_ingredientes()
    return render_template('private/ingrediente/listado_ingredientes.html', ingredientes=ingredientes)

@private_ingrediente_bp.route('/crear', methods=['GET', 'POST'])
def crear_ingrediente():
    unidades = unidad_medida_model.obtener_unidades_medida()

    if request.method == 'POST':
        nombre = request.form['nombre']
        id_unidad = int(request.form['id_unidad_medida'])

        if ingrediente_model.existe_ingrediente(nombre):
            flash(f"El ingrediente '{nombre}' ya está registrado.", 'danger')
            return render_template('private/ingrediente/crear_ingrediente.html',
                                   unidades=unidades)
        
        ingrediente_model.crear_ingrediente(nombre, id_unidad)
        flash("Ingrediente creado exitosamente.", "success")
        return redirect(url_for('private_ingrediente.listado_ingredientes'))

    return render_template('private/ingrediente/crear_ingrediente.html', unidades=unidades)

@private_ingrediente_bp.route('/editar/<int:id>', methods=['GET', 'POST'])
def editar_ingrediente(id):
    ingrediente = ingrediente_model.obtener_ingrediente_por_id(id)
    if not ingrediente:
        return redirect(url_for('private_ingrediente.listado_ingredientes'))

    unidades = unidad_medida_model.obtener_unidades_medida()

    if request.method == 'POST':
        nuevo_nombre = request.form['nombre']
        nueva_unidad = int(request.form['id_unidad_medida'])
        ingrediente_model.actualizar_ingrediente(id, nuevo_nombre, nueva_unidad)
        return redirect(url_for('private_ingrediente.listado_ingredientes'))

    return render_template('private/ingrediente/editar_ingrediente.html',
                           ingrediente=ingrediente, unidades=unidades)

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
