FROM golang:alpine as builder

WORKDIR /go/src/github.com/moiot/gravity

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ENV GO111MODULE=on

RUN apk add gcc musl-dev git make \
	&& git clone https://github.com/moiot/gravity.git

RUN cd gravity \
	&& make

RUN ls -la /go/src/github.com/moiot/gravity/gravity/bin

FROM szyhf/alpine-glibc:latest

COPY --from=0 /go/src/github.com/moiot/gravity/gravity/bin/gravity /usr/local/bin
RUN chmod u+x /usr/local/bin/gravity

ENTRYPOINT [ "gravity" ]