
import com.example.servicio.RegistroUsuarioServicio;
import com.example.repositorio.UsuarioRepositorio;
import com.example.utilidad.EmailValidador;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

public class RegistroUsuarioServicioPruebas {

    @InjectMocks
    private RegistroUsuarioServicio registroUsuarioServicio;

    @Mock
    private UsuarioRepositorio usuarioRepositorio;

    @Mock
    private EmailValidador emailValidador;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void pruebaCamposObligatorios() {
        Exception exception = assertThrows(IllegalArgumentException.class, () -> {
            registroUsuarioServicio.registrarUsuario(null, "ronaldo@example.com", "password123", "password123");
        });
        assertEquals("Todos los campos son obligatorios", exception.getMessage());
    }

    @Test
    public void pruebaContraseñasNoCoinciden() {
        Exception exception = assertThrows(IllegalArgumentException.class, () -> {
            registroUsuarioServicio.registrarUsuario("Ronaldo", "ronaldo@example.com", "password123", "password321");
        });
        assertEquals("Las contraseñas no coinciden", exception.getMessage());
    }

    @Test
    public void pruebaContraseñaCorta() {
        Exception exception = assertThrows(IllegalArgumentException.class, () -> {
            registroUsuarioServicio.registrarUsuario("Ronaldo", "ronaldo@example.com", "pass", "pass");
        });
        assertEquals("La contraseña debe tener al menos 8 caracteres", exception.getMessage());
    }

    @Test
    public void pruebaEmailNoValido() {
        when(emailValidador.esEmailValido("ronaldo@com")).thenReturn(false);
        Exception exception = assertThrows(IllegalArgumentException.class, () -> {
            registroUsuarioServicio.registrarUsuario("Ronaldo", "ronaldo@com", "password123", "password123");
        });
        assertEquals("El correo electrónico no es válido", exception.getMessage());
    }

    @Test
    public void pruebaUsuarioYaRegistrado() {
        when(emailValidador.esEmailValido("ronaldo@example.com")).thenReturn(true);
        when(usuarioRepositorio.existePorEmail("ronaldo@example.com")).thenReturn(true);
        Exception exception = assertThrows(IllegalArgumentException.class, () -> {
            registroUsuarioServicio.registrarUsuario("Ronaldo", "ronaldo@example.com", "password123", "password123");
        });
        assertEquals("El correo electrónico ya está registrado", exception.getMessage());
    }

    @Test
    public void pruebaRegistroExitoso() {
        when(emailValidador.esEmailValido("ronaldo@example.com")).thenReturn(true);
        when(usuarioRepositorio.existePorEmail("ronaldo@example.com")).thenReturn(false);
        String resultado = registroUsuarioServicio.registrarUsuario("Ronaldo", "ronaldo@example.com", "password123", "password123");
        assertEquals("Usuario registrado exitosamente", resultado);
    }
}