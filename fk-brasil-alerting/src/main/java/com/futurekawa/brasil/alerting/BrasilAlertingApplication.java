package com.futurekawa.brasil.alerting;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.futurekawa"})
public class BrasilAlertingApplication {
    public static void main(String[] args) {
        SpringApplication.run(BrasilAlertingApplication.class, args);
    }
}
