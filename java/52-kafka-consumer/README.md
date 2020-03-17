
Here we have a Kafka consumer reading the topic 'test'.

# Launch Zookeeper & Kafka

cd /home/benoit/dev/kafka_2.12-2.4.1

### Zookeeper
bin/zookeeper-server-start.sh config/zookeeper.properties

### Kafka
bin/kafka-server-start.sh config/server.properties

### Create a topic 
bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test

### Producer
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test

### Consumer 
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning

# Launch the app

java -cp target/kafka-producer-1.0-SNAPSHOT.jar org.qbeek.App
