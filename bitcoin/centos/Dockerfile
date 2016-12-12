FROM centos:latest

MAINTAINER Back Yu <yhfszb@gamil.com>

# If mirrors.
# ADD http://mirrors.aliyun.com/repo/Centos-7.repo /etc/yum.repos.d/CentOS-Base.repo

RUN yum makecache \
	&& yum update -y \
	&& yum upgrade -y \
	&& yum install -y wget tar \
	&& yum autoremove \
	&& yum clean

ENV BITCOIN_VERSION=0.13.1

RUN wget https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz

RUN tar xvf bitcoin-0.13.1-x86_64-linux-gnu.tar.gz

RUN mv bitcoin-0.13.1/bin/* /usr/local/bin/

RUN rm -rf bitcoin-0.13.1-x86_64-linux-gnu.tar.gz
RUN rm -rf bitcoin-0.13.1

RUN mkdir /root/.bitcoin

VOLUME /root/.bitcoin

EXPOSE 8333 8332

CMD bitcoind
