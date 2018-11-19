FROM szyhf/alpine-glibc

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update

ADD skydns /usr/local/bin/skydns

RUN chmod u+x /usr/local/bin/skydns

EXPOSE 53

CMD /usr/local/bin/skydns
