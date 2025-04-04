template {
    source = "[[ root_dir ]]/ansible.ctmpl"
    destination = "/etc/ansible/hosts"
    command = "echo 'refesh ansible hosts done'"
    command_timeout = "60s"
    perms = 0644
    backup = true
    left_delimiter  = "{{"
    right_delimiter = "}}"
    wait {
        min = "30s"
        max = "120s"
    }
}