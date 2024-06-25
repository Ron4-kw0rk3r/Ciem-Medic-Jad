package com.ciemmedicjad.ciemmedicjad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

public class loginUsuario {
    private static final String URL = "jdbc:postgresql://localhost:5432/databaseCiem";
    private static final String USER = "postgres";
    private static final String PASSWORD = "toor";
        
    //int usuario_pid = (int) (Math.random() * 12) + 14;

    
    public void saveBaseDatos(String nombre , String passwordd, int usuario_id ) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD); // Método existente que obtiene la conexión
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO loginusuario ( nombre_o_semilla, contrasena, usuario_id) VALUES (?, ?, ?)")) {
            
            //pstmt.setInt(1, usuario_id);
            pstmt.setString(1, nombre);
            
            pstmt.setString(2, passwordd);
            pstmt.setInt(3, usuario_id);
            
            pstmt.executeUpdate();
            System.out.println("Datos de login correctamente.");
        } catch (SQLException e) {
            System.out.println("Error al guardar datos: " + e.getMessage());
        }
    }
}