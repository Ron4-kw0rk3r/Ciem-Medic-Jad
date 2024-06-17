package com.ciemmedicjad.ciemmedicjad;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;

@CrossOrigin // Ajusta según sea necesario

@RestController
public class UsuarioController {

    @PostMapping("/registrousuario")
    public ResponseEntity<?> registrarUsuario(@ModelAttribute Usuario usuario) {
        // Aquí implementarías la lógica para procesar los datos del usuario
        // Por ejemplo, guardar los datos en una base de datos

        // Simulando una respuesta exitosa
        return ResponseEntity.ok().body("{\"success\": true}");
    }
}