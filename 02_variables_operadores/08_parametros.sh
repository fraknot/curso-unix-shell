#!/bin/bash

clear
echo "Este script se llama $0 y esta recibiendo $# parametros."
echo "El parametro 1 es $1."
echo "El parametro 9 es $9."
echo "El parametro 11 es ${11}" # $11 manda error
echo "Estos son todos los parametros: $*"
