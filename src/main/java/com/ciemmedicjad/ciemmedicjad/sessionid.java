package com.ciemmedicjad.ciemmedicjad;

/*import java.security.SecureRandom;*/

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.security.SecureRandom;

@RestController
public class sessionid {

    private static final String seed = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+=<>?";
    private static final int LENGTH = 14;

    @GetMapping("/generate-seed")
    public String generateSeed() {
        return generarSemilla(LENGTH);
    }

    private static String generarSemilla(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(seed.length());
            sb.append(seed.charAt(index));
        }
        return sb.toString();
    }
}


/* 
public class sessionid {
    

    // id list caracteres
    private static final String seed = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+=<>?";

    // Longitud deseada de la semilla
    private static final int LENGTH = 13;

    public static void main(String[] args) {
        String semilla = generarSemilla(LENGTH);
        System.out.println("Semilla generada: " + semilla);
    }

    public static String generarSemilla(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(seed.length());
            sb.append(seed.charAt(index));
        }

        return sb.toString();
    }
}
*/