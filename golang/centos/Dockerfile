FROM centos:7.3.1611

MAINTAINER Back Yu <yhfszb@gamil.com>

ENV GO_VERSION=1.8.3
ENV GO_OS=linux-amd64

# ADD http://mirrors.aliyun.com/repo/Centos-7.repo /etc/yum.repos.d/CentOS-Base.repo

RUN yum update -y \
	&& yum install wget git -y\
	&& wget -q https://storage.googleapis.com/golang/go${GO_VERSION}.${GO_OS}.tar.gz \
	&& tar xzvf go${GO_VERSION}.${GO_OS}.tar.gz \
	&& rm -rf go${GO_VERSION}.${GO_OS}.tar.gz \
	&& mv go /usr/local/ \
	&& yum remove wget -y \
	&& yum autoremove -y \
	&& yum clean all

# 安装go工具
ENV PATH=$PATH:/usr/local/go/bin

RUN mkdir -p /go_dep/src /go_third/src /go

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
