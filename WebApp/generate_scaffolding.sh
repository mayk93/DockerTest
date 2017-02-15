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

echo "Name: $name"
echo "Name size: $name_size"

if [ "${name_size:-0}" -ge 3 ]; then
    mkdir $name
else
    echo "Name $1 is either empty or too short. Defaulting to WebApp."
    mkdir WebApp
fi

mkdir config
mkdir instance

echo "Done!"