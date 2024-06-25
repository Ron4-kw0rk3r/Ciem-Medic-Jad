package com.ciemmedicjad.ciemmedicjad;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;


public class registrarUsuarioDB {
    private static final String URL = "jdbc:postgresql://localhost:5432/databaseCiem";
    private static final String USER = "postgres";
    private static final String PASSWORD = "toor";
        
    //int usuario_pid = (int) (Math.random() * 12) + 14;

    
    public void saveRegistroDB(String nombre , String apellido, String email, String fono ,String passwordd  ) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD); // Método existente que obtiene la conexión
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO registronewuser ( nombre, apellido, email, telefono, contrasena ) VALUES (?, ?, ?,?,?)")) {
            
            //pstmt.setInt(1, usuario_id);
            pstmt.setString(1, nombre);
            
            pstmt.setString(2, apellido);
            pstmt.setString(3, email);
            pstmt.setString(4, fono);
            pstmt.setString(5, passwordd);
            
            pstmt.executeUpdate();
            System.out.println("Datos de registro correctamente.");
        } catch (SQLException e) {
            System.out.println("Error al guardar datos: " + e.getMessage());
        }
    }
}