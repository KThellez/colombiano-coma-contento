from flask import Blueprint, session, redirect, url_for, render_template
from app.models import plato_model, venta_model, detalle_venta_model
from app.utils.time_utils import determinar_franja_horaria

public_carrito_bp = Blueprint('public_carrito', __name__, url_prefix='/carrito')

@public_carrito_bp.route('/agregar/<int:plato_id>')
def agregar_al_carrito(plato_id):
    carrito = session.get('carrito', [])
    carrito.append(plato_id)
    session['carrito'] = carrito
    return redirect(url_for('public_carrito.ver_carrito'))

@public_carrito_bp.route('/')
def ver_carrito():
    carrito = session.get('carrito', [])
    platos = []

    for plato_id in carrito:
        plato = plato_model.obtener_plato_por_id(plato_id)
        if plato:
            platos.append(plato[0])  # plato[0] es el registro de la query

    return render_template('public/carrito/ver_carrito.html', platos=platos)

@public_carrito_bp.route('/finalizar')
def finalizar_compra():
    carrito = session.get('carrito', [])
    if not carrito:
        return redirect(url_for('public_carrito.ver_carrito'))

    franja_id = determinar_franja_horaria()

    # Crear la venta
    id_venta = venta_model.crear_venta(franja_id)

    for plato_id in carrito:
        plato = plato_model.obtener_plato_por_id(plato_id)
        if plato:
            precio_unitario = plato[0][5]
            detalle_venta_model.crear_detalle_venta(
                id_venta, plato_id, 1, precio_unitario
            )

    session.pop('carrito', None)

    return render_template('public/carrito/finalizado.html')
