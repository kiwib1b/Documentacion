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


## CHATTR

Bloquear un fichero o ruta para que no se puedan encribir en ellos.

chattr +i /etc/passwd

Desbloquear un fichero o ruta para que no se puedan encribir en ellos.

chattr -i /etc/passwd

Se recomienda usarlo para bloquear la ruta donde montas un NFS para que en caso de que no este montado no escriba nada en local.


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


##EOF

Podemos escribir en un fichero usando un comando

cat <<_EOF > /etc/sudoers.d/USER
USER ALL=(ALL) NOPASSWD: ALL
_EOF
exit

## FOR

Bucle para hacer relacion de confianza 

    for x in HOST1 HOST2; do echo -e "==========$x=========="; "ssh-copy-id -i /root/.ssh/id_rsa.pub" $x ; done

Bucle para sacar un ipyime de un listado de maquinas que estan en un fichero

    for x in $(cat fichero.txt); do echo -e "==========$x=========="; ssh $x "uptime" ; done

## UDEV

Archivo UDEV con la configuracion de las tarjetas de red de una maquina. Si tras un vMotion de una VM vemos que las IPs no cuadran con las MACs, vaciar el fichjero y reiniciar la VM. 

    /etc/udev/rules.d/70-persistent-net.rules

## NTP

Archivos de configuracion del servicio NTP

    cat /etc/ntp.conf

Activar / Desactivar  sincronizacion de hora vmware.

    vmware-toolbox-cmd timesync enable
    vmware-toolbox-cmd timesync disable
    vmware-toolbox-cmd timesync status

######## LDAP ########

El proceso que gestiona el LDAP en linux es sssd

Lo primero a compobar que el servicio este levantado

Para comprobar si un usuario tiene acceso 

    id usuario en la maquina 
    
Si tiene acceso a la maquina debe poder mostrarnos los datos del usuario

## PACEMAKER

