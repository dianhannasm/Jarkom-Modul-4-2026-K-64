#!/bin/sh
ip addr replace 192.243.16.2/27 dev eth0
ip route replace default via 192.243.16.1
