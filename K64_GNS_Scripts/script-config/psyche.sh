#!/bin/sh
ip addr replace 192.243.16.34/29 dev eth0
ip addr replace 192.243.0.1/22 dev eth1
sysctl -w net.ipv4.ip_forward=1
ip route replace default via 192.243.16.33
