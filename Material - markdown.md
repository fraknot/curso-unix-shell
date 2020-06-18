# El sistema operativo UNIX

Sistema operativo robusto y estable, desarrollado en los 60's, multiusuario y multitasking, para servidores, escritorios y laptops.

## Características

Cuenta con una interfaz gráfica (*GUI*) que facilita su utilización, sin embargo es necesario tener conocimiento del sistema operativo y su funcionamiento para realizar operaciones que no están cubiertas por un ambiente gráfico o en los casos en los que éste no existe, por ejemplo, en sesiones remotas de telnet.

Otras características importantes:

* Utilerías. UNIX contiene una gran variedad de utilerías (o *programas de utilidad*) que pueden ser adaptadas para realizar tareas específicas. Estas utilerias son flexibles, adaptables, portables y modulares, y pueden ser usadas junto con filtros y redireccionamientos para hacerlos más poderosos.
* Soporte multiusuario. UNIX puede soportar desde uno hasta más de 100 usuarios, ejecutando cada uno de ellos un conjunto diferente de programas, esto dependiendo de los recursos del equipo donde se hospeda.
* I/O independiente al dispositivo. Los dispositivos (como una impresora o una terminal) y los archivos en disco son considerados como archivos por UNIX. Cuando se da una instrucción a UNIX, se le puede indicar que envíe el resultado a cualquiera de los diversos dispositivos o archivos. 
En forma similar, la entrada de un programa puede redireccionarse para que venga de un archivo en disco. En el UNIX, la entrada y la salida son INDEPENDIENTES DEL DISPOSITIVO, pueden redireccionarse hacia o desde cualquier dispositivo.
* Comunicación entre procesos. Un pipe (o *conducto*) redirige la salida de un programa para que se convierta en entrada de otro. Un filtro es un programa elaborado para procesar un flujo de datos de entrada y producir otro con datos de salida. Los conductos y filtros se utilizan para unir utilerías y realizar alguna tarea específica.
* Soporte multitasking.
* Kernel y Shell (o *terminal*). Dos de las partes más importantes de UNIX. Se revisarán más adelante con mucho mayor detalle.

Es importante también mencionar que en UNIX todo es identificado como un **archivo** o un **proceso**.

* Un proceso es un programa ejecutado identificado por un único id, llamado PID (*process identifier*).
* Un archivo es un conjunto o una colección de datos identificada por un nombre. Ejemplos: un documento, un código fuente escrito en algún lenguaje de programación, un binario ejecutable y un directorio incluyendo información sobre su contenido, que puede ser una mezcla de otros directorios y archivos ordinarios.

## Usuarios

UNIX gestiona los usuarios del sistema mediante los nombres de usuario y los grupos a los que pertenecen.

* Son creados y administrados por el usuario **root**.
* Cuentan con un login y un password.
* Se les asocia un perfil, una ruta para almacenar sus documentos (dentro de la carpeta home) y un intérprete de comandos.

        % pwd
        /home/ulfix

Al ejecutar una aplicación, UNIX asocia el proceso de la misma al usuario que la levantó. De la misma forma, los archivos creados por el usuario son asignados a su propiedad.

    % ls -l algo.txt
    -rw-rw-r-- 1 makingdevs makingdevs 0 abr 30 16:54 algo.txt

UNIX codifica los usuarios asignando un número diferente a cada uno, el cual es el identificador de usuario (**uid = User IDentifier**). Internamente el sistema trabaja con el uid, no con el nombre del usuario. Normalmente a los usuarios creados por el administrador se les asignan uids desde 1000 en adelante. Los números uid menores que 100 se reservan para usuarios especiales del sistema.

La información de los usuarios del sistema se encuentra en el archivo */etc/passwd*, mientras que las contraseñas se almacenan en */etc/shadow*.

UNIX permite la organización de usuarios en grupos y establecer permisos a los grupos. Todo usuario pertenece al menos a un grupo de usuarios, el cual es el principal, o primario. Los grupos pueden contener varios usuarios, más no otros grupos, además son codificados con un número único, el cual es el identificador de grupo (**gid = Group IDentifier**). Internamente el sistema trabaja con el gid, no con el nombre del grupo.

La información de los grupos del sistema se encuentra en el archivo */etc/group*.

### Usuario root

*root* es el usuario administrador del sistema, el cual cuenta con privilegios sobre todos los usuarios, grupos y carpetas. Su uid es igual a cero.

