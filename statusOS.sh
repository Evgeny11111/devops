#!/bin/bash

# our script

echo "timestamp;all_memory;free_memory;%usaged" > test.csv
while true
do
  tamestamp=$(date +"%T")
  all_memory=$(free -h -t | awk 'NR==4{print $2}')
  used_memory=$(free -h -t | awk 'NR==4{print $3}')
  free_memory=$(free -h -t | awk 'NR==4{print $4}')
  
  echo "$tamestamp;$all_memory;$free_memory;$(used_memory * 100 / all_memory)" >> test.csv
  sleep 10m
done