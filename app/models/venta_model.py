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
            INSERT INTO venta (id_franja_horaria_fk)
            VALUES (%s)
            RETURNING id_venta
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
            INSERT INTO venta (fecha, id_franja_horaria_fk)
            VALUES (NOW(), %s)
            RETURNING id_venta
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
            SELECT v.id_venta, v.fecha, f.nombre AS franja
            FROM venta v
            JOIN franja_horaria f ON v.id_franja_horaria_fk = f.id_franja_horaria
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
        query = "SELECT * FROM venta WHERE id_venta = %s"
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
        query = "DELETE FROM venta WHERE id_venta = %s"
        return safe_execute(query, (id_venta,))
    except Exception as e:
        print(f"[ERROR eliminar_venta] {e}")
        return None

# --- DASHBOARD FUNCTIONS ---

def ventas_por_mes():
    try:
        query = "SELECT * FROM venta_may ORDER BY mes"
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR ventas_por_mes] {e}")
        return []


def ventas_por_anio():
    """
    Suma de ventas agrupadas por año usando vista materializada.
    """
    try:
        query = "SELECT * FROM venta_anual_mat ORDER BY anio"
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
                SUM(f.cantidad) AS cantidad
            FROM facturar f
            JOIN plato p ON f.id_plato_fk = p.id_plato
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
                SUM(f.cantidad * f.precio_unitario) AS total
            FROM region r
            JOIN plato p ON p.id_region_fk = r.id_region
            JOIN facturar f ON f.id_plato_fk = p.id_plato
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
                p.nombre,
                SUM(f.cantidad) AS cantidad
            FROM facturar f
            JOIN plato p ON f.id_plato_fk = p.id_plato
            GROUP BY p.nombre
            ORDER BY cantidad DESC
            LIMIT 5
        """
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR top_platos] {e}")
        return []


def ventas_por_franja():
    """
    Total de ventas agrupadas por franja horaria.
    """
    try:
        query = """
            SELECT
                fh.nombre,
                SUM(f.cantidad * f.precio_unitario) AS total
            FROM franja_horaria fh
            JOIN venta v ON v.id_franja_horaria_fk = fh.id_franja_horaria
            JOIN facturar f ON f.id_venta_fk = v.id_venta
            GROUP BY fh.nombre
            ORDER BY total DESC
        """
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR ventas_por_franja] {e}")
        return []

def obtener_ventas_con_total():
    """
    Devuelve todas las ventas con su fecha, franja y total calculado.
    """
    try:
        query = """
            SELECT 
                v.id_venta,
                v.fecha,
                f.nombre AS franja,
                COALESCE(SUM(p.precio * fa.cantidad), 0) AS total
            FROM venta v
            JOIN franja_horaria f ON v.id_franja_horaria_fk = f.id_franja_horaria
            LEFT JOIN facturar fa ON v.id_venta = fa.id_venta_fk
            LEFT JOIN plato p ON fa.id_plato_fk = p.id_plato
            GROUP BY v.id_venta, v.fecha, f.nombre
            ORDER BY v.fecha DESC
        """
        return safe_execute(query, fetch=True) or []
    except Exception as e:
        print(f"[ERROR obtener_ventas_con_total] {e}")
        return []



"""
SP
"""



def ventas_por_dificultad():
    return safe_execute("SELECT * FROM sp_ventas_por_dificultad();", fetch=True)

def ingredientes_mas_usados():
    return safe_execute("SELECT * FROM sp_top_ingredientes_usados();", fetch=True)

def platos_por_categoria_mes():
    return safe_execute("SELECT * FROM sp_platos_por_categoria_mes();", fetch=True)

def precio_promedio_por_region():
    return safe_execute("SELECT * FROM sp_precio_promedio_por_region();", fetch=True)

def ventas_por_dia_semana():
    return safe_execute("SELECT * FROM sp_ventas_por_dia_semana();", fetch=True)

def top_platos_por_franja():
    return safe_execute("SELECT * FROM sp_top_platos_por_franja();", fetch=True)

def platos_por_region_dificultad():
    return safe_execute("SELECT * FROM sp_platos_por_region_dificultad();", fetch=True)