#!/bin/bash
# Este es un Script para hacer un dump de la memoria de la Java Virtual Machine a un fichero para su posterior analisis.
# Debe ejecutarto el usuarios que esta ejecuntando el Java y usar un JDK sirve el mismo que este usando el JVM.
/bin/sudo -u USERWAS /opt/jdk1.8.0_131/bin/jstack -J-d64 /bin/ps -fu USERWAS|grep java|awk '{print $2}' > /opt/backup//bin/hostname`_jstack_dump_`date '+%Y%m%d_%H%M'.log
/bin/sudo -u USERWAS /opt/jdk1.8.0_131/bin/jmap -J-d64 /bin/ps -fu USERWAS|grep java|awk '{print $2}' > /opt/backup//bin/hostname`_jmap_dump_`date '+%Y%m%d_%H%M'.log
/bin/sudo -u USERWAS /opt/jdk1.8.0_131/bin/jmap -J-d64 -dump:format=b,file=/opt/backup//bin/hostname`_head_dump_`date '+%Y%m%d_%H%M'.dump /bin/ps -fu USERWAS|grep java|awk '{print $2}'