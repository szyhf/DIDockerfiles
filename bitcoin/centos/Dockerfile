FROM centos:latest

MAINTAINER Back Yu <yhfszb@gamil.com>

# If mirrors.
# ADD http://mirrors.aliyun.com/repo/Centos-7.repo /etc/yum.repos.d/CentOS-Base.repo

RUN yum update -y \
        && yum upgrade -y \
        && yum install -y wget \
        && yum autoremove -y \
        && yum clean all

ENV BITCOIN_VERSION=0.13.1

RUN wget https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
	&& tar xzvf /bitcoin-0.13.1-x86_64-linux-gnu.tar.gz \
	&& mv /bitcoin-${BITCOIN_VERSION}/bin/* /usr/local/bin/ \
	&& rm /bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz -rf \
	&& rm bitcoin-${BITCOIN_VERSION} -rf \
	&& mkdir /root/.bitcoin

VOLUME /root/.bitcoin

EXPOSE 8333 8332

CMD bitcoind
