import re

def parsear_ingredientes_crudos(lista_raw):
    ingredientes = []

    if isinstance(lista_raw, str):
        lista_raw = lista_raw.strip('{}')
        matches = re.findall(r'\(([^)]+)\)', lista_raw)

        for match in matches:
            partes = [p.strip().replace('"', '').replace('\\', '') for p in match.split(',')]
            while len(partes) < 4:
                partes.append('')
            item = tuple(partes)
            ingredientes.append(item)

    elif isinstance(lista_raw, (list, set)):
        for item in lista_raw:
            if isinstance(item, str):
                partes = item.strip('()').split(',')
                partes = [p.strip().replace('"', '').replace('\\', '') for p in partes]
                while len(partes) < 4:
                    partes.append('')
                item = tuple(partes)
                ingredientes.append(item)
            elif isinstance(item, (tuple, list)):
                limpio = [p.strip().replace('"', '').replace('\\', '') for p in item]
                while len(limpio) < 4:
                    limpio.append('')
                item = tuple(limpio)
                ingredientes.append(item)

    return ingredientes
