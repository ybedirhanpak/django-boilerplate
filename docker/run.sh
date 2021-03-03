#!/bin/sh

set -e

echo "Migrate database"
python3 manage.py migrate --no-input

echo "Start server"
exec gunicorn django_boilerplate.wsgi --bind=0.0.0.0:8080
