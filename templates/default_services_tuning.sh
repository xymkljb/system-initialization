#!/bin/bash
chkconfig --list | grep '3:on' | awk '{print $1}' | grep -Ev 'sshd|rsyslog|network|crond|ntpd|ntpdate' > /tmp/ansible/services.log
for service_name in `cat /tmp/ansible/services.log`
do
chkconfig $service_name off;
done
