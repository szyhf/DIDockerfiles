FROM szyhf/alpine-glibc

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

ARG VERSION=0.23.2
ARG PLATFORM=linux_amd64

RUN apk update \
	&& apk --no-cache add wget ca-certificates \
	&& wget -q https://github.com/fatedier/frp/releases/download/v0.23.2/frp_${VERSION}_${PLATFORM}.tar.gz \
	&& tar xzvf /frp_${VERSION}_${PLATFORM}.tar.gz \
	&& mv /frp_${VERSION}_${PLATFORM} /frp \
	&& apk del wget ca-certificates \
	&& rm -rf /frp_${VERSION}_${PLATFORM}.tar.gz

WORKDIR /frp
RUN mkdir conf
RUN mkdir conf.d
RUN mv *.ini conf
COPY entrypoint.sh .
RUN chmod u+x ./entrypoint.sh

VOLUME [ "conf.d" ]

ENTRYPOINT [ "/frp/entrypoint.sh" ]