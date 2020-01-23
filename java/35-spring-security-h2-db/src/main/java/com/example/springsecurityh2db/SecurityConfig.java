package com.example.springsecurityh2db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;

@Configuration
//@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    // Désactivation de la sécurité pour voir si cela permet d'accéder à la console H2.

    @Autowired
    private DataSource dataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
                .withDefaultSchema()
                .dataSource(dataSource)
                .withUser(User.withUsername("benoit").password("root").roles("USER"));
    }

    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.authorizeRequests()
                //.antMatchers("/h2-console/**")
                //.permitAll()
                .anyRequest()
                .permitAll();
                //.authenticated()
                //.and()
                //.formLogin();

        httpSecurity.csrf()
                .ignoringAntMatchers("/h2-console/**");

        httpSecurity.headers()
                .frameOptions()
                .sameOrigin();
    }
}
