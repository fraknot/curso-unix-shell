#!/bin/bash

echo "Variable entera"
a=1983
let a+=1 # Otra forma de "a=a+1"
echo $a
echo

echo "\"Casteo\" a cadena"
b=${a/19/NO}
echo $b
let "b += 1" # ¿Valor entero?
echo $b
echo

echo "\"Casteo\" a entero"
c=19OK
d=${c/OK/83}
echo $d
let d+=1 
echo $d
