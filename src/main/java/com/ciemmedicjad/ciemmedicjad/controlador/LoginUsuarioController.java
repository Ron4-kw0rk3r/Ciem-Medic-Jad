package com.ciemmedicjad.ciemmedicjad.controlador;


// Removed import to resolve conflict with type defined in the same file
//import com.ciemmedicjad.ciemmedicjad.repositorio.LoginUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.ciemmedicjad.ciemmedicjad.modelo.LoginUsuario;
import org.springframework.stereotype.Repository;
//import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.jpa.repository.JpaRepository;

import com.ciemmedicjad.ciemmedicjad.controlador.LoginUsuarioRepository;

import java.util.Optional;

@RestController
@RequestMapping("/api")
class LoginUsuarioController {

    @Autowired
    private LoginUsuarioRepository loginUsuarioRepository;

    @PostMapping("/login")
    public ResponseEntity<?> loginUser(@RequestBody LoginUsuario loginRequest) {
        Optional<LoginUsuario> loginUsuario = loginUsuarioRepository.findByNombreOsemillaAndContrasena(
                loginRequest.getNombreOsemilla(), loginRequest.getContrasena());

        if (loginUsuario.isPresent()) {
            return ResponseEntity.ok().body("Usuario autenticado con éxito.");
        } else {
            return ResponseEntity.status(401).body("Error de autenticación: Credenciales incorrectas.");
        }
    }
}

@Repository
interface LoginUsuarioRepository extends JpaRepository<LoginUsuario, Long> {
    Optional<LoginUsuario> findByNombreOsemillaAndContrasena(String nombreOsemilla, String contrasena);
}

