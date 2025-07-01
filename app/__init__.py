from flask import Flask
from app.routes.private.plato_routes import private_plato_bp
from app.routes.private.region_routes import private_region_bp
from app.routes.private.categoria_routes import private_categoria_bp
from app.routes.private.ingrediente_routes import private_ingrediente_bp
from app.routes.private.carta_routes import private_carta_bp
from app.routes.private.venta_routes import private_venta_bp
from app.routes.private.usuario_routes import private_usuario_bp

from app.routes.public.plato_routes import public_plato_bp
from app.routes.public.carta_routes import public_carta_bp
from app.routes.public.region_routes import public_region_bp

from app.routes.auth.auth_routes import auth_bp


from flask_wtf import CSRFProtect

from flask import session

from config import SECRET_KEY, UPLOAD_FOLDER

from app.utils.auth import login_required  # Middleware 
from app.utils.error_handlers import register_error_handlers  # Manejo de errores 

#Para Probar la app sin BD de momento 
"""
def fake_login(app):
    @app.before_request
    def inject_fake_user():
        if 'usuario_id' not in session:
            session['usuario_id'] = 999
            session['username'] = 'fakeadmin'
            session['rol'] = 'admin'
"""
            
def create_app():
    app = Flask(__name__)
    app.secret_key = SECRET_KEY
    app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
    
    #Fake login para probar el app
    #fake_login(app)
    
    # Proteccion CSRF
    csrf = CSRFProtect()
    csrf.init_app(app)
    
    # Registrar Blueprints
    register_private_blueprint(app)
    register_public_blueprint(app)
    register_auth_blueprint(app)
    

    # Registrar manejadores de errores
    register_error_handlers(app)

    return app

def register_private_blueprint(app):
    app.register_blueprint(private_plato_bp)
    app.register_blueprint(private_region_bp)
    app.register_blueprint(private_categoria_bp)
    app.register_blueprint(private_ingrediente_bp)
    app.register_blueprint(private_carta_bp)
    app.register_blueprint(private_venta_bp)
    app.register_blueprint(private_usuario_bp)

def register_public_blueprint(app):
    app.register_blueprint(public_plato_bp)
    app.register_blueprint(public_carta_bp)
    app.register_blueprint(public_region_bp)

def register_auth_blueprint(app):
    app.register_blueprint(auth_bp)