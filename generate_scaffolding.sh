#!/usr/bin/env bash

echo "Now generating scaffolding for web app deployed with docker."

echo "Now generating files."

echo "Creating requirements file."
touch requirements.txt

echo "Creating Docker file."
touch Dockerfile

echo "Creating docker compose file."
touch docker-compose.yml

echo "Creating docker ignore file."
touch .dockerignore

echo "Now generating directories."

name=$1
name_size=${#name}

if [ "${name_size:-0}" -ge 3 ]; then
    echo "Will use provided name: $name"
else
    echo "Name $1 is either empty or too short. Defaulting to WebApp."
    name="WebApp"
fi

mkdir $name
mkdir config
mkdir instance

echo "Now generating __init__ and settings files."

touch $name/__init__.py

touch config/__init__.py
touch config/settings.py

touch instance/__init__.py
touch instance/settings.py

echo "Now generating app files and directories."

touch $name/app.py

react=$2

if [ "${react:-0}" -eq "react" ]; then
    echo "React template not yet implemented! Will be added soon."
    exit
else
    mkdir templates
    mkdir static
    touch templates/layout.html
    touch static/main.css
fi

echo "Done!"