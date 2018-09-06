FROM openjdk:8-jre-alpine as base

ARG KAFKA_VERSION=2.0.0
ARG SCALA_VERSION=2.12

RUN apk add --no-cache bash && \
    mkdir -p /opt/kafka && \
    wget -q -O - http://www.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz | tar zxv -C /opt/kafka --strip-components 1 && \
    sed -i'' -e 's/localhost:2181/zookeeper:2181/g; s/localhost:9092/kafka:9092/g; s/#plugin.path=/plugin.path=\/opt\/kafka\/plugins/g' /opt/kafka/config/*.properties

ADD bin/* /opt/kafka/bin/
WORKDIR /opt/kafka

FROM base as kafka
VOLUME /tmp/kafka-logs
EXPOSE 9092
CMD ["sh", "bin/kafka-server-start.sh", "config/server.properties"]

FROM base as kafka-zookeeper
VOLUME /tmp/zookeeper
EXPOSE 2181
CMD ["bin/zookeeper-server-start.sh", "config/zookeeper.properties"]

FROM base as kafka-connect
EXPOSE 8083
CMD ["bin/connect-distributed.sh", "config/connect-distributed.properties"]
