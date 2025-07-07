from flask import Blueprint, render_template, request, redirect, url_for , session, flash
from app.models import categoria_model
#Just TO test
#from app.utils.fake_data import obtener_categorias_fake


private_categoria_bp = Blueprint('private_categoria', __name__, url_prefix='/admin/categorias')

@private_categoria_bp.before_request
def require_login():
    if 'usuario_id' not in session or session.get('rol') != 'admin':
        flash('Debes iniciar sesión como administrador.', 'warning')
        return redirect(url_for('auth.login'))
    
@private_categoria_bp.route('/')
def listado_categorias():
    categorias = categoria_model.obtener_categorias()
    #categorias = obtener_categorias_fake()
    return render_template('private/categoria/listado_categorias.html', categorias=categorias)

@private_categoria_bp.route('/crear', methods=['GET', 'POST'])
def crear_categoria():
    if request.method == 'POST':
        nombre = request.form['nombre']
        categoria_model.crear_categoria(nombre)
        return redirect(url_for('private_categoria.listado_categorias'))
    return render_template('private/categoria/crear_categoria.html')

@private_categoria_bp.route('/editar/<int:id>', methods=['GET', 'POST'])
def editar_categoria(id):
    categoria = categoria_model.obtener_categoria_por_id(id)
    if not categoria:
        return redirect(url_for('private_categoria.listado_categorias'))

    categoria = categoria[0]  # ← Desempaquetar la tupla

    if request.method == 'POST':
        nuevo_nombre = request.form['nombre']
        categoria_model.actualizar_categoria(id, nuevo_nombre)
        return redirect(url_for('private_categoria.listado_categorias'))

    return render_template('private/categoria/editar_categoria.html', categoria=categoria)





@private_categoria_bp.route('/detalle/<int:id>')
def detalle_categoria(id):
    categoria = categoria_model.obtener_categoria_por_id(id)
    if not categoria:
        return redirect(url_for('private_categoria.listado_categorias'))
    return render_template('private/categoria/detalle_categoria.html', categoria=categoria[0])



@private_categoria_bp.route('/eliminar/<int:id>')
def eliminar_categoria(id):
    categoria_model.eliminar_categoria(id)
    return redirect(url_for('private_categoria.listado_categorias'))