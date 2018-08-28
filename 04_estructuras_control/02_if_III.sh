#!/bin/bash

clear

a=4
b=5

echo "Comparacion aritmetica"
if [[ "$a" -ne "$b" ]]; then
    echo "$a no es igual a $b"
fi
if [[ "$a" -gt "$b" ]]; then
    echo "$a es mayor que $b"
else
    echo "$a es menor que $b"
fi

echo

echo "Comparacion de cadenas"
if [[ "$a" != "$b" ]]; then
    echo "$a no es igual a $b"
fi
if [[ "$a" > "$b" ]]; then
    echo "$a es mayor que $b"
else
    echo "$a es menor que $b"
fi

echo

a="hola"
b="adios"

echo "Comparacion de cadenas II"
if [[ "$a" != "$b" ]]; then
    echo "$a no es igual a $b"
fi
if [[ "$a" > "$b" ]]; then
    echo "$a es mayor que $b"
else
    echo "$a es menor que $b"
fi

echo

echo "Cadena vacia (o nula)"
cadena=''
if [[ -z "$cadena" ]]; then
    echo '$cadena es nula'
else
    echo '$cadena no es nula'
fi

echo

echo "Cadena sin inicializar"
if [[ -n "$otra_cadena" ]]; then
    echo '$otra_cadena no es nula'
else
    echo '$otra_cadena es nula'
fi

echo

exit 0
