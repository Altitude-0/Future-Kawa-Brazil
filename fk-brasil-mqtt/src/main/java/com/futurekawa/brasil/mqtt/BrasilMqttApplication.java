package com.futurekawa.brasil.mqtt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.futurekawa"})
public class BrasilMqttApplication {
    public static void main(String[] args) {
        SpringApplication.run(BrasilMqttApplication.class, args);
    }
}
