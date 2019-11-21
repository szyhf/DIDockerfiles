FROM golang:alpine as builder

ARG CONFD_VER=0.19.2

WORKDIR /go/src/github.com/kelseyhightower
RUN wget -q https://github.com/nacos-group/nacos-confd/archive/v${CONFD_VER}.tar.gz \
    && tar -xf v${CONFD_VER}.tar.gz \
	&& rm -rf v${CONFD_VER}.tar.gz \
	&& mv nacos-confd-${CONFD_VER} confd \
	&& cd confd \
	&& go build -o nacos-confd

FROM szyhf/alpine-glibc:latest

COPY --from=0 /go/src/github.com/kelseyhightower/confd/nacos-confd /usr/local/bin/

RUN chmod u+x /usr/local/bin/nacos-confd \
	&& mkdir -p /etc/confd/conf.d \
	&& mkdir -p /etc/confd/templates

VOLUME [ "/etc/confd/conf.d", "/etc/confd/templates" ]

# confd -watch -backend nacos -endpoint ${ACM_ENDPOINT}:8080 -namespace ${ACM_NAMESPACE} -accessKey ${ACM_AK} -secretKey ${ACM_SK}
ENTRYPOINT [ "/usr/local/bin/nacos-confd" ]