package org.example;

public class App {

    public static void main(String[] args) {
        System.out.println("hello");

        AvroProducer.call();
        AvroProducer.call();
        AvroProducer.call();
        AvroProducer.call();
        AvroProducer.call();
        AvroConsumer.call();
    }

}
