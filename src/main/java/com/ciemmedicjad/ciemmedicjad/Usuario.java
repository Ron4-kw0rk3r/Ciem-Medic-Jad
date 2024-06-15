package com.ciemmedicjad.ciemmedicjad;
import javax.persistence.*;



@Entity
@Table(name = "Usuarios")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long usuario_id;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "email")
    private String email;

    // Constructor, getters y setters
    public Usuario() {}

    public Long getUsuarioId() {
        return usuario_id;
    }

    public void setUsuarioId(Long usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}