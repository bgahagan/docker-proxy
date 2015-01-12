#!/bin/bash

# OpenVPN setup

[ -d /dev/net ] || mkdir -p /dev/net
[ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200

/etc/init.d/openvpn start client-uk

# Start Squid

squid3
