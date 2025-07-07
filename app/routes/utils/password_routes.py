from flask import Blueprint, render_template, request, session, abort
from werkzeug.security import generate_password_hash

from app.utils.auth import login_required

utils_bp = Blueprint('utils', __name__, url_prefix='/utils')

@utils_bp.route('/generar-password', methods=['GET', 'POST'])
@login_required
def generar_password():
    # SOLO PERMITIR A ADMIN
    if session.get("rol") != "admin":
        abort(403)

    sql_result = ''
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        rol = request.form['rol']

        hashed = generate_password_hash(password, method='pbkdf2:sha256', salt_length=8)
        sql_result = f"INSERT INTO usuarios (username, password, rol)\nVALUES ('{username}', '{hashed}', '{rol}');"

    return render_template('utils/generar_password.html', sql_result=sql_result)
