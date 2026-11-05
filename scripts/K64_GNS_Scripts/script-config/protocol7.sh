#!/bin/sh
ip addr replace 192.243.16.74/30 dev eth0
ip addr replace 192.243.16.77/30 dev eth1
ip addr replace 192.243.15.129/26 dev eth2
sysctl -w net.ipv4.ip_forward=1
ip route replace default via 192.243.16.73
ip route replace 192.243.15.0/26 via 192.243.16.78
ip route replace 192.243.16.0/27 via 192.243.16.78
ip route replace 192.243.16.48/29 via 192.243.16.78
ip route replace 192.243.16.80/30 via 192.243.16.78
ip route replace 192.243.16.84/30 via 192.243.16.78
