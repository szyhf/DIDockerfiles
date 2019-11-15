FROM gcr.io/etcd-development/etcd:v3.4.3

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata \
	&& rm -rf /etc/localtime \
	&& cp /usr/share/zoneinfo/PRC /etc/localtime \
	&& echo 'Asia/Shanghai' >  /etc/timezone \
	&& apt-get -y remove tzdata \
	&& apt-get -y autoremove \
	&& apt-get -y clean \
	&& rm -rf /var/lib/apt/lists/*