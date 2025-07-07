"""
Modelo para manejar la relación N:M entre cartas y platos.

NOTA:
    No hay función de actualización ya que modificar un plato en una carta es equivalente a quitarlo y volverlo a agregar.

Funciones incluidas:
- asociar_plato_a_carta
- obtener_platos_de_carta
- eliminar_plato_de_carta
"""

from app.db.connection import safe_execute
from app.utils.plato import parsear_ingredientes_crudos


def obtener_platos_de_carta(id_carta):
    """
    Lista los platos incluidos en una carta.

    Args:
        id_carta (int): ID de la carta.

    Returns:
        list: Lista de platos.
    """
    try:
        query = """
            SELECT p.id_plato, p.nombre, p.precio
            FROM plato p
            JOIN detallar d ON p.id_plato = d.id_plato_fk
            WHERE d.id_carta_fk = %s AND p.disponible = TRUE
        """
        return safe_execute(query, (id_carta,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_platos_de_carta] {e}")
        return []

def obtener_platos_de_carta_por_region(id_carta, id_region):
    query = """
        SELECT p.id_plato, p.nombre, p.precio, p.foto
        FROM plato p
        JOIN detallar d ON p.id_plato = d.id_plato_fk
        WHERE d.id_carta_fk = %s AND p.id_region_fk = %s AND p.disponible = TRUE
    """
    platos  = safe_execute(query, (id_carta, id_region), fetch=True) or []

    platos_normalizados = []
    for plato in platos:
        foto_corregida = plato[3].replace("\\", "/") if plato[3] else None
        platos_normalizados.append((
            plato[0],  
            plato[1],  
            plato[2],  
            foto_corregida  
        ))
    return platos_normalizados



def obtener_platos_de_carta_por_categoria(id_carta, id_categoria):
    query = """
        SELECT p.id_plato, p.nombre, p.precio, p.foto
        FROM plato p
        JOIN detallar d ON p.id_plato = d.id_plato_fk
        WHERE d.id_carta_fk = %s AND p.id_categoria_fk = %s AND p.disponible = TRUE
    """
    return safe_execute(query, (id_carta, id_categoria), fetch=True) or []

def eliminar_plato_de_carta(id_carta, id_plato):
    """
    Elimina un plato de una carta.

    Args:
        id_carta (int): ID de la carta.
        id_plato (int): ID del plato.

    Returns:
        None
    """
    try:
        query = """
            DELETE FROM detallar
            WHERE id_carta_fk = %s AND id_plato_fk = %s
        """
        return safe_execute(query, (id_carta, id_plato))
    except Exception as e:
        print(f"[ERROR eliminar_plato_de_carta] {e}")
        return None
    
def asociar_plato_a_carta(id_carta, id_plato):
    try:
        print(f"[DEBUG asociar_plato_a_carta] Insertando {id_carta} - {id_plato}")
        query = "INSERT INTO detallar (id_carta_fk, id_plato_fk) VALUES (%s, %s)"
        params = (id_carta, id_plato)
        return safe_execute(query, params)
    except Exception as e:
        print(f"[ERROR asociar_plato_a_carta] {e} - Carta: {id_carta}, Plato: {id_plato}")
        return None



def eliminar_todos_platos_de_carta(id_carta):
    try:
        query = "DELETE FROM detallar WHERE id_carta_fk = %s"
        return safe_execute(query, (id_carta,))
    except Exception as e:
        print(f"[ERROR eliminar_todos_platos_de_carta] {e}")
        return None
    

## PARA LAS VISTAS PUBLICAS 

def obtener_regiones_con_platos_en_carta(id_carta):
    query = """
        SELECT DISTINCT r.id_region, r.nombre, r.encargado
        FROM detallar d
        JOIN plato p ON d.id_plato_fk = p.id_plato
        JOIN region r ON p.id_region_fk = r.id_region
        WHERE d.id_carta_fk = %s
    """
    return safe_execute(query, (id_carta,), fetch=True) or []

def obtener_categorias_con_platos_en_carta_por_region(id_carta, id_region):
    query = """
        SELECT DISTINCT c.id_categoria, c.nombre
        FROM plato p
        JOIN detallar d ON p.id_plato = d.id_plato_fk
        JOIN categoria c ON p.id_categoria_fk = c.id_categoria
        WHERE d.id_carta_fk = %s AND p.id_region_fk = %s AND p.disponible = TRUE
        ORDER BY c.nombre
    """
    return safe_execute(query, (id_carta, id_region), fetch=True) or []

def obtener_platos_de_carta_por_region_y_categoria(id_carta, id_region):
    query = """
        SELECT p.id_plato, p.nombre, p.descripcion, nc.nombre AS nivel, p.foto, p.precio_venta
        FROM detallar d
        JOIN plato p ON d.id_plato_fk = p.id_plato
        JOIN nivel_complejidad nc ON p.id_nivel_complejidad_fk = nc.id_nivel_complejidad
        WHERE d.id_carta_fk = %s AND p.id_region_fk = %s
    """
    return safe_execute(query, (id_carta, id_region), fetch=True) or []


def obtener_platos_de_carta_por_region_y_categoria_public(id_carta, id_region):
    query = """
        SELECT 
            p.id_plato, p.nombre, p.descripcion, p.foto, p.precio,
            n.nombre AS nivel_complejidad,
            c.nombre AS categoria
        FROM plato p
        JOIN detallar d ON p.id_plato = d.id_plato_fk
        JOIN categoria c ON p.id_categoria_fk = c.id_categoria
        JOIN nivel_complejidad n ON p.id_nivel_complejidad_fk = n.id_nivel_complejidad
        WHERE d.id_carta_fk = %s AND p.id_region_fk = %s AND p.disponible = TRUE
        ORDER BY c.nombre, p.nombre
    """
    platos = safe_execute(query, (id_carta, id_region), fetch=True) or []

    platos_normalizados = []
    for plato in platos:
        id_plato, nombre, descripcion, foto, precio, nivel, categoria = plato
        foto_corregida = foto.replace("\\", "/") if foto else None
        platos_normalizados.append({
            'id': id_plato,
            'nombre': nombre,
            'descripcion': descripcion,
            'foto': foto_corregida,
            'precio': precio,
            'nivel': nivel,
            'categoria': categoria
        })
    return platos_normalizados



def obtener_plato_con_ingredientes(id_plato):
    query = """
    SELECT 
        p.id_plato,
        p.nombre,
        p.descripcion,
        p.foto,
        p.precio,
        r.nombre AS region,
        c.nombre AS categoria,
        n.nombre AS nivel_complejidad,
        ARRAY_AGG(ROW(i.nombre, um.nombre, ctn.cantidad, ctn.breve_descripcion)) AS ingredientes
    FROM plato p
    JOIN region r ON p.id_region_fk = r.id_region
    JOIN categoria c ON p.id_categoria_fk = c.id_categoria
    JOIN nivel_complejidad n ON p.id_nivel_complejidad_fk = n.id_nivel_complejidad
    LEFT JOIN contener ctn ON p.id_plato = ctn.id_plato_fk
    LEFT JOIN ingrediente i ON ctn.id_ingrediente_fk = i.id_ingrediente
    LEFT JOIN unidad_medida um ON i.id_unidad_medida_fk = um.id_unidad_medida
    WHERE p.id_plato = %s
    GROUP BY p.id_plato, r.nombre, c.nombre, n.nombre
    """

    
    resultado = safe_execute(query, (id_plato,), fetchone=True)

    if resultado:
        ingredientes_raw = resultado[8] if resultado[8] else []
        ingredientes = parsear_ingredientes_crudos(ingredientes_raw)
    
    print("[DEBUG FINAL] Ingredientes parseados:", ingredientes)

    print("[DEBUG] Ingredientes raw:", ingredientes_raw)

    print("[DEBUG] Tipo ingredientes_raw:", type(ingredientes_raw))


    if resultado:
        return {
            'id': resultado[0],
            'nombre': resultado[1],
            'descripcion': resultado[2],
            'foto': resultado[3],
            'precio': resultado[4],
            'region': resultado[5],
            'categoria': resultado[6],
            'nivel': resultado[7],
            'ingredientes': ingredientes if ingredientes else []
        }

    return None
