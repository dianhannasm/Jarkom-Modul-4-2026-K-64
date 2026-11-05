#!/bin/sh
ip addr replace 192.243.16.86/30 dev eth0
ip addr replace 192.243.15.1/26 dev eth1
sysctl -w net.ipv4.ip_forward=1
ip route replace default via 192.243.16.85
