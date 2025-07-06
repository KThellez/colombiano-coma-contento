from flask import Blueprint, render_template, redirect, url_for, session, flash
from app.models import venta_model, detalle_venta_model

#Just TO test
#from app.utils.fake_data import obtener_ventas_fake


private_venta_bp = Blueprint('private_venta', __name__, url_prefix='/admin/ventas')

@private_venta_bp.before_request
def require_login():
    if 'usuario_id' not in session or session.get('rol') != 'admin':
        flash('Debes iniciar sesión como administrador.', 'warning')
        return redirect(url_for('auth.login'))
    
@private_venta_bp.route('/')
def listado_ventas():
    ventas = venta_model.obtener_ventas()
    #ventas = obtener_ventas_fake()
    return render_template('private/venta/listado_ventas.html', ventas=ventas)

@private_venta_bp.route('/detalle/<string:id>')
def detalle_venta(id):
    venta = venta_model.obtener_venta_por_id(id)
    if not venta:
        return redirect(url_for('private_venta.listado_ventas'))

    detalle = detalle_venta_model.obtener_detalle_venta(id)
    return render_template('private/venta/detalle_venta.html', venta=venta, detalle=detalle)

@private_venta_bp.route('/eliminar/<string:id>')
def eliminar_venta(id):
    venta_model.eliminar_venta(id)
    return redirect(url_for('private_venta.listado_ventas'))
