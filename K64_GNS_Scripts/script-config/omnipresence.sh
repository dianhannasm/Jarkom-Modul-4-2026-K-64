#!/bin/sh
ip addr replace 192.243.4.2/22 dev eth0
ip route replace default via 192.243.4.1