package com.ciemmedicjad.ciemmedicjad.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import com.ciemmedicjad.ciemmedicjad.modelo.LoginUsuario;
import com.ciemmedicjad.ciemmedicjad.repositorio.LoginUsuarioRepository;
import com.ciemmedicjad.ciemmedicjad.repositorio.FakeLoginUsuarioRepository;
import java.util.Optional;

@Configuration
//@EnableJpaRepositories(basePackages = "com.ciemmedicjad.ciemmedicjad.repositorio")
@EnableJpaRepositories(basePackages = "com.ciemmedicjad.ciemmedicjad.repositorio")
@ComponentScan(basePackages = "com.ciemmedicjad.ciemmedicjad.repositorio")
public class RepositoryConfig {

    
    // Configuration class to enable JPA repositories
    @Bean
    public LoginUsuarioRepository loginUsuarioRepository() {
        return new LoginUsuarioRepository() {
            @Override
            public Optional<LoginUsuario> findByNombreOsemillaAndContrasena(String nombreOsemilla, String contrasena) {
                // Implementación específica
                return Optional.empty(); // Implementación de ejemplo
            }

            @Override
            public LoginUsuario getById(Long id) {
                // Implementación básica
                return new LoginUsuario(); // Asegúrate de devolver una instancia válida de LoginUsuario
            }
        };
    }
    
}

