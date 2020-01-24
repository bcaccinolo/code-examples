package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class PwdEncoder {

    @Autowired
    PasswordEncoder passwordEncoder;

    ArrayList<String> pwdList = new ArrayList<>();

    public void call() {
        pwdList.add("123456");
        pwdList.add("12345678");
        pwdList.add("qwerty");
        pwdList.add("abc123");
        pwdList.add("monkey");
        pwdList.add("1234567");
        pwdList.add("letmein");

        pwdList.forEach(pwd -> System.out.println(pwd + " => bencrypt => " + passwordEncoder.encode(pwd)) );
     }

    @Bean
    public PasswordEncoder getPwdEncoder() {
        return new BCryptPasswordEncoder(11);
    }

}
