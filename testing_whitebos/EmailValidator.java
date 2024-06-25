import org.springframework.stereotype.Component;
import java.util.regex.Pattern;

@Component
public class EmailValidador {

    private static final Pattern EMAIL_REGEX = Pattern.compile("^[A-Za-z0-9+_.-]+@(.+)$");

    public boolean esEmailValido(String email) {
        return EMAIL_REGEX.matcher(email).matches();
    }
}