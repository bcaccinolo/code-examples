package net.codejava.hibernate;

import lombok.Data;

import javax.persistence.*;

/**
 * User.java
 * Copyright by CodeJava.net
 */
@Entity
@Table(name = "users")
@Data
public class User {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Integer id;

    private String fullname;
    private String email;
    private String password;
    private String coucou;
}