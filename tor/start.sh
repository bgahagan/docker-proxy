#!/bin/bash

set -euo pipefail

echo here

ip route del default
ip route add default via 172.18.0.2

exec tor --defaults-torrc /torrc
