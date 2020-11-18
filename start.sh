#!/bin/bash

set -e

[ -d /dev/net ] || mkdir -p /dev/net
[ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200

if ! [ -f /etc/openvpn/client.cred ] ; then
  echo "client.cred not present"
  exit 1
fi

openvpn "/etc/openvpn/${OPENVPN_CLIENT:-US_West}.conf" &
sleep 1

# Start Squid

squid -N
