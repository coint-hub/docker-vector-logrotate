FROM timberio/vector:0.43.1-alpine

RUN apk add --no-cache logrotate

COPY logrotate.conf /etc/logrotate.d/vector
COPY vector.yaml /etc/vector/vector.yaml
COPY start.sh /start.sh

ENV VECTOR_CONFIG=/etc/vector/vector.yaml

ENTRYPOINT exec "/start.sh"