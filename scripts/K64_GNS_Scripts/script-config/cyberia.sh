#!/bin/sh
ip addr replace 192.243.16.57/30 dev eth1
ip addr replace 192.243.14.1/25 dev eth2
sysctl -w net.ipv4.ip_forward=1

# Internet NAT configuration
udhcpc -i eth0
sysctl -w net.ipv4.ip_forward=1
ip route replace default via 192.168.122.1 dev eth0
iptables -t nat -C POSTROUTING -o eth0 -j MASQUERADE 2>/dev/null || iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Internal network route via Wired
ip route replace 192.243.0.0/19 via 192.243.16.58 dev eth1