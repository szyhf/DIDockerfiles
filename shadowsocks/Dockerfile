FROM centos:latest

MAINTAINER Back Yu <sz_yhf@163.com>

RUN yum -y update

RUN yum install -y python-setuptools && easy_install pip

RUN pip install shadowsocks

COPY ./shadowsocks.json /var/shadowsocks/shadowsocks.json

VOLUME /var/shadowsocks/

ENTRYPOINT ["/usr/bin/ssserver","-c","/etc/shadowsocks.json","-d","start"]