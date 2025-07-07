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
            port=os.getenv("DB_PORT"),
            options=os.getenv("DB_OPTIONS")
        )

        with conn.cursor() as cur:
            cur.execute("SHOW client_encoding;")
            encoding = cur.fetchone()
            name =  dbname=os.getenv("DB_NAME")
            print("[INFO] Codificación cliente:", encoding)
            print(name)
        
        return conn
    except Exception as e:
        print("[ERROR] Error al conectar con la base de datos:", e)
        return None

def safe_execute(query, params=None, fetch=False, fetchone=False, many=False):
    conn = None
    try:
        conn = get_connection()
        if not conn:
            return [] if fetch or fetchone else None

        with conn.cursor() as cur:
            if params and many:
                cur.executemany(query, params)
            elif params:
                cur.execute(query, params)
            else:
                cur.execute(query)

            if fetchone:
                result = cur.fetchone()
            elif fetch:
                result = cur.fetchall()
            else:
                result = True

        conn.commit()
        return result
    except Exception as e:
        print("Error ejecutando consulta:", e)
        if conn:
            conn.rollback()
        return [] if fetch or fetchone else None
    finally:
        if conn:
            conn.close()
