FROM alpine:3

RUN apk add --update \
  wget curl jq wireguard-tools

#RUN mkdir /pia \
# && cd /pia \
# && wget -O pia.tgz https://github.com/pia-foss/manual-connections/archive/v2.0.0.tar.gz \
# && tar --strip-components=1 -xf pia.tgz

COPY ./manual-connections /pia/

COPY start.sh /start.sh

CMD /start.sh
