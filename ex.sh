#!/bin/sh

info=info
server_ip='140.113.69.46'
server_port=1234
wait_time=2

date +%H:%M:%S > ${info}
ifconfig | grep -v 127 | grep 'inet addr' | awk '{print $2}' | sed 's/addr:/from: /g' >> ${info}
echo "" >> ${info}
sleep ${wait_time}
nc 140.113.69.46 1234 < ${info}
