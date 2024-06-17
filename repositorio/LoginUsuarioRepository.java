package com.ciemmedicjad.ciemmedicjad.repositorio;
//import com.ciemmedicjad.ciemmedicjad.controlador.LoginUsuarioController;
//import com.ciemmedicjad.ciemmedicjad.repositorio.LoginUsuarioRepository;
//import com.ciemmedicjad.ciemmedicjad.repositorio.LoginUsuarioRepository;
import com.ciemmedicjad.ciemmedicjad.modelo.LoginUsuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.ciemmedicjad.ciemmedicjad.repositorio.LoginUsuarioRepository;
//import org.springframework.context.annotation.Bean;
import java.util.Optional;
@Repository

public interface LoginUsuarioRepository extends JpaRepository<LoginUsuario, Long> {
    Optional<LoginUsuario> findByNombreOsemillaAndContrasena(String nombreOsemilla, String contrasena);
// The @Bean annotation and method are not appropriate in an interface. 
// They should be removed to fix the syntax errors.
    
    @Query("SELECT u FROM LoginUsuario u WHERE u.nombreOsemilla = :nombreOsemilla AND u.contrasena = :contrasena")
    Optional<LoginUsuario> buscarPorNombreOsemillaYContrasena(@Param("nombreOsemilla") String nombreOsemilla, @Param("contrasena") String contrasena);


}