### Operaciones con usuarios y grupos

* **useradd** - Creación de usuarios
* **usermod** - Modificación de usuarios
* **userdel** - Eliminación de usuarios
* **groupadd** - Creación de grupos
* **groupmod** - Modificación de grupos
* **groupdel** - Eliminación de grupos
* **useradd** - Agregar usuarios a grupos
* **userdel** - Eliminar usuarios a grupos

### Permisos

Tomando en cuenta el ejemplo anterior del archivo **algo.txt**:

    % ls -l algo.txt
    -rw-rw-r-- 1 makingdevs makingdevs 0 abr 30 16:54 algo.txt

La primer columna muestra los permisos del archivo. UNIX gestiona los mismos mediante un esquema de tres tipos:

* Lectura (r).
* Escritura (w).
* Ejecución (x).

De la misma forma, esta columna de los permisos, se observa que cuenta con 10 posiciones:

    -rw-rw-r--

En donde, por número de posición, se tiene que:

1. Indica el tipo de archivo.
2. Permiso de lectura para el propietario.
3. Permiso de escritura para el propietario.
4. Permiso de ejecución para el propietario.
5. Permiso de lectura para el grupo.
6. Permiso de escritura para el grupo.
7. Permiso de ejecución para el grupo.
8. Permiso de lectura para el resto de usuarios.
9. Permiso de escritura para el resto de usuarios.
10. Permiso de ejecución para el resto de usuarios.

### Comandos que gestionan los propietarios y permisos de los archivos

* **chown** - Cambia el propietario del archivo (usuario y grupo).
* **chgrp** - Cambia el grupo del archivo.
* **chmod** - Cambia los permisos del archivo.

Los permisos pueden representarse mediante la siguiente tabla de números binarios:

    Código  Binario  Permiso
      0      0 0 0     ---
      1      0 0 1     --x
      2      0 1 0     -w-
      3      0 1 1     -wx
      4      1 0 0     r--
      5      1 0 1     r-x
      6      1 1 0     rw-
      7      1 1 1     rwx

## Estructura de archivos

UNIX organiza sus archivos en una estructura de árbol llamada *filesystem*. Los directorios más importantes del mismo son:

* **/ (raíz)** - El directorio raíz que alberga todas las estructuras de archivos.
* **/bin** - Binarios. Contiene las utilerías de sistema.
* **/boot** - Contiene los archivos y binarios necesarios para el arranque correcto del sistema.
* **/dev** - Contiene los archivos que representan los dispositivos periféricos.
* **/etc** - Contiene entre otros, archivos de configuración de aspectos del sistema.
* **/home** - Contiene las carpetas de inicio de los usuarios del sistema.
* **/lib** - Contiene las librerías necesarias para los ejecutables contenidos en /bin.
* **/mnt** - Contiene puntos de montaje de discos.
* **/opt** - Contiene software instalado localmente.
* **/root** - Home del usuario root.
* **/sbin** - Contiene los binarios del usuario root y otras utilerías fundamentales de sistema.
* **/tmp** - Directorio de archivos temporales utilizados por las aplicaciones y utilerías del sistema.
* **/usr** - Contiene binarios y librerías que no son críticas para el sistema.
* **/var** - Contiene archivos que pueden ser variables en su peso, como bitácoras del sistema.

Hablando de directorios, el caracter punto (.) representa el directorio actual, y dos puntos seguidos (..) representa el directorio padre al actual.

Si un nombre de archivo comienza con un punto, el mismo será considerado como oculto.

    % ls -l algo.txt
    -rw-rw-r-- 1 makingdevs makingdevs 0 abr 30 16:54 algo.txt
    % ls -la
    -rw-rw-r-- 1 makingdevs makingdevs 0 abr 30 16:54 algo.txt
    -rw-rw-r-- 1 makingdevs makingdevs 0 abr 30 16:59 .oculto.txt

## El Kernel y el Shell

El **Kernel** es el componente de UNIX (y de cualquier sistema operativo) que funge como núcleo y que por lo tanto tiene las siguientes funciones:

* Administra las peticiones de entrada y salida del software y las traduce en instrucciones de procesamiento para el CPU.
* Agenda y administra los procesos internos del sistema operativo.
* Administra también los dispositivos, archivos, y la memoria.

Lo que se conoce como **Shell** es básicamente una capa de abstracción del sistema operativo que envuelve al Kernel y que permite una interacción amigable entre el usuario y el mismo Kernel mediante una interfaz de línea de comandos (CLI).

