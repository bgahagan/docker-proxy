#!/bin/bash

set -euo pipefail

ip route del default
ip route add default via 172.18.0.2

exec sockd -f /sockd.conf
