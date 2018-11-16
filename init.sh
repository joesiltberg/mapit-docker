#!/bin/bash

python manage.py collectstatic --no-input

gunicorn --chdir project --bind :8000 project.wsgi:application
