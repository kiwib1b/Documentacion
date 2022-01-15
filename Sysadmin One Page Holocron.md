# Documentacion
# Linux
<a href="https://github.com/kiwib1b/Documentacion/blob/main/Sysadmin%20One%20Page%20Holocron.md#gzip"><img src="https://img.shields.io/badge/Linux-GZIP-blue?style=for-the-badge"></a>
<a href="https://github.com/kiwib1b/Documentacion/blob/main/Sysadmin%20One%20Page%20Holocron.md#tar"><img src="https://img.shields.io/badge/Linux-TAR-blue?style=for-the-badge"></a>
# TAR 

## Archivos .tar.gz
Comprimir: 

    tar -czvf empaquetado.tar.gz /carpeta/a/empaquetar/

Descomprimir: `tar -zxvf archivo.tar.gz --directory /ruta_del_archivo/carpeta`

## Archivos .tar
Empaquetar: `tar -cvf paquete.tar /dir/a/comprimir/`

Desempaquetar: `tar -xvf paquete.tar`


# GZIP
## Archivos .gz
Comprimir: `gzip -9 index.php`

Descomprimir: `gzip -d index.php.gz`

## Archivos .zip
Comprimir: `zip archivo.zip carpeta`

Descomprimir: `unzip archivo.zip`

Listar: `unzip -l archivo.zip`
