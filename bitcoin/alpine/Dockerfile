FROM alpine:latest

MAINTAINER Back Yu <yhfszb@gamil.com>

# Using mirrors
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update \
	&& apk add ca-certificates wget tar

RUN wget https://bitcoin.org/bin/bitcoin-core-0.13.1/bitcoin-0.13.1-x86_64-linux-gnu.tar.gz

RUN tar xvf bitcoin-0.13.1-x86_64-linux-gnu.tar.gz

RUN mv bitcoin-0.13.1/bin/* /usr/local/bin/

RUN rm -rf bitcoin-0.13.1-x86_64-linux-gnu.tar.gz
RUN rm -rf bitcoin-0.13.1

RUN mkdir /root/.bitcoin

VOLUME /root/.bitcoin

EXPOSE 8333

CMD bitcoind