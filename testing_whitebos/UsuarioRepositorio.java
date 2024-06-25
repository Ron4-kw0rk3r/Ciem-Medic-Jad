
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioRepositorio {

    public boolean existePorEmail(String email) {
        // Lógica para verificar si el usuario existe en la base de datos
        return false; // Simulación
    }

    public void insertarUsuario(String nombre, String email, String contraseña) {
        // Lógica para insertar el usuario en la base de datos
    }
}