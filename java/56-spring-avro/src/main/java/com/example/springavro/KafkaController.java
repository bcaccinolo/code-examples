package com.example.springavro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/user")
public class KafkaController {

    private final Producer producer;

    @Autowired
    KafkaController(Producer producer) {
        this.producer = producer;
    }

    @GetMapping(value = "/publish")
//    public void sendMessageToKafkaTopic(@RequestParam("name") String name, @RequestParam("age") Integer age) {
    public void sendMessageToKafkaTopic() {
        this.producer.sendMessage(new User("benoit", 13));
    }
}