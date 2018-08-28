#!/bin/bash

clear

echo "Operaciones con archivos"
echo

a1="uno.txt"
a2="dos.txt"
a3="tres.txt"

d1="../04_estructuras_control"

echo "if simple"
if [[ -e "$a1" ]]; then
    echo "El archivo $a1 existe en el directorio actual $PWD"
fi
echo

echo "if anidado"
if [[ -d "$d1" ]]; then
    echo "El directorio actual existe y es $d1"
    if [[ -f "$d1" ]]; then
        echo "Sin embargo, $d1 no es un archivo" #No se cumple
    else
        echo "Efectivamente, $d1 es un directorio"
    fi
fi
echo

echo "if - elif"
if [[ -e "$a3" ]]; then
    echo "El archivo $a3 existe" # No se cumple
elif [[ -e "$a2" ]]; then
    echo "El archivo $a2 existe"
    if [[ -s "$a2" ]]; then
        echo "El archivo $a2 no esta vacio" # No se cumple
    else
        if [[ "$a1" -ot "$a2" ]]; then
            echo "$a1 se creo antes que $a2"
        fi
    fi
fi
echo

echo "if - permisos"

b="cuatro"
c="$b.txt"
touch "$c"
nuevo_archivo="$PWD/$c"
chmod 500 $nuevo_archivo

if [[ -w "$nuevo_archivo" ]]; then
    echo "El nuevo archivo tiene permisos de escritura para el usuario propietario"
else
    if [[ -r "$nuevo_archivo" && -x "$nuevo_archivo" ]]; then
        echo "El nuevo archivo \"$nuevo_archivo\" tiene permisos de lectura y ejecucion"
    fi
    if [[ -h "$nuevo_archivo" || -O "$nuevo_archivo" ]]; then
        echo "El nuevo_archivo \"$nuevo_archivo\" no es un link simbolico, pero es propiedad de $USER"
    fi
fi

rm $nuevo_archivo

exit 0
