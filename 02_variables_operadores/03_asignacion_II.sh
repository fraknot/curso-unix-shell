#!/bin/bash

echo Asignacion normal
a=18
echo "El valor de \"a\" es $a."
echo

echo "Asignacion utilizando let"
let a=16+5
echo "\"a\" ahora vale $a."
echo

echo "Asignacion sin let"
a=16+5
echo "\"a\" ahora vale $a."
echo

echo "Sustitucion de comandos"
a=`echo Hola`
echo "¡$a mundo!"
echo

echo "Sustitucion de comandos II"
a=$(echo Hola)
echo "¡$a de nuevo, mundo!"
echo

echo "Utilizando read"
echo -n "Introduce \"a\": "
read a
echo "\"a\" ahora vale $a."
echo

echo "Desasignando"
unset a
echo "\"a\" finalmente vale $a"
