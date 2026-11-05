#!/bin/sh
ip addr replace 192.243.16.82/30 dev eth0
ip addr replace 192.243.16.1/27 dev eth1
ip addr replace 192.243.16.85/30 dev eth2
sysctl -w net.ipv4.ip_forward=1
ip route replace default via 192.243.16.81
ip route replace 192.243.15.0/26 via 192.243.16.86
