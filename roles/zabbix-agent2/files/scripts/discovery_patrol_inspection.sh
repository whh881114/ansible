#!/bin/bash

# Define the starting and ending utilization percentages
start_percent=0
end_percent=100

echo '{"data": ['
# Iterate over the utilization ranges in increments of 10%
while [ $start_percent -lt $end_percent ]
do
    if [ $start_percent -eq 90 ]; then
      echo '    {"{#UTILIZATION_RANK}": "'$start_percent'%-'$((start_percent + 10))'%"}'
    else
      echo '    {"{#UTILIZATION_RANK}": "'$start_percent'%-'$((start_percent + 10))'%"},'
    fi
    start_percent=$((start_percent + 10))
done
echo '  ]'
echo '}'
