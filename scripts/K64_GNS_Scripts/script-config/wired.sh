#!/bin/sh
ip addr replace 192.243.16.58/30 dev eth0
ip addr replace 192.243.16.61/30 dev eth1
ip addr replace 192.243.16.65/30 dev eth2
ip addr replace 192.243.16.33/29 dev eth3
sysctl -w net.ipv4.ip_forward=1
ip route replace 192.243.14.0/25 via 192.243.16.57
ip route replace 192.243.0.0/22 via 192.243.16.34
ip route replace 192.243.4.0/22 via 192.243.16.36
ip route replace 192.243.8.0/23 via 192.243.16.35
ip route replace 192.243.10.0/23 via 192.243.16.66
ip route replace 192.243.12.0/24 via 192.243.16.62
ip route replace 192.243.13.0/24 via 192.243.16.62
ip route replace 192.243.14.128/25 via 192.243.16.66
ip route replace 192.243.15.0/26 via 192.243.16.66
ip route replace 192.243.15.64/26 via 192.243.16.62
ip route replace 192.243.15.128/26 via 192.243.16.66
ip route replace 192.243.15.192/26 via 192.243.16.35
ip route replace 192.243.16.0/27 via 192.243.16.66
ip route replace 192.243.16.40/29 via 192.243.16.36
ip route replace 192.243.16.48/29 via 192.243.16.66
ip route replace 192.243.16.68/30 via 192.243.16.66
ip route replace 192.243.16.72/30 via 192.243.16.66
ip route replace 192.243.16.76/30 via 192.243.16.66
ip route replace 192.243.16.80/30 via 192.243.16.66
ip route replace 192.243.16.84/30 via 192.243.16.66
ip route replace 192.243.16.88/30 via 192.243.16.36
