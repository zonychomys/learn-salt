vm.swappiness:
  sysctl.present:
    - value: 0
net.ipv4.ip_local_port_range:
  sysctl.present:
    - value: 1024 65535
