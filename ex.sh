#!/bin/bash

source config
#info=info
#server_ip='192.168.1.163'
#server_port=1234
#wait_time=2

date +%H:%M:%S > ${info}
ifconfig | grep -v 127 | grep 'inet addr' | awk '{print $2}' | sed 's/addr:/from: /g' >> ${info}
echo "" >> ${info}
sleep ${wait_time}
nc -v ${server_ip} ${server_port} < ${info} &
kill $(ps -a | grep 'nc -v' | awk '{print $1}')
