#!/bin/bash

clear

echo "if que evalua el estatus de salida de un comando"
echo "echo Hola"
if echo "Hola"
then
    echo "Sentencia ejecutada correctamente"
fi
echo "Hola"
if Hola
then
    echo "Sentencia ejecutada correctamente"
else
    echo "Sentencia erronea"
fi
echo

echo "if con \"test\""
a=1
if test $a -gt 0
then
    echo "$a es positivo"
else
    echo "$a es negativo"
fi

echo

echo "if con []"
if [ $a -ne 0 ]; then
    echo "$a no es igual a cero"
fi

echo

echo "El mismo if con [[]]"
if [[ $a -ne 0 ]]; then
    echo "$a tampoco es igual a cero"
fi

echo

echo "if con [[]]"
if [[ $a != 0 ]]; then
    echo "Nuevamente, $a no es igual a cero"
fi

echo

echo "Un if mas con [[]]"
if [[ $a = 0 ]]; then # No se cumple ya que un solo igual compara cadenas
    echo "Una vez mas, $a no es igual a cero"
else
    echo "Aqui es donde no se cumplio"
fi

echo

echo "if entre variables"
b=2
c=3
if [[ "$b" -lt "$c" ]]; then # Al comparar variables, es recomendable encerrarlas entre comillas
    echo "Cierto, $b es menor que $c"
else
    echo "Falso"
fi

echo

echo "if aritmetico con (())"
(( 0 && 1 )) # Devuelve un estatus de salida dependiendo el resultado de la evaluacion
echo $?
(( 0 || 1 ))
echo $?

exit 0
