#!/bin/bash

clear

a=1

echo "\$a vale $a"
echo

echo "Suma"

let "a = a + 5"
echo $a

let "a++"
echo $a

echo

echo "Resta"

let "a = $a - 2"
echo $a

let "a--"
echo $a

echo

echo "Multiplicacion"

let "a *= 4"
echo $a

echo

echo "Division"

let "a /= 2"
echo $a

echo

echo "Exponenciacion" # ¿Funciona con igual a la derecha?

let "a = a ** 3"
echo $a

echo

echo "Modulo o residuo"

a=5
let "a = a % 3"
echo $a

echo

echo "¿Decimales?"

a=1.3
let "a += 2"
echo $a
