from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from app.models import region_model

#Just TO test
#from app.utils.fake_data import obtener_regiones_fake

private_region_bp = Blueprint('private_region', __name__, url_prefix='/admin/regiones')

@private_region_bp.before_request
def require_login():
    if 'usuario_id' not in session or session.get('rol') != 'admin':
        flash('Debes iniciar sesión como administrador.', 'warning')
        return redirect(url_for('auth.login'))
    
    
@private_region_bp.route('/')
def listado_regiones():
    regiones = region_model.obtener_todas_regiones()
    #regiones = obtener_regiones_fake()
    return render_template('private/region/listado_regiones.html', regiones=regiones)

@private_region_bp.route('/crear', methods=['GET', 'POST'])
def crear_region():
    if request.method == 'POST':
        nombre = request.form['nombre']
        encargado = request.form['encargado']
        region_model.crear_region(nombre, encargado)
        return redirect(url_for('private_region.listado_regiones'))
    return render_template('private/region/crear_region.html')

@private_region_bp.route('/editar/<string:id>', methods=['GET', 'POST'])
def editar_region(id):
    region = region_model.obtener_region_por_id(id)
    if not region:
        return redirect(url_for('private_region.listado_regiones'))

    region = region[0]  # ← Agrega esto

    if request.method == 'POST':
        nombre = request.form['nombre']
        encargado = request.form['encargado']
        region_model.actualizar_region(id, nombre, encargado)
        return redirect(url_for('private_region.listado_regiones'))

    return render_template('private/region/editar_region.html', region=region)





@private_region_bp.route('/detalle/<string:id>')
def detalle_region(id):
    region = region_model.obtener_region_por_id(id)
    if not region:
        return redirect(url_for('private_region.listado_regiones'))
    return render_template('private/region/detalle_region.html', region=region[0])



@private_region_bp.route('/eliminar/<string:id>')
def eliminar_region(id):
    region_model.eliminar_region(id)
    return redirect(url_for('private_region.listado_regiones'))