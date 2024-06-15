package com.ciemmedicjad.ciemmedicjad.modelo;


import javax.persistence.*;

import com.ciemmedicjad.ciemmedicjad.Usuario;
// The import statement is removed to fix the conflict


import javax.persistence.Entity;
import javax.persistence.Id;




@Table(name = "LoginUsuario")
@Entity
public class LoginUsuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long login_id;

    @Column(name = "nombre_o_semilla", nullable = false)
    private String nombreOsemilla;

    @Column(name = "contrasena", nullable = false)
    private String contrasena;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    public LoginUsuario() {}

    public LoginUsuario(String nombreOsemilla, String contrasena, Usuario usuario) {
        this.nombreOsemilla = nombreOsemilla;
        this.contrasena = contrasena;
        this.usuario = usuario;
    }

    public Long getLoginId() {
        return login_id;
    }

    public void setLoginId(Long login_id) {
        this.login_id = login_id;
    }

    public String getNombreOsemilla() {
        return nombreOsemilla;
    }

    public void setNombreOsemilla(String nombreOsemilla) {
        this.nombreOsemilla = nombreOsemilla;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
}
