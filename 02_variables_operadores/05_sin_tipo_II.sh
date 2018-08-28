#!/bin/bash

echo "Variable \"nula\""
a=
let a+=1
echo $a
echo

echo "Variable no declarada"
let "b += 1"
echo $b

# ¿Que pasa con una division entre cero?
