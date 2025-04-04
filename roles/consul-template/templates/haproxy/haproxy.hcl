template {
    source = "[[ root_dir ]]/01-k8s-apiserver.ctmpl"
    destination = "/etc/haproxy/conf.d/01-k8s-apiserver.cfg"
    command = "/usr/bin/systemctl reload haproxy"
    command_timeout = "60s"
    perms = 0644
    left_delimiter  = "{{"
    right_delimiter = "}}"
    wait {
        min = "30s"
        max = "120s"
    }
}

template {
    source = "[[ root_dir ]]/04-k8s-ingress-nginx-wan.ctmpl"
    destination = "/etc/haproxy/conf.d/04-k8s-ingress-nginx-wan.cfg"
    command = "/usr/bin/systemctl reload haproxy"
    command_timeout = "60s"
    perms = 0644
    left_delimiter  = "{{"
    right_delimiter = "}}"
    wait {
        min = "30s"
        max = "120s"
    }
}

template {
    source = "[[ root_dir ]]/05-k8s-ingress-nginx-lan.ctmpl"
    destination = "/etc/haproxy/conf.d/05-k8s-ingress-nginx-lan.cfg"
    command = "/usr/bin/systemctl reload haproxy"
    command_timeout = "60s"
    perms = 0644
    left_delimiter  = "{{"
    right_delimiter = "}}"
    wait {
        min = "30s"
        max = "120s"
    }
}

template {
    source = "[[ root_dir ]]/06-k8s-istio-gateway-wan.ctmpl"
    destination = "/etc/haproxy/conf.d/06-k8s-istio-gateway-wan.cfg"
    command = "/usr/bin/systemctl reload haproxy"
    command_timeout = "60s"
    perms = 0644
    left_delimiter  = "{{"
    right_delimiter = "}}"
    wait {
        min = "30s"
        max = "120s"
    }
}

template {
    source = "[[ root_dir ]]/07-k8s-istio-gateway-lan.ctmpl"
    destination = "/etc/haproxy/conf.d/07-k8s-istio-gateway-lan.cfg"
    command = "/usr/bin/systemctl reload haproxy"
    command_timeout = "60s"
    perms = 0644
    left_delimiter  = "{{"
    right_delimiter = "}}"
    wait {
        min = "30s"
        max = "120s"
    }
}