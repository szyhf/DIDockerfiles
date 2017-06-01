FROM golang:1.8.3-alpine3.6

MAINTAINER Back Yu <yhfszb@gamil.com>

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
# RUN echo /etc/hosts >> "151.101.72.249 github.global.ssl.fastly.net"
# RUN echo /etc/hosts >> "151.101.100.133 assets-cdn.github.com"

RUN apk update && apk add git

RUN mkdir -p /go_dep/src /go_third/src

# golang.org的三方库目录（这个项目太常用了）
ENV GOPATH=/go_third
RUN	go get -v -d -fix golang.org/x/crypto/bcrypt
RUN	go get -v -d -fix golang.org/x/benchmarks/http
RUN	go get -v -d -fix golang.org/x/image/bmp
RUN	go get -v -d -fix golang.org/x/mobile/app
RUN	go get -v -d -fix golang.org/x/net/html
RUN	go get -v -d -fix golang.org/x/sys/unix
RUN	go get -v -d -fix golang.org/x/tools/blog
RUN	go get -v -d -fix golang.org/x/debug
RUN	go get -v -d -fix golang.org/x/text

ENV GOPATH=/go_dep:/go:/go_third
ENV GOBIN=/go/bin

# 挂载2个目录
# 1. 默认的本地项目目录
# 2. 本地项目依赖的其他项目

VOLUME /go/src
VOLUME /go_dep/src
