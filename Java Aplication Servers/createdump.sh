#!/bin/bash
/bin/sudo -u USERWAS /opt/jdk1.8.0_131/bin/jstack -J-d64 /bin/ps -fu USERWAS|grep java|awk '{print $2}' > /opt/backup//bin/hostname`_jstack_dump_`date '+%Y%m%d_%H%M'.log
/bin/sudo -u USERWAS /opt/jdk1.8.0_131/bin/jmap -J-d64 /bin/ps -fu USERWAS|grep java|awk '{print $2}' > /opt/backup//bin/hostname`_jmap_dump_`date '+%Y%m%d_%H%M'.log
/bin/sudo -u USERWAS /opt/jdk1.8.0_131/bin/jmap -J-d64 -dump:format=b,file=/opt/backup//bin/hostname`_head_dump_`date '+%Y%m%d_%H%M'.dump /bin/ps -fu USERWAS|grep java|awk '{print $2}'