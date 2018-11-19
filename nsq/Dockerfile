FROM alpine:3.8

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ENV NSQ_VERSION=1.1.0
ENV GO_VERSION=1.11.2

RUN apk update \
	&& apk --no-cache add wget ca-certificates tzdata \
	&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Shanghai' >  /etc/timezone \
	&& wget --quiet https://github.com/nsqio/nsq/releases/download/v${NSQ_VERSION}/nsq-${NSQ_VERSION}.linux-amd64.go${GO_VERSION}.tar.gz \
	&& tar xzvf /nsq-${NSQ_VERSION}.linux-amd64.go1.8.tar.gz \
	&& mkdir /nsq \
	&& mv /nsq-${NSQ_VERSION}.linux-amd64.go${GO_VERSION}/bin/* /usr/local/bin/ \
	&& rm -rf /nsq-${NSQ_VERSION}.linux-amd64.go${GO_VERSION}/ \
	&& rm -rf /nsq-${NSQ_VERSION}.linux-amd64.go${GO_VERSION}.tar.gz \
	&& apk del wget ca-certificates tzdata

CMD nsqd
