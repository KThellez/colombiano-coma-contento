from flask import Blueprint, render_template
from app.models import plato_model

public_plato_bp = Blueprint('public_plato', __name__, url_prefix='/platos')

@public_plato_bp.route('/')
def listado_platos_public():
    platos = plato_model.obtener_platos()
    return render_template('public/plato/listado_platos_public.html', platos=platos)

@public_plato_bp.route('/<int:id>')
def detalle_plato_public(id):
    plato = plato_model.obtener_plato_por_id(id)
    if not plato:
        return render_template('public/404.html'), 404
    return render_template('public/plato/detalle_plato_public.html', plato=plato)
