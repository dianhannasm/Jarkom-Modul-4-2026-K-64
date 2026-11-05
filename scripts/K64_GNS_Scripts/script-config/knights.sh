#!/bin/sh
ip addr replace 192.243.16.78/30 dev eth0
ip addr replace 192.243.16.81/30 dev eth1
ip addr replace 192.243.16.49/29 dev eth2
sysctl -w net.ipv4.ip_forward=1
ip route replace default via 192.243.16.77
ip route replace 192.243.15.0/26 via 192.243.16.82
ip route replace 192.243.16.0/27 via 192.243.16.82
ip route replace 192.243.16.84/30 via 192.243.16.82
