#!/bin/bash

clear
echo "Hola, $USER, te encuentras logueado en $HOSTNAME, en la carpeta $PWD utilizando la terminal $TERM. Tu ID de usuario es $UID"
echo
echo "Tu home de usuario es $HOME y tu ID de proceso actual es $$ (el padre es $PPID)."
echo
echo "Tu path es el siguiente:"
echo $PATH
echo
echo "Esta es la linea $LINENO del script"
echo "(la linea anterior de codigo se ejecuto con un status = $? -correcto-)"
echo
echo "Aqui tienes un numero aleatorio del 0 al 32767: $RANDOM"
echo
echo "Espera..."
sleep 10 
echo "Pasaron $SECONDS segundos desde que ejecutaste el script"
