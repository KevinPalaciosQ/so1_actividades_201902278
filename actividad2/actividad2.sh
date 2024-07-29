#!/bin/bash

# Leer la variable GITHUB_USER
GITHUB_USER=$1

# Consultar la URL y obtener los datos del usuario
USER_DATA=$(curl -s https://api.github.com/users/$GITHUB_USER)

# Extraer los datos necesarios del JSON
USER_ID=$(echo $USER_DATA | jq -r '.id')
CREATED_AT=$(echo $USER_DATA | jq -r '.created_at')

# Imprimir el mensaje
echo "Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."

# Crear el directorio de log con la fecha actual
LOG_DIR="/tmp/$(date +%Y-%m-%d)"
mkdir -p $LOG_DIR

# Escribir el mensaje en el archivo de log
echo "Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT." >>
$LOG_DIR/saludos.log
