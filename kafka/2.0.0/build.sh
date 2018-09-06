#!/bin/bash

KAFKA_VERSION=${KAFKA_VERSION:-2.0.0}
SCALA_VERSION=${SCALA_VERSION:-2.12}

cd $(dirname $0)
BUILD_OPTS="--build-arg KAFKA_VERSION=$KAFKA_VERSION --build-arg SCALA_VERSION=$SCALA_VERSION"
docker build $BUILD_OPTS --target kafka --tag jh12z/kafka:$KAFKA_VERSION .
docker build $BUILD_OPTS --target kafka-zookeeper --tag jh12z/kafka-zookeeper:$KAFKA_VERSION .
docker build $BUILD_OPTS --target kafka-connect --tag jh12z/kafka-connect:$KAFKA_VERSION .
