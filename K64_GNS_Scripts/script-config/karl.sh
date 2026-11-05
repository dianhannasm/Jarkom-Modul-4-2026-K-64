#!/bin/sh
ip addr replace 192.243.0.2/22 dev eth0
ip route replace default via 192.243.0.1