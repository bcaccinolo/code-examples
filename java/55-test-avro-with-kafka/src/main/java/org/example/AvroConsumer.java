package org.example;

import io.confluent.kafka.serializers.AbstractKafkaAvroSerDeConfig;
import io.confluent.kafka.serializers.KafkaAvroDeserializer;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.time.Duration;
import java.util.Collections;
import java.util.Properties;

public class AvroConsumer {

    static void call() {

        Properties properties = new Properties();
        properties.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        properties.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        properties.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, KafkaAvroDeserializer.class);
        properties.put(ConsumerConfig.GROUP_ID_CONFIG, "group-avro");
        properties.put(AbstractKafkaAvroSerDeConfig.SCHEMA_REGISTRY_URL_CONFIG, "http://127.0.0.1:8081");

        KafkaConsumer<String, Customer> kafkaConsumer = new KafkaConsumer<String, Customer>(properties);
        kafkaConsumer.subscribe(Collections.singleton("topic-avro"));

        while (true) {
            Duration timeout = Duration.ofMillis(100);
            ConsumerRecords<String, Customer> consumerRecords = kafkaConsumer.poll(timeout);

            for(ConsumerRecord<String, Customer> record : consumerRecords) {
                System.out.println(record.toString());
            }
        }

    }

}
