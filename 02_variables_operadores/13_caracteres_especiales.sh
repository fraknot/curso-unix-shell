#!/bin/bash

clear
echo "Punto"
. 01_referencia.sh
echo "La variable \$a vale $a."
echo

echo "Asterisco"
echo "Los archivos que contienen numeros romanos en el nombre son:"
ls -l *I*
echo

echo "Pipe"
echo "Los archivos que contienen el numero 2 romano en el nombre son:"
ls -l *I* | grep II
echo

echo "Interrogacion"
echo "Los archivos que tienen una extension con longitud de 3 valores son:"
ls -l *.???
echo

echo "Corchetes o parentesis cuadrados"
echo "Los archivos que comienzan con un numero 1 en el nombre son:" 
ls -l [1]*
