#!/bin/sh
ip addr replace 192.243.14.2/25 dev eth0
ip route replace default via 192.243.14.1