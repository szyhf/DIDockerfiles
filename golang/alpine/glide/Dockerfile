FROM szyhf/alpine-glibc

MAINTAINER Back Yu <yhfszb@gamil.com>

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ENV GO_VERSION=1.8.3
ENV GO_OS=linux-amd64
ENV PATH=$PATH:/usr/local/go/bin

RUN apk update \
	&& apk --no-cache add wget ca-certificates libcurl git \
	&& wget --quiet https://storage.googleapis.com/golang/go${GO_VERSION}.${GO_OS}.tar.gz \
	&& mkdir -p /usr/local/go \
	&& tar -C /usr/local -xzf go${GO_VERSION}.${GO_OS}.tar.gz \
	&& rm -rf go${GO_VERSION}.${GO_OS}.tar.gz \
	&& curl https://glide.sh/get | sh \
	&& apk del wget ca-certificates \
	&& mkdir -p /root/go/src /root/.glide

ENV GOPATH=/root/go

ENV GLIDE_HOME=/root/.glide


