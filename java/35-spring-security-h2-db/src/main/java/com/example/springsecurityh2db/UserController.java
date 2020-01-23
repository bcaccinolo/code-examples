package com.example.springsecurityh2db;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
public class UserController {

    @GetMapping
    public String hello() {
        return "hello world";
    }
    //public Principal retrievePrincipal(Principal principal) {
    //    return principal;
    //}
}
