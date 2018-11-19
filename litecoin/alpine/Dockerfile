FROM szyhf/alpine-glibc

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ENV LITECOIN_VERSION=0.16.3

RUN apk update \
	&& apk --no-cache add wget ca-certificates \
	&& wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
	&& tar xzvf /litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
	&& mkdir /root/.litecoin \
	&& apk del wget ca-certificates \
	&& mv /litecoin-${LITECOIN_VERSION}/bin/* /usr/local/bin/ \
	&& rm -rf /litecoin-${LITECOIN_VERSION}/ \
	&& rm -rf /litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
	&& rm -rf /glibc-${GLIBC_VERSION}.apk \
	&& rm -rf /glibc-bin-${GLIBC_VERSION}.apk

EXPOSE 9333 9332
CMD litecoind