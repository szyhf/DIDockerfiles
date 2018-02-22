FROM szyhf/alpine-glibc

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ENV ETH_VERSION=1.8.1-1e67410e

RUN apk update \
	&& apk --no-cache add wget ca-certificates \
	&& wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-${ETH_VERSION}.tar.gz \
	&& tar xzvf /geth-linux-amd64-${ETH_VERSION}.tar.gz \
	&& mkdir /root/.ethereum \
	&& apk del wget ca-certificates \
	&& mv /geth-linux-amd64-${ETH_VERSION}/geth /usr/local/bin/ \
	&& rm -rf /geth-linux-amd64-${ETH_VERSION}/ \
	&& rm -rf /geth-linux-amd64-${ETH_VERSION}.tar.gz

# 8545 used by the HTTP based JSON RPC API
# 8546 used by the WebSocket based JSON RPC API
# 30303 used by the P2P protocol running the network
EXPOSE 8545 8546 30303
CMD geth
