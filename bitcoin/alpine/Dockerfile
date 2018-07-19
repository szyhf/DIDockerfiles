FROM szyhf/alpine-glibc:latest

LABEL maintainer="yhfszb@gamil.com"

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ENV BITCOIN_VERSION=0.16.1
ENV BITCOIN_DIR_VERSION=0.16.1
ENV GLIBC_VERSION=2.26-r0


RUN apk update \
	&& apk --no-cache add wget ca-certificates \
	&& wget https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
	&& tar xzvf /bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
	&& mkdir /root/.bitcoin \
	&& apk del wget ca-certificates \
	&& mv /bitcoin-${BITCOIN_DIR_VERSION}/bin/* /usr/local/bin/ \
	&& rm -rf /bitcoin-${BITCOIN_VBITCOIN_DIR_VERSIONRSION}/ \
	&& rm -rf /bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz

EXPOSE 8333 8332
CMD bitcoind
