#!/bin/bash

source config
#info=info
#server_ip='192.168.1.163'
#server_port=1234
#wait_time=2

DATE=$(date +%H:%M:%S)
IP=$(ifconfig | grep -v 127 | grep 'inet ' | awk '{print $2}' | sed 's/addr://g')
echo "${DATE} ---- ${IP}" > ${info}
sleep ${wait_time}
nc -v ${server_ip} ${server_port} < ${info} &
kill $(ps -a | grep 'nc -v' | awk '{print $1}')
