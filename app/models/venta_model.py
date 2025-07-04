"""
Modelo para manejar la entidad Venta.

NOTA:
    Para mantener un histórico financiero, se usan triggers que guarden las ventas y detalles al eliminar.

Funciones incluidas:
- registrar_venta
- obtener_ventas
- obtener_venta_por_id
- eliminar_venta
- crear_venta
- dashboards: ventas por mes/año, top platos, por región, categoría, franja
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
    try:
        query = """
            INSERT INTO venta (franja_horaria_id)
            VALUES (%s)
            RETURNING id
        """
        return safe_execute(query, (franja_horaria_id,), fetch=True)
    except Exception as e:
        print(f"[ERROR registrar_venta] {e}")
        return None


def crear_venta(franja_horaria_id):
    """
    Registra una venta con fecha actual.

    Args:
        franja_horaria_id (int): ID de la franja horaria.

    Returns:
        int: ID de la venta.
    """
    try:
        query = """
            INSERT INTO venta (fecha, franja_horaria_id)
            VALUES (NOW(), %s)
            RETURNING id
        """
        result = safe_execute(query, (franja_horaria_id,), fetch=True)
        return result[0][0] if result else None
    except Exception as e:
        print(f"[ERROR crear_venta] {e}")
        return None


def obtener_ventas():
    """
    Devuelve todas las ventas registradas.

    Returns:
        list: Lista de ventas.
    """
    try:
        query = """
            SELECT v.id, v.fecha, f.nombre AS franja
            FROM venta v
            JOIN franja_horaria f ON v.franja_horaria_id = f.id
        """
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_ventas] {e}")
        return []


def obtener_venta_por_id(id_venta):
    """
    Obtiene los datos de una venta específica.

    Args:
        id_venta (int): ID de la venta.

    Returns:
        tuple: Datos de la venta.
    """
    try:
        query = "SELECT * FROM venta WHERE id = %s"
        return safe_execute(query, (id_venta,), fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_venta_por_id] {e}")
        return []


def eliminar_venta(id_venta):
    """
    Elimina una venta permanentemente.

    Args:
        id_venta (int): ID de la venta.

    Returns:
        None
    """
    try:
        query = "DELETE FROM venta WHERE id = %s"
        return safe_execute(query, (id_venta,))
    except Exception as e:
        print(f"[ERROR eliminar_venta] {e}")
        return None

# --- DASHBOARD FUNCTIONS ---

def ventas_por_mes():
    """
    Suma de ventas agrupadas por mes.
    """
    try:
        query = """
            SELECT
                TO_CHAR(fecha, 'YYYY-MM') AS mes,
                SUM(dv.cantidad * dv.precio_unitario) AS total
            FROM venta v
            JOIN detalle_venta dv ON v.id = dv.id_venta
            GROUP BY mes
            ORDER BY mes
        """
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR ventas_por_mes] {e}")
        return []


def ventas_por_anio():
    """
    Suma de ventas agrupadas por año.
    """
    try:
        query = """
            SELECT
                EXTRACT(YEAR FROM fecha) AS anio,
                SUM(dv.cantidad * dv.precio_unitario) AS total
            FROM venta v
            JOIN detalle_venta dv ON v.id = dv.id_venta
            GROUP BY anio
            ORDER BY anio
        """
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR ventas_por_anio] {e}")
        return []


def top_platos():
    """
    Top 5 platos más vendidos por cantidad.
    """
    try:
        query = """
            SELECT
                p.nombre,
                SUM(dv.cantidad) AS cantidad
            FROM detalle_venta dv
            JOIN plato p ON dv.id_plato = p.id
            GROUP BY p.nombre
            ORDER BY cantidad DESC
            LIMIT 5
        """
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR top_platos] {e}")
        return []


def ventas_por_region():
    """
    Total de ventas agrupadas por región.
    """
    try:
        query = """
            SELECT
                r.nombre,
                SUM(dv.cantidad * dv.precio_unitario) AS total
            FROM region r
            JOIN plato p ON p.id_region = r.id
            JOIN detalle_venta dv ON dv.id_plato = p.id
            GROUP BY r.nombre
            ORDER BY total DESC
        """
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR ventas_por_region] {e}")
        return []


def ventas_por_categoria():
    """
    Total de ventas agrupadas por categoría.
    """
    try:
        query = """
            SELECT
                c.nombre,
                SUM(dv.cantidad * dv.precio_unitario) AS total
            FROM categoria c
            JOIN plato p ON p.id_categoria = c.id
            JOIN detalle_venta dv ON dv.id_plato = p.id
            GROUP BY c.nombre
            ORDER BY total DESC
        """
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR ventas_por_categoria] {e}")
        return []


def ventas_por_franja():
    """
    Total de ventas agrupadas por franja horaria.
    """
    try:
        query = """
            SELECT
                f.nombre,
                SUM(dv.cantidad * dv.precio_unitario) AS total
            FROM franja_horaria f
            JOIN venta v ON v.franja_horaria_id = f.id
            JOIN detalle_venta dv ON dv.id_venta = v.id
            GROUP BY f.nombre
            ORDER BY total DESC
        """
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR ventas_por_franja] {e}")
        return []
