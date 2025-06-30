from flask import Blueprint, render_template, request, redirect, url_for , session, flash
from app.models import carta_model

#Just TO test
#from app.utils.fake_data import obtener_cartas_fake

private_carta_bp = Blueprint('private_carta', __name__, url_prefix='/admin/cartas')

@private_carta_bp.before_request
def require_login():
    if 'usuario_id' not in session or session.get('rol') != 'admin':
        flash('Debes iniciar sesión como administrador.', 'warning')
        return redirect(url_for('auth.login'))
    
@private_carta_bp.route('/')
def listado_cartas():
    cartas = carta_model.obtener_cartas()
    #cartas = obtener_cartas_fake()
    return render_template('private/carta/listado_cartas.html', cartas=cartas)

@private_carta_bp.route('/crear', methods=['GET', 'POST'])
def crear_carta():
    if request.method == 'POST':
        nombre = request.form['nombre']
        fecha_inicio = request.form['fecha_inicio']
        fecha_fin = request.form['fecha_fin']
        carta_model.crear_carta(nombre, fecha_inicio, fecha_fin)
        return redirect(url_for('private_carta.listado_cartas'))
    return render_template('private/carta/crear_carta.html')

@private_carta_bp.route('/editar/<int:id>', methods=['GET', 'POST'])
def editar_carta(id):
    carta = carta_model.obtener_carta_por_id(id)
    if not carta:
        return redirect(url_for('private_carta.listado_cartas'))

    if request.method == 'POST':
        nombre = request.form['nombre']
        fecha_inicio = request.form['fecha_inicio']
        fecha_fin = request.form['fecha_fin']
        carta_model.actualizar_carta(id, nombre, fecha_inicio, fecha_fin)
        return redirect(url_for('private_carta.listado_cartas'))

    return render_template('private/carta/editar_carta.html', carta=carta)

@private_carta_bp.route('/detalle/<int:id>')
def detalle_carta(id):
    carta = carta_model.obtener_carta_por_id(id)
    if not carta:
        return redirect(url_for('private_carta.listado_cartas'))
    return render_template('private/carta/detalle_carta.html', carta=carta)

@private_carta_bp.route('/eliminar/<int:id>')
def eliminar_carta(id):
    carta_model.eliminar_carta(id)
    return redirect(url_for('private_carta.listado_cartas'))
