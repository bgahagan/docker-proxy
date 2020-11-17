#!/bin/bash

set -e

[ -d /dev/net ] || mkdir -p /dev/net
[ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200

if ! [ -f /etc/openvpn/client.cred ] ; then
  echo "client.cred not present"
  exit 1
fi

/etc/init.d/openvpn start "${OPENVPN_CLIENT:-US_West}"

# Start Squid

squid -N
