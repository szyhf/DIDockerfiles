FROM szyhf/alpine-glibc

MAINTAINER Back Yu <yhfszb@gamil.com>

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ENV GO_VERSION=1.8.3
ENV GO_OS=linux-amd64

RUN apk update
RUN apk --no-cache add wget ca-certificates
RUN wget --quiet https://storage.googleapis.com/golang/go${GO_VERSION}.${GO_OS}.tar.gz
RUN mkdir -p /usr/local/go
RUN tar -C /usr/local -xzf go${GO_VERSION}.${GO_OS}.tar.gz
RUN rm -rf go${GO_VERSION}.${GO_OS}.tar.gz
RUN go install github.com/Masterminds/glide
RUN apk del wget ca-certificates

ENV PATH=$PATH:/usr/local/go/bin

RUN mkdir -p /root/go/go_dep/src /root/go/go_third/src /root/go/go/src /root/.glide
ENV GLIDE_HOME=/root/.glide


