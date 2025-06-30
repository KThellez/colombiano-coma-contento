from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from app.models import plato_model, region_model, categoria_model

#Just TO test
#from app.utils.fake_data import obtener_platos_fake

private_plato_bp = Blueprint('private_plato', __name__, url_prefix='/admin/platos')


@private_plato_bp.before_request
def require_login():
    if 'usuario_id' not in session or session.get('rol') != 'admin':
        flash('Debes iniciar sesión como administrador.', 'warning')
        return redirect(url_for('auth.login'))

@private_plato_bp.route('/')
def listado_platos():
    platos = plato_model.obtener_platos()
    #platos = obtener_platos_fake()
    return render_template('private/plato/listado_platos.html', platos=platos)

@private_plato_bp.route('/crear', methods=['GET', 'POST'])
def crear_plato():
    if request.method == 'POST':
        data = {
            'nombre': request.form['nombre'],
            'descripcion': request.form['descripcion'],
            'nivel_complejidad': request.form['nivel_complejidad'],
            'foto': request.form['foto'],
            'precio_venta': float(request.form['precio_venta']),
            'id_region': int(request.form['id_region']),
            'id_categoria': int(request.form['id_categoria'])
        }
        plato_model.crear_plato(data)
        return redirect(url_for('private_plato.listado_platos'))

    regiones = region_model.obtener_todas_regiones()
    categorias = categoria_model.obtener_categorias()
    return render_template('private/plato/crear_plato.html', regiones=regiones, categorias=categorias)

@private_plato_bp.route('/editar/<int:id>', methods=['GET', 'POST'])
def editar_plato(id):
    plato = plato_model.obtener_plato_por_id(id)
    if not plato:
        return redirect(url_for('private_plato.listado_platos'))

    if request.method == 'POST':
        data = {
            'nombre': request.form['nombre'],
            'descripcion': request.form['descripcion'],
            'nivel_complejidad': request.form['nivel_complejidad'],
            'foto': request.form['foto'],
            'precio_venta': float(request.form['precio_venta']),
            'id_region': int(request.form['id_region']),
            'id_categoria': int(request.form['id_categoria'])
        }
        plato_model.actualizar_plato(id, data)
        return redirect(url_for('private_plato.listado_platos'))

    regiones = region_model.obtener_todas_regiones()
    categorias = categoria_model.obtener_categorias()
    return render_template('private/plato/editar_plato.html', plato=plato, regiones=regiones, categorias=categorias)

@private_plato_bp.route('/detalle/<int:id>')
def detalle_plato(id):
    plato = plato_model.obtener_plato_por_id(id)
    if not plato:
        return redirect(url_for('private_plato.listado_platos'))
    return render_template('private/plato/detalle_plato.html', plato=plato)

@private_plato_bp.route('/eliminar/<int:id>')
def eliminar_plato(id):
    plato_model.eliminar_plato(id)
    return redirect(url_for('private_plato.listado_platos'))
