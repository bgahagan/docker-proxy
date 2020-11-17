FROM debian:buster

RUN apt update  \
  && apt install -y wget unzip squid3 openvpn

RUN cd /etc/openvpn \
 && wget https://www.privateinternetaccess.com/openvpn/openvpn-nextgen.zip \
 && unzip openvpn-nextgen.zip \
 && bash -c 'for f in *.ovpn; do f2=${f%.ovpn}; f2="${f2// /_}.conf"; mv -v "$f" "$f2"; echo "auth-user-pass client.cred" >> "$f2"; done'

COPY squid/squid.conf /etc/squid/conf.d/docker.conf
COPY start.sh /start.sh

EXPOSE 3128
CMD /start.sh
