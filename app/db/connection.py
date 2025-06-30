import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

def get_connection():
    try:
        conn = psycopg2.connect(
            dbname=os.getenv("DB_NAME"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            host=os.getenv("DB_HOST"),
            port=os.getenv("DB_PORT")
        )
        return conn
    except Exception as e:
        print("[ERROR] Error al conectar con la base de datos:", e)
        return None

def safe_execute(query, params=None, fetch=False, many=False):
    try:
        conn = get_connection()
        if not conn:
            return [] if fetch else None

        with conn:
            with conn.cursor() as cur:
                if params and many:
                    cur.executemany(query, params)
                elif params:
                    cur.execute(query, params)
                else:
                    cur.execute(query)

                if fetch:
                    return cur.fetchall()
    except Exception as e:
        print("Error ejecutando consulta:", e)
        return [] if fetch else None
    finally:
        if conn:
            conn.close()