package com.ciemmedicjad.ciemmedicjad;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class configuracionLogin {

    @PostMapping("/submit-login")
    public ResponseEntity<String> login(@RequestBody LoginRequest loginRequest) {
        try {
            loginUsuario login = new loginUsuario();
            System.out.println("Intento de login con usuario: " + loginRequest.getNombre() + " y contraseña: [PROTECTED]");
            login.saveBaseDatos(loginRequest.getNombre(), loginRequest.getPassword(), loginRequest.getUsuarioId());
            return ResponseEntity.ok("Login exitoso");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error en el proceso de login");
        }
    }
}

class LoginRequest {
    private String nombre;
    private String password;
    private int usuarioId;

    public LoginRequest() {}

    public LoginRequest(String nombre, String password, int usuarioId) {
        this.nombre = nombre;
        this.password = password;
        this.usuarioId = usuarioId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }
}