#/bin/bash

clear

echo "Lista normal"
for planeta in Mercurio Venus Tierra Marte Jupiter Saturno Urano Neptuno Pluton; do
    echo $planeta
done

echo

echo "Lista entre comillas"
for planeta in "Mercurio Venus Tierra Marte Jupiter Saturno Urano Neptuno Pluton"; do
    echo $planeta
done

echo

echo "Sustitucion de comandos"
numeros="9 7 3 8 37.53"
for numero in $(echo $numeros); do
    echo -n "$numero "
done

echo; echo

echo "Contadores 1"
for a in 1 2 3 4 5 6 7 8 9 10; do
    echo -n "$a "
done

echo; echo

echo "Contadores 2"
for a in $(seq 10); do
    echo -n "$a "
done

echo; echo

echo "Contadores 3"
for a in {1..10}; do
    echo -n "$a "
done

echo; echo

echo "Contadores estilo C"
limite=10
for (( a=1; a<=limite ;a++)); do
    echo -n "$a "
done

echo; echo

echo "for anidado"
for a in 1 2 3; do
    for b in a b c; do
        echo -e "Ciclo externo: $a Ciclo interno: $b\n"
    done
done

exit 0
