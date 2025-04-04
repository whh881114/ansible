#!/bin/bash

https_site=$1

host=${https_site/:*}
port=${https_site#*:}

# debug
# echo $https_site
# echo host=$host
# echo port=$port
# /data/bin/sslooker $host $port

echo "scale=3; `/data/bin/sslooker $host $port`/24" | bc