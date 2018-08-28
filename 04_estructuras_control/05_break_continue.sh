#/bin/bash

clear

echo "continue"
echo

limite=19

echo "Desplegado del 1 al 20 (excepto 3 y 11)"

a=0

while [[ "$a" -le "$limite" ]]; do

    ((a++))
    if [[ "$a" -eq 3 ]] || [[ "$a" -eq 11 ]]; then
        continue # Salta las iteraciones de 3 y 11
    fi

    echo -n "$a "

done

echo; echo

echo "break"
echo

echo "Ciclo hasta la iteracion 2"
a=0

while [[ "$a" -le "$limite" ]]; do

    ((a++))
    if [[ "$a" -gt 2 ]]; then
        break # Romple el ciclo completo
    fi

    echo -n "$a "

done

echo; echo

echo "Rompiendo ciclos anidados"

for cicloexterior in 1 2 3 4 5; do

    echo -n "Grupo $cicloexterior:   "

    for ciclointerior in 1 2 3 4 5; do
        echo -n "$ciclointerior "

        if [[ "$ciclointerior" -eq 3 ]]; then
            break # ¿Que pasa con el parametro 2?
        fi
    done

    echo

done

echo

for cicloexterior in 1 2 3 4 5; do

    echo -n "Grupo $cicloexterior:   "

    for ciclointerior in 1 2 3 4 5; do
        echo -n "$ciclointerior "

        if [[ "$ciclointerior" -eq 3 ]]; then
            break 2
        fi
    done

    echo

done

echo

exit 0
