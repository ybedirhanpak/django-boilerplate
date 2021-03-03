#!/bin/sh

set -e

echo "Migrate database"
python3 manage.py migrate --no-input

echo "Start debug server with live reload"
exec python3 manage.py runserver 0.0.0.0:8080
