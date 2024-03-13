#!/bin&bash

read -p "Ingresar un directorio: " dir

if [ -d $dir ]; then
    echo "Listado de archivos en $dir"
    ls $dir
else 
    echo "El directorio $dir no existe"
    exit 1
fi