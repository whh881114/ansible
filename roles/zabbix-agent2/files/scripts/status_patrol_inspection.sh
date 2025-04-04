#!/bin/bash

DISK_FILE=/tmp/zabbix_host_disk_util.txt
MEMORY_FILE=/tmp/zabbix_host_memory_util.txt


function disk_utilization_rank() {
    min=`echo $1 | awk -F '-' '{print $1}' | tr -d '%'`
    max=`echo $1 | awk -F '-' '{print $2}' | tr -d '%'`
    awk -v "min=$min" -v "max=$max" '{if($(NF-1)>min && $(NF-1)<=max) print}' $DISK_FILE | sort -k 3
}

function disk_utilization_rank_count() {
    min=`echo $1 | awk -F '-' '{print $1}' | tr -d '%'`
    max=`echo $1 | awk -F '-' '{print $2}' | tr -d '%'`
    awk -v "min=$min" -v "max=$max" '{if($(NF-1)>min && $(NF-1)<=max) print}' $DISK_FILE | wc -l
}

function disk_overall() {
    awk -v "count=0" -v "min=0"  -v "max=10" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】磁盘使用率分布在0%与10%之间的数量为"count"。\n"}' $DISK_FILE
    awk -v "count=0" -v "min=10" -v "max=20" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】磁盘使用率分布在10%与20%之间的数量为"count"。\n"}' $DISK_FILE
    awk -v "count=0" -v "min=20" -v "max=30" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】磁盘使用率分布在20%与30%之间的数量为"count"。\n"}' $DISK_FILE
    awk -v "count=0" -v "min=30" -v "max=40" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】磁盘使用率分布在30%与40%之间的数量为"count"。\n"}' $DISK_FILE
    awk -v "count=0" -v "min=40" -v "max=50" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】磁盘使用率分布在40%与50%之间的数量为"count"。\n"}' $DISK_FILE
    awk -v "count=0" -v "min=50" -v "max=60" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】磁盘使用率分布在50%与60%之间的数量为"count"。\n"}' $DISK_FILE
    awk -v "count=0" -v "min=60" -v "max=70" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】磁盘使用率分布在60%与70%之间的数量为"count"。\n"}' $DISK_FILE
    awk -v "count=0" -v "min=70" -v "max=80" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】磁盘使用率分布在70%与80%之间的数量为"count"。\n"}' $DISK_FILE
    awk -v "count=0" -v "min=80" -v "max=90" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】磁盘使用率分布在80%与90%之间的数量为"count"。\n"}' $DISK_FILE
    awk -v "count=0" -v "min=90" -v "max=100" '{if($(NF-1)>min && $(NF-1)<=max) count++} END {print "【巡检报告】磁盘使用率分布在90%与100%之间的数量为"count"。\n"}' $DISK_FILE
}

function memory_utilization_rank() {
    min=`echo $1 | awk -F '-' '{print $1}' | tr -d '%'`
    max=`echo $1 | awk -F '-' '{print $2}' | tr -d '%'`
    awk -v "min=$min" -v "max=$max" '{if($(NF-1)>min && $(NF-1)<=max) print}' $MEMORY_FILE | sort -k 3
}

function memory_utilization_rank_count() {
    min=`echo $1 | awk -F '-' '{print $1}' | tr -d '%'`
    max=`echo $1 | awk -F '-' '{print $2}' | tr -d '%'`
    awk -v "min=$min" -v "max=$max" '{if($(NF-1)>min && $(NF-1)<=max) print}' $MEMORY_FILE | wc -l
}

function memory_overall() {
    awk -v "count=0" -v "min=0"  -v "max=10" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】内存使用率分布在0%与10%之间的数量为"count"。\n"}' $MEMORY_FILE
    awk -v "count=0" -v "min=10" -v "max=20" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】内存使用率分布在10%与20%之间的数量为"count"。\n"}' $MEMORY_FILE
    awk -v "count=0" -v "min=20" -v "max=30" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】内存使用率分布在20%与30%之间的数量为"count"。\n"}' $MEMORY_FILE
    awk -v "count=0" -v "min=30" -v "max=40" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】内存使用率分布在30%与40%之间的数量为"count"。\n"}' $MEMORY_FILE
    awk -v "count=0" -v "min=40" -v "max=50" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】内存使用率分布在40%与50%之间的数量为"count"。\n"}' $MEMORY_FILE
    awk -v "count=0" -v "min=50" -v "max=60" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】内存使用率分布在50%与60%之间的数量为"count"。\n"}' $MEMORY_FILE
    awk -v "count=0" -v "min=60" -v "max=70" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】内存使用率分布在60%与70%之间的数量为"count"。\n"}' $MEMORY_FILE
    awk -v "count=0" -v "min=70" -v "max=80" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】内存使用率分布在70%与80%之间的数量为"count"。\n"}' $MEMORY_FILE
    awk -v "count=0" -v "min=80" -v "max=90" '{if($(NF-1)>min && $(NF-1)<=max)  count++} END {print "【巡检报告】内存使用率分布在80%与90%之间的数量为"count"。\n"}' $MEMORY_FILE
    awk -v "count=0" -v "min=90" -v "max=100" '{if($(NF-1)>min && $(NF-1)<=max) count++} END {print "【巡检报告】内存使用率分布在90%与100%之间的数量为"count"。\n"}' $MEMORY_FILE
}


if [ $# -eq 1 ]; then
  $1
elif [ $# -eq 2 ]; then
  $1 $2
else
  echo "Unsupport argument provided."
  exit 255
fi