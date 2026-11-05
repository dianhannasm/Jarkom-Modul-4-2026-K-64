#!/bin/sh
ip addr replace 192.243.16.36/29 dev eth0
ip addr replace 192.243.16.41/29 dev eth1
ip addr replace 192.243.16.89/30 dev eth2
sysctl -w net.ipv4.ip_forward=1
ip route replace default via 192.243.16.33
ip route replace 192.243.4.0/22 via 192.243.16.90