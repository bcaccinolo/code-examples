package org.qbeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;

import java.util.List;

@SpringBootApplication
public class App 
{

//            -----------------------------------------------------------------
//            Access the Spring Boot application context
//            -----------------------------------------------------------------
    @Autowired
    private ApplicationContext applicationContext;

    public static void main( String[] args )
    {
        SpringApplication.run(App.class, args);
    }

    @Bean
    public CommandLineRunner dumpSomeCode() {
        return (args) -> {
            System.out.println("🔥 coucou le monde");


//            -----------------------------------------------------------------
//            Building a new Application context
//            -----------------------------------------------------------------
//            ApplicationContext applicationContext = new AnnotationConfigApplicationContext(Config.class);


//            -----------------------------------------------------------------
//            Traditional way of doing things
//            -----------------------------------------------------------------
//            Address address = new Address("rue des champs Elysées", "Paris");
//            Company company = new Company("bigCorp", address);

//            -----------------------------------------------------------------
//            Using the Address Bean from the application context
//            -----------------------------------------------------------------
            Company company = applicationContext.getBean(Company.class);
            System.out.println(company);


//            -----------------------------------------------------------------
//            Lister les noms des Beans présents
//            -----------------------------------------------------------------
            String[] beanList = applicationContext.getBeanDefinitionNames();
            for (String beanName : beanList) {
                System.out.println(beanName);
            }

            System.out.println("🔥 coucou le monde");
        };
    }
}
