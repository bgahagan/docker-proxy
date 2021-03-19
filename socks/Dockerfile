FROM alpine:3

RUN apk add --update \
  bash dante-server

COPY sockd.conf /sockd.conf
COPY start.sh /start.sh

CMD /start.sh
