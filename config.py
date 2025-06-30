import os
from dotenv import load_dotenv

load_dotenv()

DB_CONFIG = {
    "host": os.getenv("DB_HOST"),
    "port": os.getenv("DB_PORT"),
    "dbname": os.getenv("DB_NAME"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
}

SECRET_KEY = os.getenv("SECRET_KEY")
WTF_CSRF_SECRET_KEY = os.getenv("SECRET_KEY")

UPLOAD_FOLDER = os.getenv("UPLOAD_FOLDER", "app/uploads")
ALLOWED_EXTENSIONS = set(os.getenv("ALLOWED_EXTENSIONS", "png,jpg,jpeg").split(','))
