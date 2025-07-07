from flask import Blueprint, render_template, jsonify
import json
from app.models import venta_model

private_dashboard_bp = Blueprint('private_dashboard',__name__,url_prefix='/private/dashboard')

@private_dashboard_bp.route('/')
def dashboard_home():
    return render_template('private/dashboard/dashboard.html')


@private_dashboard_bp.route('/ventas_mensuales')
def ventas_mensuales():
    datos = venta_model.ventas_por_mes()
    chart_data = {
        'labels': [row[0] for row in datos],
        'data': [float(row[1]) for row in datos]
    }
    return jsonify(chart_data)


@private_dashboard_bp.route('/ventas_anuales')
def ventas_anuales():
    datos = venta_model.ventas_por_anio()
    chart_data = {
        'labels': [str(row[0]) for row in datos],
        'data': [float(row[1]) for row in datos]
    }
    return jsonify(chart_data)


@private_dashboard_bp.route('/top_platos')
def top_platos():
    datos = venta_model.top_platos()
    chart_data = {
        'labels': [row[0] for row in datos],
        'data': [int(row[1]) for row in datos]
    }
    return jsonify(chart_data)


@private_dashboard_bp.route('/ventas_por_region')
def ventas_por_region():
    datos = venta_model.ventas_por_region()
    chart_data = {
        'labels': [row[0] for row in datos],
        'data': [float(row[1]) for row in datos]
    }
    return jsonify(chart_data)


@private_dashboard_bp.route('/ventas_por_categoria')
def ventas_por_categoria():
    datos = venta_model.ventas_por_categoria()
    chart_data = {
        'labels': [row[0] for row in datos],
        'data': [float(row[1]) for row in datos]
    }
    return jsonify(chart_data)


@private_dashboard_bp.route('/ventas_por_franja')
def ventas_por_franja():
    datos = venta_model.ventas_por_franja()
    chart_data = {
        'labels': [row[0] for row in datos],
        'data': [float(row[1]) for row in datos]
    }
    return jsonify(chart_data)



# Endpoints para los nuevos SPs

@private_dashboard_bp.route('/ventas_por_dificultad')
def chart_ventas_dificultad():
    datos = venta_model.ventas_por_dificultad()
    chart_data = {
        'labels': [row[0] for row in datos],
        'data': [int(row[1]) for row in datos]
    }
    return jsonify(chart_data)

@private_dashboard_bp.route('/ingredientes_mas_usados')
def chart_ingredientes_usados():
    datos = venta_model.ingredientes_mas_usados()
    chart_data = {
        'labels': [row[0] for row in datos],
        'data': [int(row[1]) for row in datos]
    }
    return jsonify(chart_data)

@private_dashboard_bp.route('/platos_por_categoria_mes')
def chart_platos_categoria_mes():
    datos = venta_model.platos_por_categoria_mes()
    chart_data = {
        'labels': [f"{row[0]} - {row[1]}" for row in datos],  # Mes - Categoría
        'data': [int(row[2]) for row in datos]
    }
    return jsonify(chart_data)


@private_dashboard_bp.route('/precio_promedio_por_region')
def chart_precio_promedio_region():
    datos = venta_model.precio_promedio_por_region()
    chart_data = {
        'labels': [row[0] for row in datos],
        'data': [float(row[1]) for row in datos]
    }
    return jsonify(chart_data)

@private_dashboard_bp.route('/ventas_por_dia_semana')
def chart_ventas_dia_semana():
    datos = venta_model.ventas_por_dia_semana()
    chart_data = {
        'labels': [row[0] for row in datos],
        'data': [int(row[1]) for row in datos]
    }
    return jsonify(chart_data)


@private_dashboard_bp.route('/top_platos_por_franja')
def chart_top_platos_franja():
    datos = venta_model.top_platos_por_franja()
    chart_data = {
        'labels': [f"{row[0]} - {row[1]}" for row in datos],  # Franja - Plato
        'data': [int(row[2]) for row in datos]
    }
    return jsonify(chart_data)

@private_dashboard_bp.route('/platos_por_region_dificultad')
def chart_platos_region_dificultad():
    datos = venta_model.platos_por_region_dificultad()
    chart_data = {
        'labels': [f"{row[0]} - {row[1]}" for row in datos],
        'data': [int(row[2]) for row in datos]
    }
    return jsonify(chart_data)
