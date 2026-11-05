#!/bin/sh
ip addr replace 192.243.13.3/24 dev eth0
ip route replace default via 192.243.13.1
