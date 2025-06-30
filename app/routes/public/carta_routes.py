from flask import Blueprint, render_template
from app.models import carta_model, detalle_carta_model, plato_model

public_carta_bp = Blueprint('public_carta', __name__, url_prefix='/cartas')

@public_carta_bp.route('/')
def listado_cartas_public():
    cartas = carta_model.obtener_cartas()
    return render_template('public/carta/listado_cartas_public.html', cartas=cartas)

@public_carta_bp.route('/<int:id>')
def detalle_carta_public(id):
    carta = carta_model.obtener_carta_por_id(id)
    if not carta:
        return render_template('public/404.html'), 404

    platos = detalle_carta_model.obtener_platos_de_carta(id)
    return render_template('public/carta/detalle_carta_public.html', carta=carta, platos=platos)
