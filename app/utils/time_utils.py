from datetime import datetime, time

def determinar_franja_horaria():
    ahora = datetime.now().time()

    if time(4,0) <= ahora < time(12,0):
        return 1  # ID de franja desayuno
    elif time(12,0) <= ahora < time(18,0):
        return 2  # ID de franja almuerzo
    else:
        return 3  # ID de franja cena