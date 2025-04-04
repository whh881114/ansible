consul {
{# 官方推荐使用本地接口。#}
{# address = "{{ consul_servers | first }}:{{ consul_port }}" ，这个是原来的方法。#}
    address = "{{ consul_addr }}:8500"
    retry {
        enabled = true
        attempts = 12
        backoff = "250ms"
        max_backoff = "1m"
    }
}

wait {
    min = "30s"
    max = "120s"
}
