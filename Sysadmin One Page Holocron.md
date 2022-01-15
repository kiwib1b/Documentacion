# Documentacion
# Linux
<a href="https://github.com/kiwib1b/Documentacion/blob/main/Sysadmin%20One%20Page%20Holocron.md#gzip"><img src="https://img.shields.io/badge/Linux-GZIP-blue?style=for-the-badge"></a>
<a href="https://github.com/kiwib1b/Documentacion/blob/main/Sysadmin%20One%20Page%20Holocron.md#tar"><img src="https://img.shields.io/badge/Linux-TAR-blue?style=for-the-badge"></a>
<a href="https://github.com/kiwib1b/Documentacion/blob/main/Sysadmin%20One%20Page%20Holocron.md#scp"><img src="https://img.shields.io/badge/Linux-SCP-blue?style=for-the-badge"></a>
<a href="https://github.com/kiwib1b/Documentacion/blob/main/Sysadmin%20One%20Page%20Holocron.md#ls"><img src="https://img.shields.io/badge/Linux-LS-blue?style=for-the-badge"></a>
<a href="https://github.com/kiwib1b/Documentacion/blob/main/Sysadmin%20One%20Page%20Holocron.md#grep"><img src="https://img.shields.io/badge/Linux-GREP-blue?style=for-the-badge"></a>

## TAR 

### .tar.gz
Comprimir

    tar -czvf empaquetado.tar.gz /carpeta/a/empaquetar/

Descomprimir

    tar -zxvf archivo.tar.gz --directory /ruta_del_archivo/carpeta

### .tar
Empaquetar 

    tar -cvf paquete.tar /dir/a/comprimir/

Desempaquetar 

    tar -xvf paquete.tar


## GZIP
### .gz
Comprimir 

    gzip -9 index.php

Descomprimir 

    gzip -d index.php.gz

### .zip
Comprimir 

    zip archivo.zip carpeta

Descomprimir 

    unzip archivo.zip

Listar 

    unzip -l archivo.zip


## SCP

    scp tomcat.properties root@HOST:/PATH
    scp /PATH/tomcat.properties root@HOST:/PATH

SCP con clave publica

    scp -i /PATH/private.rsa /PATH/tomcat.properties root@HOST:/PATH

SCP Inverso

    scp root@HOST:/PATH/jdk-8u221-linux-x64.tar.gz /PATH

## LS

Ver tamaño de los ficheros en megas

    ls -lh 

Ver datos de la carpeta donde estas posicionado

    ls -ld 

Crear link simbolico

    ln -s target linkname

Eliminar link Simbolico

    rm linkname


## DU

    du -sh

Muestra tambien las carpetas ocultas

    du -sh .[A-z0-9]* *|sort -n


## GREP

Muestra las tres líneas posteriores a lo que busques

grep -A 3 "EXT3-fs: mounted" /var/log/dmesg.0  

Muestra las tres líneas anteriores a lo que busques

grep -B 3 "EXT3-fs: mounted" /var/log/dmesg.0  ----> 

## TAC

Empieza a leer el fichero por el final

    tac test.txt

## FIND

Buscar ficheros colgando de / que se llamen index.php  

    find / -name index.php

Buscar ficheros desde la ruta dodne estes que se han modificado en los ultimos minutos 120 minutos

    find . -type f -mmin -120 -print0 | xargs -0 /bin/ls -ltr

## TOUCH

Crear o cambiar un fichero con una fecha concreta 

    touch -t 201208300925 test.txt


## VOLCADOS

Volcar contenido del fichero de origen sobre el fichero destino

    cat archivo_origen >> archivo_destino 

Volcar contenido de un fichero a otro y comprimirel destino.

    gzip -9c origen > destino 	

Vaciar fichero

    > test.txt                       


## RSYNC

    rsync -avz origen destino 

## WATCH

Ejecuta un comando una vez cada N segundos y muestra la salida por pantalla.

    watch -n 1 COMANDO

## AT

Sirve para programar una tarea que se ejecute una unica vez.

    at HH:MMam MES DD 
    comando
    control+D

Ver los Jobs programados

    atq

Borrar un Job (N es el numero del Job que podemos sacar con atq )

    atrm N

Example

    # at HH:MMam MES DD
    # at 08:00am Mar 16
    at> /root/scripts//script.sh
    at> CRTL+D
    job 48 at 2020-03-16 08:00


## CRONTAB

Aqui estan los crontab de todos los usuarios

    /var/spool/cron 

## LOGROTATE 

    /etc/Tomcat6/apache-tomcat-6.0.35/logs/*.log {
        notifempty
        copytruncate
        daily
        rotate 10
        compress
        missingok
    }

    /etc/Tomcat6/apache-tomcat-6.0.35/logs/catalina.out {
        notifempty
        copytruncate
        dateext
        daily
        rotate 10
        compress
        missingok
    }