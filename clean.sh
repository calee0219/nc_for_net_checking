#!/bin/bash

kill $(ps -a | grep nc | awk '{print $1}')
kill $(netstat -tulpn | awk '{print $7}' | sed 's/\/nc//')
