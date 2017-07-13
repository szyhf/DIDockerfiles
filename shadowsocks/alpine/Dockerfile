FROM alpine:latest

MAINTAINER Back Yu <yhfszb@gamil.com>

ENV SS_VERSION=1.2.1
ENV SC_VERSION=1.1.5

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update \
	&& apk --no-cache add wget ca-certificates \
	&& mkdir -p /shadowsocks \
	&& wget https://github.com/shadowsocks/shadowsocks-go/releases/download/${SS_VERSION}/shadowsocks-server.tar.gz \
	&& wget https://github.com/shadowsocks/shadowsocks-go/releases/download/${SC_VERSION}/shadowsocks-local-linux64-${SC_VERSION}.gz \
	&& tar xzvf shadowsocks-server.tar.gz \
	&& mv shadowsocks-server /shadowsocks \
	&& gzip -d shadowsocks-local-linux64-${SC_VERSION}.gz \
	&& mv shadowsocks-local-linux64-${SC_VERSION} /shadowsocks/shadowsocks-local \
	&& chmod u+x /shadowsocks/shadowsocks-server \
	&& chmod u+x /shadowsocks/shadowsocks-local \
	&& rm -rf shadowsocks-local-linux64-${SC_VERSION}.gz \
	&& rm -rf shadowsocks-server.tar.gz \
	&& export PATH=$PATH:/shadowsocks/

COPY shadowsocks.json /shadowsocks/config.json

WORKDIR /shadowsocks
