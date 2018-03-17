#!/bin/sh

iptables -t nat -D PREROUTING -s 172.17.0.0/16 ! -d 172.17.0.0/16 -p tcp --match multiport --dport 80,443,8080,8443 -j DNAT --to 172.17.0.1:8080
