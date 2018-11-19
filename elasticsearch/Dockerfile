FROM elasticsearch:latest

LABEL MAINTAINER="Back Yu <yhfszb@gamil.com>"

# 装head插件
RUN /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head

# 安装license
RUN /usr/share/elasticsearch/bin/plugin install license

# 安装Marvel-agent
RUN /usr/share/elasticsearch/bin/plugin install -b marvel-agent
