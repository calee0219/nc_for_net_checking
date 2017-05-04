#!/bin/sh

time_file=get_time.txt
reflash_time=2

while [ 1 -eq 1 ]
do
    cat ${time_file}
    sleep ${reflash_time}
    clear
done
