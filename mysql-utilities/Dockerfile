FROM alpine

RUN apk --update add python
ADD https://cdn.mysql.com/archives/mysql-utilities/mysql-utilities-1.6.5.tar.gz /tmp/
RUN cd /tmp \
	&& tar xf mysql-utilities-1.6.5.tar.gz \
	&& cd /tmp/mysql-utilities-1.6.5 \
	&& python setup.py install \
	&& rm -rf /tmp/mysql-utilities-1.6.5 /tmp/mysql-utilities-1.6.5.tar.gz