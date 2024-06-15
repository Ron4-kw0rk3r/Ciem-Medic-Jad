package com.ciemmedicjad.ciemmedicjad.repositorio;
//import com.ciemmedicjad.ciemmedicjad.controlador.LoginUsuarioController;
//import com.ciemmedicjad.ciemmedicjad.repositorio.LoginUsuarioRepository;
import com.ciemmedicjad.ciemmedicjad.repositorio.LoginUsuarioRepository;
import com.ciemmedicjad.ciemmedicjad.modelo.LoginUsuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface LoginUsuarioRepository extends JpaRepository<LoginUsuario, Long> {
    Optional<LoginUsuario> findByNombreOsemillaAndContrasena(String nombreOsemilla, String contrasena);
}