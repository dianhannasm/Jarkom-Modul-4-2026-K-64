#!/bin/sh
ip addr replace 192.243.16.35/29 dev eth0
ip addr replace 192.243.15.193/26 dev eth1
ip addr replace 192.243.8.1/23 dev eth2
sysctl -w net.ipv4.ip_forward=1
ip route replace default via 192.243.16.33
