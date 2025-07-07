import os
from werkzeug.utils import secure_filename
from datetime import datetime
from flask import current_app

def guardar_imagen(file, nombre_plato):
    if file and file.filename != '':
        extension = file.filename.rsplit('.', 1)[1].lower()
        nombre_seguro = secure_filename(nombre_plato.lower().replace(" ", "_"))
        timestamp = datetime.now().strftime("%Y%m%d")
        nuevo_nombre = f"{nombre_seguro}_{timestamp}.{extension}"

        ruta_relativa = f"uploads/{nuevo_nombre}" 
        ruta_completa = os.path.join(current_app.root_path, 'static', *ruta_relativa.split('/'))

        os.makedirs(os.path.dirname(ruta_completa), exist_ok=True)

        file.save(ruta_completa)
        return ruta_relativa 
    return None
