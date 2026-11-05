#!/bin/sh
ip addr replace 192.243.16.42/29 dev eth0
ip route replace default via 192.243.16.41
