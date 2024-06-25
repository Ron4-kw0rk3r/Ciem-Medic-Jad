

import com.example.repositorio.UsuarioRepositorio;
import com.example.utilidad.EmailValidador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegistroUsuarioServicio {

    @Autowired
    private UsuarioRepositorio usuarioRepositorio;

    @Autowired
    private EmailValidador emailValidador;

    public String registrarUsuario(String nombre, String email, String contraseña, String confirmarContraseña) {
        if (nombre == null || email == null || contraseña == null || confirmarContraseña == null) {
            throw new IllegalArgumentException("Todos los campos son obligatorios");
        }
        if (!contraseña.equals(confirmarContraseña)) {
            throw new IllegalArgumentException("Las contraseñas no coinciden");
        }
        if (contraseña.length() < 8) {
            throw new IllegalArgumentException("La contraseña debe tener al menos 8 caracteres");
        }
        if (!emailValidador.esEmailValido(email)) {
            throw new IllegalArgumentException("El correo electrónico no es válido");
        }
        if (usuarioRepositorio.existePorEmail(email)) {
            throw new IllegalArgumentException("El correo electrónico ya está registrado");
        }

        usuarioRepositorio.insertarUsuario(nombre, email, contraseña);
        return "Usuario registrado exitosamente";
    }
}