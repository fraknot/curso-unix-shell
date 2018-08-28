#!/bin/bash

echo "Desplegado normal"
a=1984
echo $a
echo ${a}
echo

echo "Desplegado con comillas dobles"
echo "$a"
echo "${a}"
echo

echo "Desplegado con comillas simples"
echo '$a'
echo '${a}'
echo

echo "Contemplando espacios"
b="A B  C   D"
echo $b
echo "$b"
echo '$b'
echo

echo "Valor nulo"
c=
echo $c
echo "$c"
echo '$c'
