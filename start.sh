#!/bin/sh

source config
#client_port=8888
#check_time=60

ncat -k -vc ./ex.sh -l ${client_port} &

while [ 1 -eq 1 ]
do
    sleep ${check_time}
    sudo ntpdate pool.ntp.org
done
