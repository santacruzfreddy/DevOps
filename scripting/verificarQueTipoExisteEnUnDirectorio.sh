#!/bin&bash

read -p "Ingresar un directorio: " dir

if [ -d $dir ]; then
    echo "Listado de archivos en $dir"
    for archivo in $dir/*; do
        if [ -f $archivo ]; then
            echo "Es un archivo: $archivo"
        elif [ -d $archivo ]; then
            echo "Es un directorio: $archivo"
        else
         echo "Es desconocido: $archivo"
        fi
    done 
else 
    echo "El directorio $dir no existe"
    exit 1
fi