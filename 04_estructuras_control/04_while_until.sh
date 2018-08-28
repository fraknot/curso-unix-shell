#/bin/bash

clear

echo "while normal"

a=1
limite=10

while [[ "$a" -le "$limite" ]]; do
    echo -n "$a "
    ((a++))
done

echo; echo

echo "while con sintaxis de C"

a=1
limite=10

while ((a<=limite)); do
    echo -n "$a "
    ((a++))
done

echo; echo

echo "until"

echo

condicion=fin

until [[ "$a" = "$condicion" ]]; do
    echo "Introduce valor"
    echo "($condicion para terminar)"
    read a
    echo "valor = $a"
done

echo

exit 0
