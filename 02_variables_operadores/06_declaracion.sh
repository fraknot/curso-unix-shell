#!/bin/bash

echo "Variable de solo lectura, o CONSTANTE"
declare -r const=18 # o readonly const
let const+=1 # Error
echo

echo "Variable entera"
declare -i entero   # o integer entero
entero=1984
echo "entero vale $entero"
entero=entero+1       # Sin necesidad de 'let'.
echo "entero mas 1 vale $entero"
echo "Intento de \"casteo\" a decimal"
entero=2367.1
echo "entero aun vale $entero"
