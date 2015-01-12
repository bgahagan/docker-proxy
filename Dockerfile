FROM ubuntu:14.04

RUN apt-get update  \
  && apt-get install -y squid3 openvpn \
  && mv /etc/squid3/squid.conf /etc/squid3/squid.conf.dist

ADD openvpn/* /etc/openvpn/
ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

ADD squid/squid.conf /etc/squid3/squid.conf
EXPOSE 3128

#CMD /start
