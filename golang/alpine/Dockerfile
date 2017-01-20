FROM golang:1.7.4-alpine3.5

# 挂载3个目录
# 1. 默认的本地项目目录
# 2. 本地项目依赖的其他项目
# 3. golang.org的三方库目录（这个项目太常用了）

VOLUME /go/src
VOLUME /go_dep/src
VOLUME /go_third/src

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
# RUN echo /etc/hosts >> "151.101.72.249 github.global.ssl.fastly.net"
# RUN echo /etc/hosts >> "151.101.100.133 assets-cdn.github.com"

RUN apk update && apk add git

RUN mkdir -p /go_dep/src /go_third/src

ENV GOPATH=/go_third
RUN	go get -v -d github.com/golang/crypto
RUN	go get -v -d github.com/golang/benchmarks
RUN	go get -v -d github.com/golang/debug
RUN	go get -v -d github.com/golang/image
RUN	go get -v -d github.com/golang/mobile
RUN	go get -v -d github.com/golang/net
RUN	go get -v -d github.com/golang/sys
RUN	go get -v -d github.com/golang/text
RUN	go get -v -d github.com/golang/tools

RUN ln -s /go_third/src/github.com/golang /go_third/src/golang.org/x

ENV GOPATH=/go_dep:/go:/go_third