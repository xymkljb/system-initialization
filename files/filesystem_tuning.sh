#!/bin/bash
df -h | grep -Ev 'Filesystem|/boot|tmpfs' | grep /dev | awk '{print $1}' > /tmp/ansible/filesystem_tuning.log
for filesystem in `cat /tmp/ansible/filesystem_tuning.log`
do
tune2fs -m 1 $filesystem;
done
