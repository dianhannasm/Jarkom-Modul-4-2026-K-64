#!/bin/sh
ip addr replace 192.243.10.3/23 dev eth0
ip route replace default via 192.243.10.1