FROM fabric8/java-alpine-openjdk8-jdk
# update by: https://github.com/sheepkiller/kafka-manager-docker/tree/alpine

MAINTAINER Back Yu <yhfszb@gamil.com>

# The Scala 2.11 build is currently recommended by the project.
ENV KAFKA_VERSION=0.10.2.1 KAFKA_SCALA_VERSION=2.12 JMX_PORT=7203
ENV KAFKA_RELEASE_ARCHIVE kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz

RUN mkdir /kafka /data /logs
ADD start.sh /start.sh

# COPY kafka_2.12-0.10.2.1.tgz /
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update \
	&& apk --no-cache add wget ca-certificates bash \
	&& wget --quiet http://www.us.apache.org/dist/kafka/${KAFKA_VERSION}/${KAFKA_RELEASE_ARCHIVE} \
	&& tar -zx -C /kafka --strip-components=1 -f /${KAFKA_RELEASE_ARCHIVE} && rm -rf /kafka_* \
	&& addgroup kafka \
	&& adduser -h /kafka -G kafka -s /bin/false -D kafka \
	&& chown -R kafka:kafka /kafka /data /logs /start.sh \
	&& chmod u+x /start.sh \
	&& apk del wget \
	&& rm /kafka/config/server.properties

ADD config /kafka/config

USER kafka
ENV PATH /kafka/bin:$PATH
WORKDIR /kafka

# broker, jmx
EXPOSE 9092 ${JMX_PORT}
VOLUME [ "/data", "/logs" ]

CMD ["/start.sh"]
