package org.qbeek;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;

import java.util.Properties;

public class MyProducer {

    public static void launch() {
        System.out.println("launching the producer");

        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(properties());

        try {
            System.out.println("Sending a record ...");
            RecordMetadata metadata = producer.send(record()).get();
            System.out.println(metadata);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Done");
    }

    private static ProducerRecord<String, String> record() {
        return new ProducerRecord<>("test", "Precision", "France");
    }

    private static Properties properties() {
        Properties properties = new Properties();
        properties.put("bootstrap.servers",
                "localhost:9092");
        properties.put("key.serializer",
                "org.apache.kafka.common.serialization.StringSerializer");
        properties.put("value.serializer",
                "org.apache.kafka.common.serialization.StringSerializer");
        return properties;
    }


}
