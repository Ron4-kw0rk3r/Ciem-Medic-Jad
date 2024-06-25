package com.ciemmedicjad.ciemmedicjad;

import java.util.Collections;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
//import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.context.annotation.ComponentScan;

import javax.servlet.http.HttpServletResponse;


@SpringBootApplication
@ComponentScan(basePackages = "com.ciemmedicjad.ciemmedicjad")
@EntityScan(basePackages = "com.ciemmedicjad.ciemmedicjad.modelo")
//@EnableJpaRepositories(basePackages = "com.ciemmedicjad.ciemmedicjad.repositorio")
// No es necesario habilitar el controlador en este punto





public class CiemmedicjadApplication {
	// se configuro ya que el puerto por default esta ocupado llevandolo al 8081 por ahora 
	public static void main(String[] args) {
		SpringApplication app = new SpringApplication(CiemmedicjadApplication.class);
		app.setDefaultProperties(Collections.singletonMap("server.port", "8081"));
        app.run(args);
	}


    // apiview
	// se configuro para que al iniciar la aplicacion se redireccione a la pagina index.html
	// aca comienza todo 
	@Bean
    public WebMvcConfigurer forwardToIndex() {
        return new WebMvcConfigurer() {
            @Override
            public void addViewControllers(ViewControllerRegistry registry) {
                registry.addViewController("/").setViewName("forward:/index.html");
            }
        };
    }

    public void handleRequest(HttpServletResponse response) {
        response.setStatus(HttpServletResponse.SC_FOUND); // 302 redirect
        response.setHeader("Location", "/loginv.html");
    }

}
