FROM kibana:latest

MAINTAINER Back Yu <yhfszb@gamil.com>

RUN mkdir /opt/kibana/downloads/

COPY marvel-2.4.1.tar.gz /opt/kibana/downloads/

RUN /opt/kibana/bin/kibana plugin --install marvel --url file:///opt/kibana/downloads/marvel-2.4.1.tar.gz