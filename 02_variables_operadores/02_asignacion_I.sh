#!/bin/bash

echo "Desplegado normal"
a=18
hola=$a
echo hola
echo $hola
echo ${hola}
echo

echo Inicializada en nulo
hola=
echo $hola

echo "Sin inicializar"
echo $variable_sin_inicializar

echo "Desasignacion"
variable_sin_inicializar=36
unset variable_sin_inicializar
echo $variable_sin_inicializar

echo "Espacios en blanco"
espacios="1 2 3"
echo $espacios
espacios=1 2 3 # Error
