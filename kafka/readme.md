# kafaka镜像

基于`https://hub.docker.com/r/ches/kafka`改造。

## 环境变量

### KAFKA参数

支持[Kafka文档](https://kafka.apache.org/documentation/#brokerconfigs)中列出的所有Broker参数，但不支持所有被标注为`DEPRECATED`的参数。

环境变量命名逻辑为：`KAFKA_${PARAM_NAME}`，例如`zookeeper.connect`对应的环境变量为`KAFKA_ZOOKEEPER_CONNECT`。

> 特别注意`*.listeners`与原来`DEPRECATED`的`*.host`+`*.port`的使用差别，会受到`listener.security.protocol.map`的影响。

#### `$KAFKA_HEAP_OPTS`

KAFKA提供的官方参数，默认设置为`-XX:+UseG1GC`作为回收，可以自己定义。

### `$KAFKA_JMX_OPTS`

可以通过自定义`$KAFKA_JMX_OPTS`实现对JMX的配置，默认设置如下：

```txt
-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.rmi.port=$JMX_PORT -Djava.rmi.server.hostname=${JAVA_RMI_SERVER_HOSTNAME:-$HOSTNAME}
```

其中默认的`$JMX_PORT`是`7203`；`$JAVA_RMI_SERVER_HOSTNAME`是`$HOSTNAME`，由容器自动生成。

## docker-compose

一个简单的例子：

``` yaml
version: "3"
services:
    zookeeper:
        image: zookeeper:3.4.10
    kafka:
        image: szyhf/kafka
        ports:
            - "127.0.0.1:9091:9091"
        environment:
            JAVA_RMI_SERVER_HOSTNAME: "kafka"
            KAFKA_BROKER_ID: 110
            KAFKA_ADVERTISED_LISTENERS: "PLAINTEXT://kafka:9091"
            KAFKA_LISTENERS: "PLAINTEXT://kafka:9091"
            KAFKA_ZOOKEEPER_CONNECT: "zookeeper:2181"
	kafka_manager:
        image:
            szyhf/kafka-manager:latest
        ports:
            - 127.0.0.1:19000:9000
        environment:
            ZK_HOSTS: "zookeeper:2181"
```

## volume

### config

配置文件目录为`/kafka/config`，有需要的话可以直接挂载，如果已经挂载了`config/server.properties`文件，则相关的环境变量都会被忽略。

### log

日志目录会受到`server.properties`里边的`log.dir`配置影响，看文档自己挂载……

> 默认路径是`/tmp/kafka-logs`