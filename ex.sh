#!/bin/bash

source config

DATE=$(date +%H:%M:%S)
IP=$(ifconfig | grep -v 127 | grep 'inet ' | awk '{print $2}' | sed 's/addr:/from: /g')
echo "${DATE} ---- ${IP}" > ${info}
sleep ${wait_time}
nc -v ${server_ip} ${server_port} < ${info} &
kill $(ps -a | grep 'nc -v' | awk '{print $1}')
