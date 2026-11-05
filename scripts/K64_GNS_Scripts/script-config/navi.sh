#!/bin/sh
ip addr replace 192.243.16.62/30 dev eth0
ip addr replace 192.243.12.1/24 dev eth1
ip addr replace 192.243.15.65/26 dev eth2
ip addr replace 192.243.13.1/24 dev eth3
sysctl -w net.ipv4.ip_forward=1
ip route replace default via 192.243.16.61
