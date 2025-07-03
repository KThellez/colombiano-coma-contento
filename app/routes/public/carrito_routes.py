from flask import Blueprint, session, redirect, url_for, render_template, make_response
from app.models import plato_model, venta_model, detalle_venta_model
from app.utils.time_utils import determinar_franja_horaria
from weasyprint import HTML

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
    if id_venta is None:
        return render_template('public/carrito/error_finalizar.html', mensaje="Error creando la venta.")

    platos_factura = []
    total = 0
    
    for plato_id in carrito:
        plato = plato_model.obtener_plato_por_id(plato_id)
        if plato:
            precio_unitario = plato[0][5]
            detalle_venta_model.crear_detalle_venta(
                id_venta, plato_id, 1, precio_unitario
            )
            platos_factura.append({
                'nombre': plato[0][1],
                'precio': precio_unitario
            })
            total += precio_unitario

    session.pop('carrito', None)

    franja = venta_model.obtener_franja_por_id(franja_id)
    venta_info = {
        'id_venta': id_venta,
        'fecha': venta_model.obtener_venta_por_id(id_venta)[0][1],
        'franja': franja[1],
        'total': total,
        'platos': platos_factura
    }

    return render_template('public/carrito/finalizado.html', venta=venta_info)

@public_carrito_bp.route('/factura/<int:id_venta>/pdf')
def generar_factura_pdf(id_venta):
    # Obtener datos de la venta
    venta = venta_model.obtener_venta_por_id(id_venta)
    detalles = detalle_venta_model.obtener_detalle_venta(id_venta)

    if not venta:
        return "Venta no encontrada", 404

    franja_id = venta[0][2]
    franja = venta_model.obtener_franja_por_id(franja_id)
    venta_info = {
        'id': venta[0][0],
        'fecha': venta[0][1],
        'franja': franja[1] if franja else "Desconocida",
        'detalles': detalles,
        'total': sum(d[2] * d[1] for d in detalles) if detalles else 0
    }

    html = render_template("public/carrito/factura_pdf.html", venta=venta_info)
    pdf = HTML(string=html).write_pdf()

    response = make_response(pdf)
    response.headers['Content-Type'] = 'application/pdf'
    response.headers['Content-Disposition'] = f'inline; filename=factura_{id_venta}.pdf'
    return response

