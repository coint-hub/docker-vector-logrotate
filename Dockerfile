FROM timberio/vector:0.58.0-alpine

ENV TZ=Asia/Seoul
RUN apk --no-cache add zstd

COPY vector.yaml /vector.yaml

ENTRYPOINT exec vector --config /vector.yaml --require-healthy true
