#!/bin/bash

set -e

# OpenVPN setup

[ -d /dev/net ] || mkdir -p /dev/net
[ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200

if ! [ -f /etc/openvpn/client.cred ] ; then
  echo "client.cred not present"
  exit 1
fi

/etc/init.d/openvpn start ${OPENVPN_CLIENT-:client-us}

# Start Squid

squid3 -N -X
