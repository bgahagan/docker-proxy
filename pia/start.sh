#/bin/bash

set -euo pipefail

export PIA_DNS=true
export PIA_PF=true
#export AUTOCONNECT=true
#export PREFERRED_REGION=
export VPN_PROTOCOL=wireguard

if [ -r /pia/pia.conf ]; then
  source /pia/pia.conf
fi

cd /pia
./run_setup.sh
