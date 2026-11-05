#!/bin/sh
ip addr replace 192.243.14.130/25 dev eth0
ip route replace default via 192.243.14.129
