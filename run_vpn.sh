#!/bin/sh

export OVPN_DATA="ovpn-data-burp"

docker run -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/tcp --cap-add=NET_ADMIN kylemanna/openvpn
