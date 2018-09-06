#!/bin/bash

KAFKA_VERSION=${KAFKA_VERSION:-2.0.0}

docker image tag jh12z/kafka:$KAFKA_VERSION jh12z/kafka:latest
docker image tag jh12z/kafka-zookeeper:$KAFKA_VERSION jh12z/kafka-zookeeper:latest
docker image tag jh12z/kafka-connect:$KAFKA_VERSION jh12z/kafka-connect:latest
