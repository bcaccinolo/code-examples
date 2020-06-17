package net.codejava.hibernate;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;

@Entity
@Table(name = "users")
@Data
@SuperBuilder
@NoArgsConstructor
@ToString(callSuper = true)
public class User extends BaseEntity {

    private String fullname;

    private String email;

    private String password;
}