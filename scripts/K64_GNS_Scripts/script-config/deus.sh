#!/bin/sh
ip addr replace 192.243.16.70/30 dev eth0
ip addr replace 192.243.16.73/30 dev eth1
ip addr replace 192.243.14.129/25 dev eth2
sysctl -w net.ipv4.ip_forward=1
ip route replace default via 192.243.16.69
ip route replace 192.243.15.0/26 via 192.243.16.74
ip route replace 192.243.15.128/26 via 192.243.16.74
ip route replace 192.243.16.0/27 via 192.243.16.74
ip route replace 192.243.16.48/29 via 192.243.16.74
ip route replace 192.243.16.76/30 via 192.243.16.74
ip route replace 192.243.16.80/30 via 192.243.16.74
ip route replace 192.243.16.84/30 via 192.243.16.74