## Tipos de Shell

Dependiendo el tipo de tareas a realizar, se puede elegir entre distintos "tipos" de Shell. Cabe mencionar que entre ellos se comparte la mayoría de características, por lo que cambiar de uno a otro es sencillo.

Los tipos de Shells más conocidos son:

* **Bourne Shell (sh)** - El primer shell desarrollado e incluído en UNIX.
* **C Shell (csh)** - Shell basado en C, incluía algunas características extra, como el historial de comandos.
* **Korn Shell** - Creado para ser compatible con Bourne Shell, pero incluyendo características de C Shell.
* **Bourne again Shell** - Similar a Korn Shell, pero con características adicionales, como un comando de ayuda interno. Es el shell más popular actualmente, y es el default de la mayoría de sistemas UNIX y distribuciones Linux.
* **tcsh** - Versión extendida del C Shell, con las características de Korn Shell y Bourne again Shell.
* **Z Shell (zsh)** - Shell relativamente moderno, compatible con Bourne again Shell.

### Shell scripting

Un script Shell es simplemente un archivo de texto que contiene comandos secuenciales que pueden ser tecleados directamente en el Shell. El poder de este lenguaje de este programación consiste en su funcionamiento como eslabón para unir las utilerías de UNIX, ya sea entre sí, o con algún otro software o lenguaje de programación para crear una herramienta más potente.

### Ventajas de utilizar la programación en Shell

* Combinar secuencias de comandos largas y/o repetitivas en un simple y sencillo comando.
* Personalizar una secuencia de operaciones ejecutadas en alguna colección de datos, pudiendo ser aplicada en cualquier otra colección similar.
* Crear nuevos comandos mediante la creación de combinaciones de utilerías.
* Envolver programas o utilerías sobre los que no se tiene control en un ambiente controlado por el programador.

### Utilizaciones típicas

* Scripts de arranque del sistema.
* Automatización de tareas del administrador del sistema, por ejemplo, mantenimiento, administración de usuarios.
* Herramientas portables de instalación de paquetes de software Application package installation tools  Less detail
* Scripts de inicio de aplicaciones no críticas o desatendidas (ejemplo: el **cron**).
* Cualquier necesidad de automatizar algún proceso de instalación o ejecución de alguna aplicación comercial o propia.

### Cuando NO utilizar la programación en Shell

* Tareas que tienen una alta utilización de recursos del sistema, especialmente donde la velocidad del script es un factor (ordenamiento, recursividad).
* Procedimientos con cálculos matemáticos complejos.
* Aplicaciones muy complejas, donde sea una necesidad utilizar aspectos de la programación estructurada (verificación del tipo de variables, funciones prototipo).
* Aplicaciones propietarias de código cerrado (el script es texto abierto a todo aquel que pueda editarlo).
* Aplicaciones que requieran:
  * Soporte nativo de arreglos multi-dimensionales.
  * Algunas estructuras de datos, como las listas anidadas o árboles.
  * Generación y/o manipulación de gráficoso **GUI**s.
* Aplicaciones de misión crítica donde se basa el futuro de la compañía.

# Shell Básico

Un script shell puede ser tan sencillo como el siguiente conjunto de comandos:

    pwd
    cd ~/shell_script
    cat hola.txt

El siguiente es un script shell simple escrito de manera más propia que muestra sus elementos:

    #!/bin/bash
    
    # Shell simple
    
    variable=1

    echo "El valor de la variable es $variable"

    exit 0

Analizando línea a línea:

* **#!/bin/bash** - Línea del *Sha-Bang* (#!), o conjunto de caracteres que dicen al sistema que el archivo que los contiene es un conjunto de comandos que serán interpretados por el binario que se encuentra inmediatamente a continuación, en este caso, /bin/bash. El binario o aplicación en cuestión puede ser un shell, un lenguaje de programación o alguna otra utilería. Ejemplos de *Sha-Bang*'s:

        #!/bin/bash
        #!/bin/zsh
        #!/usr/bin/perl
        #!/usr/bin/tcl
        #!/bin/sed -f
        #!/bin/awk -f

* **# Shell simple** - Comentario. No existe un delimitador de comentarios multi-línea.
* **variable=1** - Declaración e inicialización de una variable.
* **echo "El valor de la variable es $variable"** - Línea normal de código (la sentencia *echo* sirve para desplegar contenido en salida estándar).
* **exit 0** - Salida del script.

