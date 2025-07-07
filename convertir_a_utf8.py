import os
import chardet

def convertir_a_utf8_si_necesario(ruta_archivo):
    with open(ruta_archivo, 'rb') as f:
        contenido = f.read()
        if not contenido:
            print(f"⚠️  {ruta_archivo} está vacío, se omite.")
            return
        
        resultado = chardet.detect(contenido)
        codificacion = resultado.get('encoding')

    if codificacion is None:
        print(f"❌ No se pudo detectar la codificación de: {ruta_archivo}, se omite.")
        return

    if codificacion.lower() != 'utf-8':
        print(f"🔁 {ruta_archivo} estaba en {codificacion}, convirtiendo a UTF-8...")
        try:
            texto = contenido.decode(codificacion)
            with open(ruta_archivo, 'w', encoding='utf-8') as f:
                f.write(texto)
        except Exception as e:
            print(f"❌ Error al convertir {ruta_archivo}: {e}")
    else:
        print(f"✅ {ruta_archivo} ya está en UTF-8.")

def recorrer_templates_y_convertir():
    base_dir = os.path.join(os.getcwd(), 'app', 'templates')
    if not os.path.exists(base_dir):
        print("❌ No se encontró la carpeta 'app/templates'")
        return

    for root, _, files in os.walk(base_dir):
        for file in files:
            if file.endswith('.html'):
                ruta_completa = os.path.join(root, file)
                convertir_a_utf8_si_necesario(ruta_completa)

if __name__ == '__main__':
    recorrer_templates_y_convertir()
