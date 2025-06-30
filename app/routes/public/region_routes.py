from flask import Blueprint, render_template
from app.models import region_model

public_region_bp = Blueprint('public_region', __name__, url_prefix='/regiones')

@public_region_bp.route('/')
def listado_regiones_public():
    regiones = region_model.obtener_todas_regiones()
    return render_template('public/region/listado_regiones_public.html', regiones=regiones)

@public_region_bp.route('/<int:id>')
def detalle_region_public(id):
    region = region_model.obtener_region_por_id(id)
    if not region:
        return render_template('public/404.html'), 404
    return render_template('public/region/detalle_region_public.html', region=region)
