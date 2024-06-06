package com.ciemmedicjad.ciemmedicjad;

import java.util.Collections;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
@SpringBootApplication
@EntityScan(basePackages = "com.ciemmedicjad.ciemmedicjad.modelo")
public class CiemmedicjadApplication {
	// se configuro ya que el puerto por default esta ocupado llevandolo al 8081 por ahora 
	public static void main(String[] args) {
		SpringApplication app = new SpringApplication(CiemmedicjadApplication.class);
		app.setDefaultProperties(Collections.singletonMap("server.port", "8081"));
        app.run(args);
	}

}
