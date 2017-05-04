#!/bin/sh

kill (ps -a | grep nc | awk '{print $1}')
