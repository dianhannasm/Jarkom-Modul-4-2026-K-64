#!/bin/sh
ip addr replace 192.243.12.3/24 dev eth0
ip route replace default via 192.243.12.1
