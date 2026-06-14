package com.futurekawa.brasil.core;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(scanBasePackages = {"com.futurekawa"})
@EntityScan(basePackages = {"com.futurekawa.entity"})
@EnableJpaRepositories(basePackages = {"com.futurekawa.repository"})
public class BrasilCoreApplication {
    public static void main(String[] args) {
        SpringApplication.run(BrasilCoreApplication.class, args);
    }
}
