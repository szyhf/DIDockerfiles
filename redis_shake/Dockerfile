FROM szyhf/alpine-glibc:latest
# FROM szyhf/alpine-glibc:2.35-r0

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

# https://github.com/alibaba/RedisShake/releases/download/v3.1.6/redis-shake-linux-arm64.tar.gz
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# 目前release的3.1.6版本有bug，改为手动编译的版本
ENV VERSION=v3.1.6
# RUN apk update \
# 	&& apk --no-cache add wget py3-pip python3 \
# 	&& mkdir -p /root/redis-shake/conf \
# 	&& wget -q https://github.com/alibaba/RedisShake/releases/download/${VERSION}/redis-shake-linux-arm64.tar.gz -O /root/redis-shake/redis-shake-linux-arm64.tar.gz \
# 	&& cd /root/redis-shake \
# 	&& tar xf redis-shake-linux-arm64.tar.gz \
# 	&& rm -rf redis-shake-linux-arm64.tar.gz \
# 	&& chmod u+x redis-shake \
# 	&& cd /root/redis-shake/cluster_helper \
# 	&& pip3 install -r requirements.txt \
# 	&& apk del wget py3-pip

COPY build /root/redis-shake
RUN apk update \
	&& apk add py3-pip python3 \
	&& mkdir -p /root/redis-shake/conf \
	&& cd /root/redis-shake \
	&& chmod u+x redis-shake \
	&& cd /root/redis-shake/cluster_helper \
	&& pip3 install -r requirements.txt \
	&& apk del py3-pip

WORKDIR /root/redis-shake

ENTRYPOINT [ "/root/redis-shake/redis-shake" ]