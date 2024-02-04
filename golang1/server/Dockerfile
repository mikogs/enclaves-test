FROM golang:bookworm AS builder

RUN apt-get update && \
    apt-get install -y git bash

WORKDIR /go/src/server
COPY . .
RUN go build

FROM debian:bookworm-slim

WORKDIR /workdir
COPY --from=builder /go/src/server/server /bin/server
RUN chmod +x /bin/server
ENTRYPOINT ["/bin/server"]

