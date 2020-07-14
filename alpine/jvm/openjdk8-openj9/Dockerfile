FROM adoptopenjdk/openjdk8-openj9:alpine

LABEL maintainer="Back Yu <yhfszb@gamil.com>"

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# 注入中国时区
RUN apk update \
	&& apk --no-cache add tzdata \
	&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Shanghai' >  /etc/timezone \
	&& apk del tzdata