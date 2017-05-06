#!/bin/bash

source config

#DATE=$(date +%H:%M:%S)
DATE=$(date --rfc-3339=ns)
IP=$(ifconfig | grep -v 127 | grep 'inet ' | awk '{print $2}' | sed 's/addr://g')
echo "${DATE} ---- ${IP}" > ${info}
sleep ${wait_time}
nc -v ${server_ip} ${server_port} < ${info} &
kill $(ps -a | grep 'nc -v' | awk '{print $1}')
