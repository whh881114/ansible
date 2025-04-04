#!/bin/bash

https_site_file=$1

https_sites=(`cat $https_site_file`)
length=${#https_sites[@]}

printf "{\n"
printf  '\t'"\"data\":["
for ((i=0;i<$length;i++))
do
    printf '\n\t\t{'
    printf "\"{#HTTPS_SITE}\":\"${https_sites[$i]}\"}"
    if [ $i -lt $[$length-1] ];then
            printf ','
    fi
done
printf  "\n\t]\n"
printf "}\n"