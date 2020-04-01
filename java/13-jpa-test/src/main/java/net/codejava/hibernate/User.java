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

    // Create a UNICITY constraint
    @Column(unique = true)
    private String email;

    private String password;
}