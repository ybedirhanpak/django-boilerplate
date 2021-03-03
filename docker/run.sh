#!/bin/sh

set -e

echo "Migrate database"
python3 manage.py migrate --no-input

echo "Start server"
exec gunicorn app_django.wsgi --bind=0.0.0.0:8080
