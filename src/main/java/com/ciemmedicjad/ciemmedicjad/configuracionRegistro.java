package com.ciemmedicjad.ciemmedicjad;
// Start of Selection

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class configuracionRegistro {

    @PostMapping("/submit-registro")
    public ResponseEntity<String> registro(@RequestBody RegistroRequest registroRequest) {
        try {
            registrarUsuarioDB registro = new registrarUsuarioDB();
            System.out.println("Intento de registro con nombre: " + registroRequest.getNombre() + ", apellido: " + registroRequest.getApellido() + " y email: " + registroRequest.getEmail());
            registro.saveRegistroDB(registroRequest.getNombre(), registroRequest.getApellido(), registroRequest.getEmail(), registroRequest.getTelefono(), registroRequest.getPassword());
            return ResponseEntity.ok("Registro exitoso");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error en el proceso de registro");
        }
    }
}

class RegistroRequest {
    private String nombre;
    private String apellido;
    private String email;
    private String telefono;
    private String password;

    public RegistroRequest() {}

    public RegistroRequest(String nombre, String apellido, String email, String telefono, String password) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}