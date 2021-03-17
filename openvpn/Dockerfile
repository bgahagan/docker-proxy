FROM debian:buster

RUN apt update  \
  && apt install -y wget unzip openvpn

RUN cd /etc/openvpn \
 && wget https://www.privateinternetaccess.com/openvpn/openvpn-nextgen.zip \
 && unzip openvpn-nextgen.zip \
 && bash -c 'for f in *.ovpn; do f2=${f%.ovpn}; f2="${f2// /_}.conf"; mv -v "$f" "$f2"; echo "config /etc/openvpn/pia.include" >> "$f2"; done'

COPY pia.include /etc/openvpn/pia.include
COPY start.sh /start.sh

CMD /start.sh