<h3>File and Directory Locations</h3>
<table>
<thead>
<tr>
<th align="left">Location</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td align="left">/var/lib/pacemaker/cib/cib.xml</td>
<td align="left">Primary cluster configuration file</td>
</tr>
<tr>
<td align="left">/var/log/cluster/corosync.log</td>
<td align="left">Primary cluster log file</td>
</tr>
<tr>
<td align="left">/usr/lib/ocf/resource.d/heartbeat/</td>
<td align="left">Directory where resource scripts are located</td>
</tr>
</tbody>
</table>
<h3>Check Cluster Status</h3>
<table>
<thead>
<tr>
<th align="left">Command</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td align="left">pcs cluster status</td>
<td align="left">Display status of cluster nodes</td>
</tr>
<tr>
<td align="left">pcs status &#8211;full (double dashes)</td>
<td align="left">Display detailed cluster status of nodes and resources</td>
</tr>
<tr>
<td align="left">pcs resource</td>
<td align="left">Display status of all resources and resource groups</td>
</tr>
</tbody>
</table>
<h3>Modify Cluster Nodes</h3>
<table>
<thead>
<tr>
<th align="left">Command</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td align="left">pcs cluster standby</td>
<td align="left">Place node in standby mode</td>
</tr>
<tr>
<td align="left">pcs cluster unstandby</td>
<td align="left">Remove node from standby mode</td>
</tr>
</tbody>
</table>
<h3>Managing Running Resources</h3>
<table>
<thead>
<tr>
<th align="left">Command</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td align="left">pcs resource move [resource_name] node name</td>
<td align="left">Move resource to another node</td>
</tr>
<tr>
<td align="left">pcs resource restart [resource_name]</td>
<td align="left">Restart resource on current node</td>
</tr>
<tr>
<td align="left">pcs resource enable [resource_name]</td>
<td align="left">Start resource on current node</td>
</tr>
<tr>
<td align="left">pcs resource disable [resource_name]</td>
<td align="left">Stop resource on current node</td>
</tr>
</tbody>
</table>
<h3>Debugging Resources</h3>
<table>
<thead>
<tr>
<th align="left">Command</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td align="left">pcs resource debug-start [source_name]</td>
<td align="left">Force resource to start on node where command is executed showing debug information. Use <code>--full</code> for even more verbose output.</td>
</tr>
<tr>
<td align="left">pcs resource debug-stop [source_name]</td>
<td align="left">Force resource to stop on node where command is executed showing debug information. Use <code>--full</code> for even more verbose output.</td>
</tr>
<tr>
<td align="left">pcs resource debug-monitor [source_name]</td>
<td align="left">Force resource to be monitored on node where command is executed showing debug information. Use <code>--full</code> for even more verbose output.</td>
</tr>
</tbody>
</table>
<h3>Creating and Modifying Resources</h3>
<table>
<thead>
<tr>
<th align="left">Command</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td align="left">pcs resource agents</td>
<td align="left">List available resource agents</td>
</tr>
<tr>
<td align="left">pcs resource describe [resource]</td>
<td align="left">List configuration setting for resource</td>
</tr>
<tr>
<td align="left">pcs resource create [resource id][resource] options&#8230;</td>
<td align="left">Create resource</td>
</tr>
<tr>
<td align="left">pcs resource show [resource id]</td>
<td align="left">Display currently configured setting of resource</td>
</tr>
<tr>
<td align="left">pcs resource update [resource id] options&#8230;.</td>
<td align="left">Update resource configuration</td>
</tr>
<tr>
<td align="left">pcs resource delete [resource id]</td>
<td align="left">Delete resource</td>
</tr>
<tr>
<td align="left">pcs resource cleanup [resource id]</td>
<td align="left">Cleanup resource failures</td>
</tr>
</tbody>
</table>
<h2>Creating and Modifying Stonith Resources</h2>
<table>
<thead>
<tr>
<th align="left">Command</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td align="left">pcs stonith list</td>
<td align="left">List available fence agents</td>
</tr>
<tr>
<td align="left">pcs stonith describe [fence agent]</td>
<td align="left">List configuration settings for fence agent</td>
</tr>
<tr>
<td align="left">pcs stonith describe [stonith_id]</td>
<td align="left">List configuration setting for stonith agent</td>
</tr>
<tr>
<td align="left">pcs stonith create [stonith_id][resource] options&#8230;</td>
<td align="left">Create stonith agent</td>
</tr>
<tr>
<td align="left">pcs stonith show [stonith_id]</td>
<td align="left">Display currently configured setting of stonith agent</td>
</tr>
<tr>
<td align="left">pcs stonith update [stonith_id] options&#8230;.</td>
<td align="left">Update stonith configuration</td>
</tr>
<tr>
<td align="left">pcs stonith delete [stonith_id]</td>
<td align="left">Delete stonith agent</td>
</tr>
<tr>
<td align="left">pcs stonith cleanup [stonith_id]</td>
<td align="left">Cleanup stonith agent failures</td>
</tr>
</tbody>
</table>
<a href="https://redhatlinux.guru/2018/05/22/pacemaker-cheat-sheet/" target="_blank>Source</a>
<a href="https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/configuring_the_red_hat_high_availability_add-on_with_pacemaker/s1-clusterstat-haar" target="_blank>RHEL</a>

##LVM

Listar toda la informacion de los dispositivos de bloque disponibles

    lsblk

### LVM Directories
/etc/lvm                - default lvm directory location
/etc/lvm/backup         - where the automatic backups go
/etc/lvm/cache          - persistent filter cache
/etc/lvm/archive        - where automatic archives go after a volume group change
/var/lock/lvm           - lock files to prevent metadata corruption

### LVM Files
/etc/lvm/lvm.conf       - main lvm configuration file
$HOME/.lvm               - lvm history 


lvrename para cambiar el nombre de un volumen

	lvrename /dev/mapper/vg00-lv_sapmnt_BSA /dev/mapper/vg00-lv_sapmnt_XXX
