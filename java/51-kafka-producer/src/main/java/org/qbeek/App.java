package org.qbeek;

import org.apache.kafka.clients.Metadata;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;

import java.util.Properties;

public class App {

    // instantiate a producer
    private static Properties kafkaProps = new Properties();
    // creation of a Producer Record
    static ProducerRecord<String, String> record = new ProducerRecord<>("test", "Precision", "France");

    public static void main(String[] args) {
        System.out.println("Hello World!");

        kafkaProps.put("bootstrap.servers", "localhost:9092");
        kafkaProps.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        kafkaProps.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");

        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(kafkaProps);

        try {
            System.out.println("Sending a record ...");
            RecordMetadata metadata = producer.send(record).get();
            System.out.println(metadata);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Done");


    }
}
