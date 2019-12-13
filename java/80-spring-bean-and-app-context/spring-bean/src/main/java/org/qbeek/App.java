package org.qbeek;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class App 
{
    public static void main( String[] args )
    {
        SpringApplication.run(App.class, args);
    }

    @Bean
    public CommandLineRunner dumpSomeCode() {
        return (args) -> {
            System.out.println("🔥 coucou le monde");

            ApplicationContext applicationContext = new AnnotationConfigApplicationContext(Config.class);

            Company company = applicationContext.getBean("company", Company.class);

//            Address address = new Address("rue des champs Elysées", "Paris");
////            Company company = new Company("bigCorp", address);
            System.out.println(company);

            System.out.println("🔥 coucou le monde");
        };
    }
}
