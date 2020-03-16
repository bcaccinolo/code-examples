


# Launch Zookeeper & Kafka

https://hub.docker.com/r/confluent/kafka/


docker run --name kafka -p 9092:9092 --link zookeeper:zookeeper confluent/kafka

# Launch the app

java -cp target/kafka-producer-1.0-SNAPSHOT.jar org.qbeek.App