---

### Crear script que muestre la hora y fecha, los usuarios logueados y el tiempo en el que el sistema ha estado en línea, con las leyendas correspondientes a cada salida.

---

## Variables y operadores

La asignación de variables en Shell se realiza con un signo igual (=) y sin espacios entre el nombre y el valor.

    #!/bin/bash

    a = 1 # Incorrecto

    a=1 # Correcto

Una vez asignadas, se hace referencia a las mismas con un signo de pesos ($) antecediendo el nombre de la misma variable.

    #!/bin/bash

    a=1
    echo $a

---

### Crear script que intente el casteo a partir de una variable nula y una no declarada.

---

Las variables en Shell son declaradas sin ser de algún tipo (caracter, entero, decimal...), sin embargo, *bash* permite declararlas como buena práctica de programación.

#### Variables especiales

* Variables que hacen referencia al usuario logueado en la terminal:
  * $USER o $LOGNAME
  * $UID
  * $HOME
  * $HOSTNAME
  * $PATH
  * $TERM
* Variables internas de shell:
  * $PWD
  * $? (solo lectura)
* Variables de ID de procesos:
  * $$ (solo lectura)
  * $PPID (solo lectura)
* Variables proporcionadas por *bash*:
  * $SECONDS (solo lectura)
  * $RANDOM
  * $LINENO (solo lectura)

#### Parámetros o argumentos del script

* $0
* $1 - $9
* ${10} ...
* $#
* $*

#### Operadores.

* Asignación:
  * =
* Aritméticos:
  * \+ \- \* / ** %
  * += -= *= /= %=
* Lógicos:
  * ! && ||

### Escape y referencias

El escape de caracteres se refiere a darles, ya sea su significado literal a los mismos, o bien, representar alguna otra salida, con ayuda del caracter especial de escape (la diagonal invertida, \\ ).

Un ejemplo simple y muy conocido: las comillas dobles y simples:

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

Otros escapes:

* n
* r
* t
* v
* b
* a
* $
* \\

#### Otros caracteres especiales

* .
* *
* |
* ?
* []

## Gestionando la terminación del script

La salida o terminación de un script se lleva a cabo con el comando **exit**, el cual puede o no, devolver un valor entero, en el rango de 0 a 255. Este valor es disponible inmediatamente para el proceso padre que ejecuta el script, y puede considerarse como un *código de salida (o error) personalizado*.

Archivo **00\_codigo\_salida.sh**

    #!/bin/bash

    # En este caso, el proceso padre que lo ejecuta, es la misma terminal

    exit 18

Al ejecutar en la terminal el siguiente comando, se obtiene:

    % ./00_codigo_salida.sh
    % echo $?
    18

Es importante tener en cuena que **cada uno** de los comandos que se ejecutan en la terminal y **cada una** de las líneas de un shell devuelven un estatus de salida, siendo el cero (0) correcto, o *sin error*. Tratándose de un valor diferente a cero, se considera como un error.

Los valores de salida devueltos por **exit** que tienen un significado especial y no deben de utilizarse son:

* 1 - Errores en general.
* 2 - Hace falta una parte o un terminador de comando.
* 126 - No se puede ejecutar el comando.
* 127 - Comando no encontrado.
* 128 - Argumento inválido para **exit**.
* 128 + *n* - Error fatal.
* 130 - Script terminado por *Control+C*.
* 255 - Estatus de **exit** fuera de rango.

Si un script concluye con un **exit** sin ningún parámetro, el estatus de salida es el del último comando ejecutado antes del mismo (**exit**).

Como buena práctica, es recomendable el finalizar todo script con **exit 0**.

## Ciclos y estructuras de control

### if-then-else

El **if** del shell scripting verifica que el estatus de salida de la condición (o condiciones) a evaluar sea cero, de tal modo que ejecute los comandos indicados. En caso contrario, se ejecuta el bloque del **else**, o del **elif** si es el caso.

Sintaxis:

    if -CONDICIÓN-
    then
        COMANDOS
        ...
    else
        COMANDOS
        ...
    fi

La condición puede expresarse utilizando los siguientes caracteres:

* test
* []
* (())

#### Operadores de validación de archivos

* -e
* -f
* -s
* -d
* -h
* -r
* -w
* -x
* -O
* -G
* -nt
* -ot
* !

#### Operadores de comparación lógica

* -a
* -o
