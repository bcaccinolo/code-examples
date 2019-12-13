package org.qbeek;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan
public class Config {

    @Bean
    public Address getAddress() {
        return new Address("la rue de haut", "Paris");
    }
}
