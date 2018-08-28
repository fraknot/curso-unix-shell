#!/bin/bash

clear

min_parametros=2

if [ "$#" -lt "$min_parametros" ]; then
    echo "Necesitas ejecutar este script con al menos 2 parametros"
    exit 1 
else
    if [ "$UID" -ne 0 ]; then
        echo "Necesitas ejecutar este script como root"
        exit 1
    fi
fi

echo "Introduce un numero"
read a

if [ "$a" -lt 1 -o "$a" -gt 32767 ]; then
    echo "$a es una entrada no valida"
    exit 1
fi

numero=$RANDOM
let "numero%=$a"

echo "Numero aleatorio en el rango 1-$a: $numero"

exit 0
