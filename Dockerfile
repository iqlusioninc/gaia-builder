FROM golang:alpine AS build-env
ARG VERSION=v7.0.2

ENV PACKAGES curl make git libc-dev bash gcc linux-headers eudev-dev

RUN apk add --no-cache $PACKAGES

WORKDIR /go/src/github.com/cosmos

RUN git clone -b ${VERSION} https://github.com/cosmos/gaia.git

WORKDIR /go/src/github.com/cosmos/gaia

RUN make build-linux

FROM alpine:edge

RUN apk add --no-cache ca-certificates
WORKDIR /root

COPY --from=build-env /go/src/github.com/cosmos/gaia/build/gaiad /usr/bin/gaiad

WORKDIR /gaia

COPY ./setup/gaia.sh .

USER root

RUN chmod -R 777 ./gaia.sh

EXPOSE 26657

ENTRYPOINT [ "./gaia.sh" ]