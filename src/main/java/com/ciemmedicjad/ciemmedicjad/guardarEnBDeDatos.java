package com.ciemmedicjad.ciemmedicjad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

public class guardarEnBDeDatos {
    private static final String URL = "jdbc:postgresql://localhost:5432/databaseCiem";
    private static final String USER = "postgres";
    private static final String PASSWORD = "toor";
        
    int usuario_pid = (int) (Math.random() * 12) + 14;

    
    public void saveBaseDatos(String motorbusq , String nombreperfil , String imgperfil , boolean notificaciones , String tipodeseleccion) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD); // Método existente que obtiene la conexión
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO cfgseedUsuario (  motor_busqueda, nombreperfil ,  imgperfil, notificaciones, tipodeseleccion) VALUES (?, ?, ?, ?, ?)")) {
            
            //pstmt.setInt(1, usuario_id);
            pstmt.setString(1, motorbusq);
            
            pstmt.setString(2, nombreperfil);
            pstmt.setString(3, imgperfil);
            pstmt.setBoolean(4, notificaciones);
            pstmt.setString(5, tipodeseleccion);
            pstmt.executeUpdate();
            System.out.println("Datos guardados saveeeeeeev  correctamente.");
        } catch (SQLException e) {
            System.out.println("Error al guardar datos: " + e.getMessage());
        }
    }
}