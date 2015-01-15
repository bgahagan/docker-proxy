FROM debian:jessie

RUN apt-get update  \
  && apt-get install -y squid3 openvpn \
  && mv /etc/squid3/squid.conf /etc/squid3/squid.conf.dist

COPY openvpn/* /etc/openvpn/

COPY squid/squid.conf /etc/squid3/squid.conf
EXPOSE 3128

COPY start.sh /start.sh
RUN chmod u+x /start.sh

CMD /start.sh
