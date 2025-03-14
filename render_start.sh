#!/bin/bash

mkdir -p /opt/render  # Ensure persistent storage folder exists
python manage.py migrate
python manage.py collectstatic --noinput
gunicorn portfolio.wsgi:application --bind 0.0.0.0:$PORT