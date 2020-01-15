package net.codejava.hibernate;

import javax.persistence.*;

/**
 * User.java
 * Copyright by CodeJava.net
 */
@Entity
@Table(name = "users")
public class User {

    @Column(name = "USER_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id private Integer id;

    private String fullname;
    private String email;
    private String password;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}