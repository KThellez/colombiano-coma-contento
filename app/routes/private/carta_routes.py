from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from app.models import carta_model,detalle_carta_model,plato_model
import uuid

private_carta_bp = Blueprint('private_carta', __name__, url_prefix='/admin/cartas')

@private_carta_bp.before_request
def require_login():
    if 'usuario_id' not in session or session.get('rol') != 'admin':
        flash('Debes iniciar sesión como administrador.', 'warning')
        return redirect(url_for('auth.login'))

@private_carta_bp.route('/')
def listado_cartas():
    cartas = carta_model.obtener_cartas()
    return render_template('private/carta/listado_cartas.html', cartas=cartas)

@private_carta_bp.route('/crear', methods=['GET', 'POST'])
def crear_carta():
    if request.method == 'POST':
        nombre = request.form['nombre']
        fecha_inicio = request.form['fecha_inicio']
        fecha_fin = request.form['fecha_fin']
        platos_seleccionados = request.form.getlist('platos')

        print("PLATOS SELECCIONADOS:", platos_seleccionados)

        id_carta = carta_model.crear_carta(nombre, fecha_inicio, fecha_fin)

        if not id_carta:
            flash('Error al crear la carta.', 'danger')
            return redirect(url_for('private_carta.crear_carta'))

        for id_plato in platos_seleccionados:
            detalle_carta_model.asociar_plato_a_carta(id_carta, int(id_plato))



        # Asociar platos
        for id_plato in platos_seleccionados:
            detalle_carta_model.asociar_plato_a_carta(id_carta, int(id_plato))

        return redirect(url_for('private_carta.listado_cartas'))

    platos = plato_model.obtener_platos()
    return render_template('private/carta/crear_carta.html', platos=platos)


@private_carta_bp.route('/editar/<id>', methods=['GET', 'POST'])
def editar_carta(id):
    carta = carta_model.obtener_carta_por_id(id)
    if not carta:
        return redirect(url_for('private_carta.listado_cartas'))

    if request.method == 'POST':
        nombre = request.form['nombre']
        fecha_inicio = request.form['fecha_inicio']
        fecha_fin = request.form['fecha_fin']
        carta_model.actualizar_carta(id, nombre, fecha_inicio, fecha_fin)

        # Actualiza los platos asociados
        nuevos_platos = request.form.getlist('platos')
        detalle_carta_model.eliminar_todos_platos_de_carta(id)
        for id_plato in nuevos_platos:
            detalle_carta_model.asociar_plato_a_carta(id, int(id_plato))

        return redirect(url_for('private_carta.listado_cartas'))

    platos = plato_model.obtener_platos()
    platos_asociados = detalle_carta_model.obtener_platos_de_carta(id)
    ids_asociados = [p[0] for p in platos_asociados]  # Extrae los id_plato

    return render_template(
        'private/carta/editar_carta.html',
        carta=carta[0],  # solo un registro
        platos=platos,
        platos_asociados=ids_asociados
    )



@private_carta_bp.route('/detalle/<id>')
def detalle_carta(id):
    carta = carta_model.obtener_carta_por_id(id)
    if not carta:
        return redirect(url_for('private_carta.listado_cartas'))

    platos = detalle_carta_model.obtener_platos_de_carta(id)
    return render_template('private/carta/detalle_carta.html', carta=carta[0], platos=platos)


@private_carta_bp.route('/eliminar/<id>')
def eliminar_carta(id):
    carta_model.eliminar_carta(id)
    return redirect(url_for('private_carta.listado_cartas'))
