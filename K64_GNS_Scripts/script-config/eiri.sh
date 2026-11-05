#!/bin/sh
ip addr replace 192.243.16.50/29 dev eth0
ip route replace default via 192.243.16.49
