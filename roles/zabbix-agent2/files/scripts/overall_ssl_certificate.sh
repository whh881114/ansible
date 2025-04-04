#!/bin/bash


cd /etc/zabbix/scripts

while read https_site
do
    host=${https_site/:*}
    port=${https_site#*:}
    printf "https://%-50s  -- HTTPS证书生命周期 -- " "$https_site"
    echo "scale=3; `/data/bin/sslooker $host $port`/24" | bc
done < https_sites.txt