FROM alpine:3.5

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ENV ETCD_VERSION=v3.3.1
ENV ETCDCTL_API=3

# Alpine Linux doesn't use pam, which means that there is no /etc/nsswitch.conf,
# but Golang relies on /etc/nsswitch.conf to check the order of DNS resolving
# (see https://github.com/golang/go/commit/9dee7771f561cf6aee081c0af6658cc81fac3918)
# To fix this we just create /etc/nsswitch.conf and add the following line:
RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

RUN apk update \
	&& apk --no-cache add wget ca-certificates \
	&& wget https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
	&& tar xzvf /etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
	&& mkdir -p /var/etcd/ \
	&& mv /etcd-${ETCD_VERSION}-linux-amd64/etcd /usr/local/bin/etcd \
	&& mv /etcd-${ETCD_VERSION}-linux-amd64/etcdctl /usr/local/bin/etcdctl \
	&& rm -rf /etcd-${ETCD_VERSION}-linux-amd64/ \
	&& rm -rf /etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
	&& apk del wget ca-certificates

WORKDIR /var/etcd/

ADD init.sh /init.sh

EXPOSE 2379 2380
CMD ["/usr/local/bin/etcd"]
