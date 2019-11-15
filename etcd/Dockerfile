FROM gcr.io/etcd-development/etcd:v3.4.3

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata \
	&& ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Shanghai' >  /etc/timezone \
	&& dpkg-reconfigure -f noninteractive tzdata \
	&& apt-get -y autoremove \
	&& apt-get -y clean