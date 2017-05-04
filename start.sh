#!/bin/bash

source config

ncat -k -vc ./ex.sh -l ${client_port}

#while [ 1 -eq 1 ]
#do
    #sleep ${check_time}
    #sudo ntpdate pool.ntp.org
#done
