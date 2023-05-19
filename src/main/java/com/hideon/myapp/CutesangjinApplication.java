package com.hideon.myapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class CutesangjinApplication {

	public static void main(String[] args) {
		SpringApplication.run(CutesangjinApplication.class, args);
	}

}
