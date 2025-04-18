#!/bin/bash

export KUBECONFIG=~/.kube/$1

result_file="/tmp/result-k8s-node-inspection-$1"
echo 'POOL IP CPU水位线(requests/limits) 内存水位线(requests/limits)  CPU数量 负载 内存总量 内存使用量 内存空闲量 内存活动量 内存非活动量 内存缓冲量 交换空间总量 交换空间使用量 交换空间空闲量 交换空间缓存量' > "$result_file"

for node in $(kubectl get nodes | grep -v '^NAME' | awk '{print $1}')
do
  echo -n $(kubectl get node $node -o json | jq -r '.metadata.labels["pool"] // "N/A"') >> "$result_file"
  echo -n " " >> "$result_file"

  echo -n "$node " >> "$result_file"

  echo -n $(kubectl describe node $node | grep -E '^  cpu' | grep -v ':' | sed 's/^[[:space:]]*//' | awk '{if (NF == 0) print "N/A"; else print $2$3"/"$4$5}') >> "$result_file"
  echo -n " " >> "$result_file"

  echo -n $(kubectl describe node $node | grep -E '^  memory' | grep -v ':' | sed 's/^[[:space:]]*//' | awk '{if (NF == 0) print "N/A"; else print $2$3"/"$4$5}') >> "$result_file"
  echo -n " " >> "$result_file"

  echo -n $(ssh -o StrictHostKeyChecking=no root@$node 'getconf _NPROCESSORS_ONLN') >> "$result_file"
  echo -n " " >> "$result_file"

  echo -n $(ssh -o StrictHostKeyChecking=no root@$node 'uptime' | awk '{print $(NF-2)" "$(NF-1)" "$(NF)}' | tr -d ',' | tr ' ' '/') >> "$result_file"
  echo -n " " >> "$result_file"

  echo $(ssh -o StrictHostKeyChecking=no root@$node 'vmstat -s' | awk '
                                                                        function human_readable(size) {
                                                                            if (size >= 1024^2) return sprintf("%.2fGB", size / (1024^2));
                                                                            else if (size >= 1024^1) return sprintf("%.2fMB", size / (1024^1));
                                                                            else return sprintf("%dKB", size);
                                                                        }

                                                                        NR==1 {printf "%s ", human_readable($1)}
                                                                        NR==2 {printf "%s ", human_readable($1)}
                                                                        NR==5 {printf "%s ", human_readable($1)}
                                                                        NR==3 {printf "%s ", human_readable($1)}
                                                                        NR==4 {printf "%s ", human_readable($1)}
                                                                        NR==6 {printf "%s ", human_readable($1)}

                                                                        NR==8 {printf "%s ", human_readable($1)}
                                                                        NR==9 {printf "%s ", human_readable($1)}
                                                                        NR==10 {printf "%s ", human_readable($1)}
                                                                        NR==7 {printf "%s ", human_readable($1)}
                                                                        ') >> "$result_file"
done


cp -f "$result_file" "${result_file}_$(date +%F_%H:%M:%S)"