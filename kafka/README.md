# Kafka

Apache Kafka: A Distributed Streaming Platform.

## Usage

To start the containers:
```
docker-compose up -d
```

## Example docker-compose.yml

```
version: "3"

services:
    zookeeper:
        image: jh12z/kafka-zookeeper
        ports:
            - 2181:2181
        volumes:
            - zookeeper_data:/tmp/zookeeper

    kafka:
        image: jh12z/kafka
        ports:
            - 9092:9092
        volumes:
            - kafka_data:/tmp/kafka-logs
    
    kafka-connect:
        image: jh12z/kafka-connect
        ports:
            - 8083:8083
    
volumes:
    kafka_data:
    zookeeper_data:
```

## kafka-connect

To add additional connector plugins, add a volume mapping like the one below.

```
kafka-connect:
    image: jh12z/kafka-connect
    ports:
        - 8083:8083
    volumes:
        - ./plugins:/opt/kafka/plugins
```

You can deploy plugins either bundled as fat-jars or in directories:

```
plugins
├─ plugin1-fat.jar
└─ plugin2
   ├─ kafka-custom-connector.jar
   ├─ dep1.jar
   ├─ dep2.jar
```
