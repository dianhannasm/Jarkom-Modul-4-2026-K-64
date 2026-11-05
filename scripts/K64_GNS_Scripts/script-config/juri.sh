#!/bin/sh
ip addr replace 192.243.15.194/26 dev eth0
ip route replace default via 192.243.15.193
