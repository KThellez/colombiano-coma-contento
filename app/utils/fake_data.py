def obtener_platos_fake():
    return [
        (1, "Bandeja Paisa", "Plato típico", "Media", "", 20000, 1, 2),
        (2, "Ajiaco", "Sopa tradicional", "Baja", "", 15000, 3, 1),
    ]

def obtener_regiones_fake():
    return [
        (1, "Antioquia", "Carlos Perez"),
        (2, "Cundinamarca", "Maria Lopez"),
    ]

def obtener_categorias_fake():
    return [
        (1, "Típicos"),
        (2, "Sopas"),
    ]

def obtener_cartas_fake():
    return [
        (1, "Carta Invierno", "2025-06-01", "2025-08-31"),
        (2, "Carta Verano", "2025-12-01", "2026-02-28"),
    ]

def obtener_ingredientes_fake():
    return [
        (1, "Arroz", "kg"),
        (2, "Pollo", "kg"),
    ]

def obtener_usuarios_fake():
    return [
        (1, "admin", "hashedpwd", "admin"),
        (2, "editor", "hashedpwd", "editor"),
    ]

def obtener_ventas_fake():
    return [
        (1, "2025-06-25", "Juan Perez", 35000),
    ]

def obtener_detalle_venta_fake():
    return [
        (1, 1, "Bandeja Paisa", 2, 17500, 35000),
    ]