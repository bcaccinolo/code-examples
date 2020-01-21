package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestHelloController {

    @GetMapping("/rest-hello")
    public String hello() {
        return "Hello from Rest controller (no template, just plain String).";
    }
}
