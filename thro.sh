#!/bin/bash

source config

#nc -lk -p ${server_port} >> ${time_file} &

while [ 1 -eq 1 ]
do
    #> ${time_file}
    echo "" | nc -v localhost ${server_port}
    for i in ${client_ip_list}; do
        echo "sent msg to ${i}"
        nc -v ${i} ${client_port} &
    done
    sleep ${due_time}
done
