FROM tomcat:8-jdk8-adoptopenjdk-openj9

LABEL maintainer="Back Yu <yhfszb@gamil.com>"

# 注入中国时区
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
	&& ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& dpkg-reconfigure -f noninteractive tzdata