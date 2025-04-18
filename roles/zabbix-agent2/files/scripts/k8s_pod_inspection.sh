#!/bin/bash

export KUBECONFIG=~/.kube/$1
result_file="/tmp/result-k8s-pod-inspection-$1"

# 检查 jq 是否存在
if ! command -v jq &>/dev/null; then
  echo "请安装 jq 工具后再运行此脚本"
  exit 1
fi

# m 单位换算函数（CPU）
convert_cpu() {
  val=$1
  if [[ "$val" == *m ]]; then
    printf "%.3f" "$(echo "scale=3; ${val%m} / 1000" | bc)"
  else
    printf "%.3f" "$val"
  fi
}

# 输出表头
echo "ContainerName RequestsCPU RequestsMemory LimitsCPU LimitsMemory" > $result_file

# 遍历 namespace
for ns in $(kubectl get ns --no-headers -o custom-columns=:metadata.name); do
  kubectl get pods -n "$ns" -o json | jq -r --arg ns "$ns" '
    .items[] |
    .metadata.name as $pod |
    .spec.containers[]? |
    {
      container: .name,
      requests_cpu: (.resources.requests.cpu // "0"),
      requests_memory: (.resources.requests.memory // "0"),
      limits_cpu: (.resources.limits.cpu // "0"),
      limits_memory: (.resources.limits.memory // "0"),
      fullname: "\($ns)/\($pod)/\(.name)"
    } |
    "\(.fullname)|\(.requests_cpu)|\(.requests_memory)|\(.limits_cpu)|\(.limits_memory)"
  ' | while IFS='|' read -r name rcpu rmem lcpu lmem; do
    echo "$name $(convert_cpu "$rcpu") $rmem $(convert_cpu "$lcpu") $lmem"
  done
done >> $result_file


cp -f "$result_file" "${result_file}_$(date +%F_%H:%M:%S)"