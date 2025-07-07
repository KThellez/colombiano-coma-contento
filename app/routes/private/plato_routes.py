from flask import Blueprint, render_template, request, redirect, url_for, session, flash, json
from app.models import plato_model, region_model, categoria_model, plato_ingrediente_model, nivel_complejidad_model
from app.utils.image import guardar_imagen

#Just TO test
#from app.utils.fake_data import obtener_platos_fake

private_plato_bp = Blueprint('private_plato', __name__, url_prefix='/admin/platos')


@private_plato_bp.before_request
def require_login():
    if 'usuario_id' not in session or session.get('rol') != 'admin':
        flash('Debes iniciar sesión como administrador.', 'warning')
        return redirect(url_for('auth.login'))

@private_plato_bp.route('/')
def listado_platos():
    platos = plato_model.obtener_platos()
    #platos = obtener_platos_fake()
    return render_template('private/plato/listado_platos.html', platos=platos)

@private_plato_bp.route('/crear', methods=['GET', 'POST'])
def crear_plato():
    if request.method == 'POST':
        try:
            # 1. Procesar imagen primero
            foto = request.files.get('foto')
            ruta_foto = guardar_imagen(foto, request.form['nombre']) if foto and foto.filename != '' else ''

            # 2. Construir el diccionario con todos los datos del plato
            data = {
                'nombre': request.form['nombre'],
                'descripcion': request.form['descripcion'],
                'id_nivel_complejidad_fk': int(request.form['nivel_complejidad']),
                'foto': ruta_foto,
                'precio': float(request.form['precio_venta']),
                'id_region_fk': request.form['id_region'],
                'id_categoria_fk': int(request.form['id_categoria'])
            }

            # 3. Insertar plato
            nuevo_plato = plato_model.crear_plato(data)
            if not nuevo_plato:
                flash("Error al crear el plato.", "danger")
                return redirect(url_for('private_plato.listado_platos'))

            id_plato = nuevo_plato[0][0]  # ID retornado por RETURNING

            # 4. Ingredientes (relación N:M)
            ingredientes_json = request.form.get('ingredientes_json')
            if ingredientes_json:
                ingredientes = json.loads(ingredientes_json)
                for item in ingredientes:
                    plato_ingrediente_model.agregar_ingrediente_a_plato(
                        id_plato=id_plato,
                        id_ingrediente=item['id_ingrediente'],
                        cantidad=item['cantidad'],
                        descripcion=item['descripcion']
                    )

            flash("Plato creado correctamente con sus ingredientes.", "success")
            return redirect(url_for('private_plato.listado_platos'))

        except Exception as e:
            print(f"[ERROR crear_plato] {e}")
            flash("Ocurrió un error inesperado al crear el plato.", "danger")
            return redirect(url_for('private_plato.listado_platos'))

    # GET: Mostrar formulario
    regiones = region_model.obtener_todas_regiones()
    categorias = categoria_model.obtener_categorias()
    niveles_complejidad = nivel_complejidad_model.obtener_niveles_complejidad()

    return render_template(
        'private/plato/crear_plato.html',
        regiones=regiones,
        categorias=categorias,
        niveles_complejidad=niveles_complejidad
    )


@private_plato_bp.route('/editar/<int:id>', methods=['GET', 'POST'])
def editar_plato(id):
    if request.method == 'POST':
        nombre = request.form['nombre']
        descripcion = request.form['descripcion']
        nivel = request.form['nivel_complejidad']
        precio = request.form['precio_venta']
        id_region = request.form['id_region']
        id_categoria = request.form['id_categoria']
        ingredientes_json = request.form['ingredientes_json']
        foto = request.files['foto']

        # Guardar imagen si se cargó una nueva
        foto_path = guardar_imagen(foto, nombre) if foto and foto.filename else None

        # Armar diccionario para actualizar
        data_actualizacion = {
            'nombre': nombre,
            'descripcion': descripcion,
            'foto': foto_path,
            'precio': float(precio),
            'id_region_fk': id_region,
            'id_categoria_fk': int(id_categoria),
            'id_nivel_complejidad_fk': int(nivel)
        }

        # Actualizar plato
        plato_model.actualizar_plato(id, data_actualizacion)

        # Reemplazar ingredientes existentes
        plato_model.eliminar_ingredientes_de_plato(id)
        if ingredientes_json:
            ingredientes = json.loads(ingredientes_json)
            for ing in ingredientes:
                plato_ingrediente_model.agregar_ingrediente_a_plato(
                    id,
                    ing['id_ingrediente'],
                    ing['cantidad'],
                    ing['descripcion']
                )

        flash('Plato actualizado con éxito.', 'success')
        return redirect(url_for('private_plato.listado_platos'))

    # -------- GET --------
    plato = plato_model.obtener_plato_por_id(id)
    regiones = region_model.obtener_todas_regiones()
    categorias = categoria_model.obtener_categorias()
    niveles_complejidad = nivel_complejidad_model.obtener_niveles_complejidad()

    # Obtener ingredientes con toda la info necesaria (nombre, unidad, cantidad, descripción)
    ingredientes_raw = plato_ingrediente_model.obtener_ingredientes_de_plato(id)
    ingredientes_existentes = [
        {
            'id_ingrediente': ing[0],
            'nombre': ing[1],
            'unidad': ing[2],
            'cantidad': float(ing[3]),
            'breve_descripcion': ing[4]
        }
        for ing in ingredientes_raw
    ]

    print("PLATO →", plato)

    return render_template(
        'private/plato/editar_plato.html',
        plato=plato,
        regiones=regiones,
        categorias=categorias,
        niveles_complejidad=niveles_complejidad,
        ingredientes_existentes=ingredientes_existentes
    )

@private_plato_bp.route('/detalle/<int:id>')
def detalle_plato(id):
    plato = plato_model.obtener_plato_por_id(id)  # plato es una tupla
    if not plato:
        return redirect(url_for('private_plato.listado_platos'))

    print(plato)  # Esto debería imprimir la tupla completa
    return render_template('private/plato/detalle_plato.html', plato=plato)

@private_plato_bp.route('/eliminar/<int:id>')
def eliminar_plato(id):
    plato_model.eliminar_plato(id)
    return redirect(url_for('private_plato.listado_platos'))



