#!/bin/sh

client_ip_list="192.168.1.102"
time_file=get_time.txt
server_port=1234
client_port=8888
due_time=10

#nc -lk -p ${server_port} >> ${time_file} &

while [ 1 -eq 1 ]
do
    echo "" > ${time_file}
    for i in ${client_ip_list}; do
        nc -v ${i} ${client_file} &
    done
    sleep ${due_time}
done
