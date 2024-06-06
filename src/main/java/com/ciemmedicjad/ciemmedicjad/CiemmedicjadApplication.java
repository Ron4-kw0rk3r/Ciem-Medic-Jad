package com.ciemmedicjad.ciemmedicjad;

import java.util.Collections;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
@EntityScan(basePackages = "com.ciemmedicjad.ciemmedicjad.modelo")
public class CiemmedicjadApplication {
	// se configuro ya que el puerto por default esta ocupado llevandolo al 8081 por ahora 
	public static void main(String[] args) {
		SpringApplication app = new SpringApplication(CiemmedicjadApplication.class);
		app.setDefaultProperties(Collections.singletonMap("server.port", "8081"));
        app.run(args);
	}

	@Bean
    public WebMvcConfigurer forwardToIndex() {
        return new WebMvcConfigurer() {
            @Override
            public void addViewControllers(ViewControllerRegistry registry) {
                registry.addViewController("/").setViewName("forward:/index.html");
            }
        };
    }

}
