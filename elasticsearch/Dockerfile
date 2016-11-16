FROM elasticsearch:latest

MAINTAINER Back Yu <szyhf@163.com>

# 装head插件
RUN /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head

# 安装license
RUN /usr/share/elasticsearch/bin/plugin install license

# 安装Marvel-agent
RUN /usr/share/elasticsearch/bin/plugin install -b marvel-agent
