FROM docker.elastic.co/logstash/logstash:5.4.0

MAINTAINER Back Yu <yhfszb@gamil.com>

RUN yum -y update \
	&& yum -y upgrade \
	&& yum -y autoremove \
	&& yum clean all