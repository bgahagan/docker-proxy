#!/bin/bash

set -e

[ -d /dev/net ] || mkdir -p /dev/net
[ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200

if ! [ -f /etc/openvpn/client.cred ] ; then
  echo "client.cred not present"
  exit 1
fi

# Setup routes to local networks, so they don't go through the vpn
if [ -n "$OPENVPN_LOCALNET" ] ; then
  default_gw=$(ip route show | awk '/default via/ {print $3}')
  ip route add "$OPENVPN_LOCALNET" via "$default_gw"
fi

openvpn "/etc/openvpn/${OPENVPN_CLIENT:-US_West}.conf"
