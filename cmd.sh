#!/bin/bash
set -e 

if [ "$ENV" = "DEV" ]; then
    echo "Running Development Server" # Запуск сервера для разработки
    exec python "identidock.py"
elif [ "$ENV" = 'UNIT' ]; then
    echo "Running Unit Test"
    exec python "test.py"
else
    echo "Running Production Server" # Запуск сервера для эксплуатации
    exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py
fi