# app/utils/error_handlers.py

from flask import render_template

def register_error_handlers(app):
    @app.errorhandler(404)
    def not_found_error(error):
        return render_template('public/404.html'), 404

    @app.errorhandler(500)
    def internal_error(error):
        return render_template('public/500.html'), 500
