FROM debian:buster

RUN apt update  \
  && apt install -y squid3

COPY squid.conf /etc/squid/conf.d/docker.conf

EXPOSE 3128
CMD ["squid", "-N"]
