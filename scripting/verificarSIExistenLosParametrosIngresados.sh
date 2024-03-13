#!/bin/bash


if [ "$#" -eq 3 ]; then
    nombre=$1
    apellido1=$2
    apellido2=$3

    inicial_nombre=$(echo $nombre | cut -c 1 )
    inicial_apellido1=$(echo $apellido1 | cut -c 1)
    inicial_apellido2=$(echo $apellido2 | cut -c 1)

    resultado="$inicial_nombre.$inicial_apellido1.$inicial_apellido2"

    echo "las iniciales son:: $resultado"

else
    echo "error: la cantidad de parametros debe se 3"
fi