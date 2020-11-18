FROM debian:buster

RUN apt update  \
  && apt install -y wget unzip squid3 openvpn

RUN cd /etc/openvpn \
 && wget https://www.privateinternetaccess.com/openvpn/openvpn-nextgen.zip \
 && unzip openvpn-nextgen.zip \
 && bash -c 'for f in *.ovpn; do f2=${f%.ovpn}; f2="${f2// /_}.conf"; mv -v "$f" "$f2"; echo "config /etc/openvpn/pia.include" >> "$f2"; done'

COPY openvpn/pia.include /etc/openvpn/pia.include
COPY squid/squid.conf /etc/squid/conf.d/docker.conf
COPY start.sh /start.sh

EXPOSE 3128
CMD /start.sh
