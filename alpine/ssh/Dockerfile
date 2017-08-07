FROM alpine:3.5

MAINTAINER Back Yu <yhfszb@gamil.com>

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

WORKDIR /root

RUN apk update \
	&& apk add openssh \
	&& rm  -rf /tmp/* /var/cache/apk/* \
	&& mkdir -p ./.ssh \
	&& touch ~/.ssh/authorized_keys \
	&& ssh-keygen -A

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
