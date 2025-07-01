from flask import Blueprint, render_template, request, redirect, url_for, session
from app.models import usuario_model

auth_bp = Blueprint('auth', __name__, url_prefix='/auth')


"""
@auth_bp.route('/login', methods=['GET', 'POST'])

def login():
    if request.method == 'POST':
        # fake login ok
        session['usuario_id'] = 1
        session['username'] = 'fakeadmin'
        session['rol'] = 'admin'
        return redirect(url_for('private_plato.listado_platos'))
    return render_template('auth/login.html')
"""

@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        usuario = usuario_model.obtener_usuario_por_username(username)
        if usuario and usuario[2] == password:  # ⚠️ Solo temporal (sin encriptar)
            session['usuario_id'] = usuario[0]
            session['username'] = usuario[1]
            session['rol'] = usuario[3]
            return redirect(url_for('private_plato.listado_platos'))  # Redirige al dashboard admin cuando tenga un home

        return render_template('auth/login.html', error="Credenciales inválidas")
    
    return render_template('auth/login.html')


@auth_bp.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('public_plato.listado_platos_public'))
