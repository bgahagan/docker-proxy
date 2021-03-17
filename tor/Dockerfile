FROM alpine:3

RUN apk add --update bash tor

COPY torrc /torrc
COPY start.sh /start.sh

CMD /start.sh
