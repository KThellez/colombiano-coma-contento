
"""
Modelo para manejar la entidad Venta.

NOTA:
    Para mantener un histórico financiero, se usan triggers que guarden las ventas y detalles al eliminar.

Funciones incluidas:
- registrar_venta
- obtener_ventas
- obtener_venta_por_id
- eliminar_venta
"""


from app.db.connection import safe_execute

def registrar_venta(franja_horaria_id):
    """
    Registra una nueva venta con franja horaria.

    Args:
        franja_horaria_id (int): ID de la franja horaria asociada.

    Returns:
        int: ID de la venta registrada.
    """
    query ="""
                INSERT INTO ventas (franja_horaria_id)
                VALUES (%s)
                RETURNING id
            """
    params =(franja_horaria_id,)
    return safe_execute(query, params)
    

def obtener_ventas():
    """
    Devuelve todas las ventas registradas.

    Returns:
        list: Lista de ventas.
    """

    query ="""
                SELECT v.id, v.fecha, f.nombre AS franja
                FROM ventas v
                JOIN franjas_horarias f ON v.franja_horaria_id = f.id
            """
    
    return safe_execute(query, fetch=True) or []


def obtener_venta_por_id(id_venta):
    """
    Obtiene los datos de una venta específica.

    Args:
        id_venta (int): ID de la venta.

    Returns:
        tuple: Datos de la venta.
    """

    query ="SELECT * FROM ventas WHERE id = %s"
    params =(id_venta,)
    return safe_execute(query, params, fetch=True) or []


def eliminar_venta(id_venta):
    """
    Elimina una venta permanentemente.
    Se espera que exista un trigger que registre esta acción en una tabla histórica.

    Args:
        id_venta (int): ID de la venta.

    Returns:
        None
    """
    query ="DELETE FROM ventas WHERE id = %s"
    params =(id_venta,)
    return safe_execute(query, params)


def crear_venta(franja_horaria_id):
    query = """
        INSERT INTO ventas (fecha, franja_horaria_id)
        VALUES (NOW(), %s)
        RETURNING id;
    """
    params = (franja_horaria_id,)
    result = safe_execute(query, params, fetch=True)
    return result[0][0] if result else None

## METODOS PARA LOS DASHBORADS


def ventas_por_mes():
    query = """
        SELECT
            TO_CHAR(fecha, 'YYYY-MM') AS mes,
            SUM(dv.cantidad * dv.precio_unitario) AS total
        FROM ventas v
        JOIN detalle_venta dv ON v.id = dv.id_venta
        GROUP BY mes
        ORDER BY mes
    """
    return safe_execute(query, fetch=True) or []


def ventas_por_anio():
    query = """
        SELECT
            EXTRACT(YEAR FROM fecha) AS anio,
            SUM(dv.cantidad * dv.precio_unitario) AS total
        FROM ventas v
        JOIN detalle_venta dv ON v.id = dv.id_venta
        GROUP BY anio
        ORDER BY anio
    """
    return safe_execute(query, fetch=True) or []


def top_platos():
    query = """
        SELECT
            p.nombre,
            SUM(dv.cantidad) AS cantidad
        FROM detalle_venta dv
        JOIN platos p ON dv.id_plato = p.id
        GROUP BY p.nombre
        ORDER BY cantidad DESC
        LIMIT 5
    """
    return safe_execute(query, fetch=True) or []


def ventas_por_region():
    query = """
        SELECT
            r.nombre,
            SUM(dv.cantidad * dv.precio_unitario) AS total
        FROM regiones r
        JOIN platos p ON p.id_region = r.id
        JOIN detalle_venta dv ON dv.id_plato = p.id
        GROUP BY r.nombre
        ORDER BY total DESC
    """
    return safe_execute(query, fetch=True) or []


def ventas_por_categoria():
    query = """
        SELECT
            c.nombre,
            SUM(dv.cantidad * dv.precio_unitario) AS total
        FROM categorias c
        JOIN platos p ON p.id_categoria = c.id
        JOIN detalle_venta dv ON dv.id_plato = p.id
        GROUP BY c.nombre
        ORDER BY total DESC
    """
    return safe_execute(query, fetch=True) or []


def ventas_por_franja():
    query = """
        SELECT
            f.nombre,
            SUM(dv.cantidad * dv.precio_unitario) AS total
        FROM franjas_horarias f
        JOIN ventas v ON v.franja_horaria_id = f.id
        JOIN detalle_venta dv ON dv.id_venta = v.id
        GROUP BY f.nombre
        ORDER BY total DESC
    """
    return safe_execute(query, fetch=True) or []