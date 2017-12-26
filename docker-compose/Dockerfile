FROM docker:latest

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# RUN mkdir -p /root/.pip

# RUN echo "[global]\nindex-url = http://mirrors.aliyun.com/pypi/simple/\n[install]\ntrusted-host=mirrors.aliyun.com" > /root/.pip/pip.conf

RUN apk update

RUN apk add py-pip

RUN pip install pip --upgrade

RUN pip install docker-compose