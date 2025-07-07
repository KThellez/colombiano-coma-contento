from flask import Blueprint, render_template
from app.models import carta_model, detalle_carta_model, plato_model, region_model

public_carta_bp = Blueprint('public_carta', __name__, url_prefix='/cartas')



@public_carta_bp.route('/')
def home_public():
    carta = carta_model.obtener_carta_vigente()
    if not carta:
        return render_template('public/404.html', mensaje="No hay carta vigente.")

    id_carta = carta[0]
    nombre_carta = carta[1]
    fecha_inicio = carta[2]
    fecha_fin = carta[3]

    regiones = detalle_carta_model.obtener_regiones_con_platos_en_carta(id_carta)
    regiones_con_platos = []

    for region in regiones:
        id_region = region[0]
        platos = detalle_carta_model.obtener_platos_de_carta_por_region(id_carta, id_region)
        regiones_con_platos.append({
            'id': region[0],
            'nombre': region[1],
            'encargado': region[2],
            'platos': platos
        })

    return render_template('public/carta/home_carta.html',
                           carta={
                               'id_carta': id_carta,
                               'nombre': nombre_carta,
                               'fecha_inicio': fecha_inicio,
                               'fecha_fin': fecha_fin
                           },
                           regiones=regiones_con_platos)


@public_carta_bp.route('/listado')
def listado_cartas_public():
    cartas = carta_model.obtener_cartas()
    return render_template('public/carta/listado_cartas_public.html', cartas=cartas)

@public_carta_bp.route('/<string:id>')
def detalle_carta_public(id):
    carta = carta_model.obtener_carta_por_id(id)
    if not carta:
        return render_template('public/404.html'), 404

    platos = detalle_carta_model.obtener_platos_de_carta(id)
    return render_template('public/carta/detalle_carta_public.html', carta=carta, platos=platos)


@public_carta_bp.route('/<string:id_carta>/region/<string:id_region>')
def platos_por_region(id_carta, id_region):
    carta = carta_model.obtener_carta_por_id(id_carta)
    region = region_model.obtener_region_por_id(id_region)

    if not carta or not region:
        return render_template('public/404.html'), 404

    platos = detalle_carta_model.obtener_platos_de_carta_por_region_y_categoria_public(id_carta, id_region)

    platos_por_categoria = {}
    for plato in platos:
        categoria = plato['categoria']
        if categoria not in platos_por_categoria:
            platos_por_categoria[categoria] = []
        platos_por_categoria[categoria].append(plato)

    return render_template(
        'public/carta/platos_por_region.html',
        carta=carta[0],
        region=region[0],
        platos_por_categoria=platos_por_categoria
    )



@public_carta_bp.route('/<string:id_carta>/region/<string:id_region>/por-categoria')
def platos_por_region_y_categoria(id_carta, id_region):
    carta = carta_model.obtener_carta_por_id(id_carta)
    region = region_model.obtener_region_por_id(id_region)

    if not carta or not region:
        return render_template('public/404.html'), 404

    platos = detalle_carta_model.obtener_platos_de_carta_por_region_y_categoria_public(id_carta, id_region)

    # Agrupar por categoría
    platos_por_categoria = {}
    for plato in platos:
        categoria = plato['categoria']
        if categoria not in platos_por_categoria:
            platos_por_categoria[categoria] = []
        platos_por_categoria[categoria].append(plato)

    return render_template(
        'public/carta/platos_por_region_categoria.html',
        carta=carta[0], region=region[0], platos_por_categoria=platos_por_categoria
    )
