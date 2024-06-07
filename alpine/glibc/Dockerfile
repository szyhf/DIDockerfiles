FROM alpine:latest

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ENV GLIBC_VERSION=2.35-r1

RUN apk update \
	&& apk --no-cache add wget ca-certificates tzdata \
	&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Shanghai' >  /etc/timezone \
	&& wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	&& wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
	&& wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
 	&& apk --no-cache --force-overwrite add glibc-${GLIBC_VERSION}.apk \
	&& apk --no-cache --force-overwrite add glibc-bin-${GLIBC_VERSION}.apk \
	&& apk del wget tzdata \
	&& rm -rf /glibc-${GLIBC_VERSION}.apk \
	&& rm -rf /glibc-bin-${GLIBC_VERSION}.apk
