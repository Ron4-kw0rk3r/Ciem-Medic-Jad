package com.ciemmedicjad.ciemmedicjad;


import com.ciemmedicjad.ciemmedicjad.modelo.Usuarios;
import java.util.List;

public interface UsuarioInterfa {
    List<Usuarios> findAll();
    Usuarios findById(Long id);
    Usuarios save(Usuarios usuario);
    void deleteById(Long id);
}
