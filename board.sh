#!/bin/bash

source config

while [ 1 -eq 1 ]
do
    cat ${time_file}
    sleep ${reflash_time}
    clear
done
