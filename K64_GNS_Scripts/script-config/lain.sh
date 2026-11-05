#!/bin/sh
ip addr replace 192.243.15.2/26 dev eth0
ip route replace default via 192.243.15.1