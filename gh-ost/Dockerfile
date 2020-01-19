FROM golang:alpine as builder

WORKDIR /go/src/github.com/github/gh-ost

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add gcc musl-dev \
	&& wget -q https://github.com/github/gh-ost/archive/master.zip \
    && unzip master.zip \
	&& rm -rf master.zip \
	&& mv gh-ost-master/* /go/src/github.com/github/gh-ost \
	&& cd go/cmd/gh-ost/ \
	&& go build -o gh-ost

FROM szyhf/alpine-glibc:latest

WORKDIR /gh-ost
COPY --from=0 /go/src/github.com/github/gh-ost/go/cmd/gh-ost/gh-ost /gh-ost
RUN chmod u+x /gh-ost/gh-ost

ENTRYPOINT [ "./gh-ost" ]