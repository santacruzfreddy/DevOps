#!/bin/bash

TASK_FILE="tareas.txt"

###funciones
agregar_tarea(){
    echo -n "Ingrese la descripcion de la tarea "
    read descripcion
    echo -n "Ingrese la fecha de vencimiento de la tarea "
    read fecha
    tarea_id=$(date +%s)
    echo "$tarea_id | $descripcion | $fecha | Pendiente ">> $TASK_FILE
    echo "Tarea agregada con el id $tarea_id"
}

listar_tareas(){
    echo "Tareas Pendiente"
    while IFS="|" read -r id descripcion fecha estado; do
    if [ "$estado" != " completada" ]; then
    echo "la tarea es "
    echo "ID $id"
    echo "Descripcion $descripcion"
    echo "Fecha $fecha"
    echo "Estado $estado"
    echo "---------------------------------"
    fi
    done < $TASK_FILE
}

marcar_tarea_completada()
{
    echo "Ingrese id: "
    read id
    sedExpresion="/$id/s/$/ | completada/"
    echo "Expresión de sed: $sedExpresion"
    sed -i "$sedExpresion" "$TASK_FILE"
    echo "Tarea finalizada"
}

eliminar_tarea()
{
    echo "Ingrese id, de la tarea que desea eliminar: "
    read id
    sedExpresion="/$id/d"
    echo "Expresión de sed: $sedExpresion"
    sed -i "$sedExpresion" "$TASK_FILE"
    echo "Tarea finalizada"
}

while true; do
    echo "Sistema de tareas"
    echo "1. agregar tarea"
    echo "2. Listar tareas"
    echo "3. Marcar tarea completada"
    echo "4. eliminar tarea"
    echo "5. salir"
    echo -n "Seleccione una opcion:"

    read opcion

    case $opcion in 
        1) agregar_tarea ;;
        2) listar_tareas ;;
        3) marcar_tarea_completada ;;
        4) eliminar_tarea ;;
        5) echo "Saliendo del programa"; exit 1 ;;
        *) echo "opcion invalidad" ;;
    esac
done