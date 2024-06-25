package com.ciemmedicjad.ciemmedicjad;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
// import org.springframework.stereotype.Controller;
/// import org.springframework.ui.Model;
//import com.ciemmedicjad.ciemmedicjad.AddDataDB;

@RestController
public class configuracionesController {

    @PostMapping("/addData")
    public ResponseEntity<String> addData(@RequestBody AddDataRequest requestData) {
        try {
            guardarEnBDeDatos guardarDatos = new guardarEnBDeDatos();
            System.out.println("Guardando: " + requestData.getMotor_busqueda() + ", " + requestData.getNombreperfil() + ", " + requestData.getImgperfil() + ", " + requestData.isNotificaciones() + ", " + requestData.getTipodeseleccion());
            guardarDatos.saveBaseDatos(requestData.getMotor_busqueda(), requestData.getNombreperfil(), requestData.getImgperfil(), requestData.isNotificaciones(), requestData.getTipodeseleccion());
            return ResponseEntity.ok("Datos enviados correctamente");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al enviar los datos");
        }
    }
}


class AddDataRequest {
    //private int usuario_id;
    private String motor_busqueda;
    private String nombreperfil;
    private String imgperfil;
    private boolean notificaciones;
    private String tipodeseleccion;

    public AddDataRequest() {}

    // Constructor con todos los parámetros
    public AddDataRequest( String motor_busqueda, String nombreperfil, String imgperfil, boolean notificaciones, String tipodeseleccion) {
        //this.usuario_id = usuario_id;
        this.motor_busqueda = motor_busqueda;
        this.nombreperfil = nombreperfil;
        this.imgperfil = imgperfil;
        this.notificaciones = notificaciones;
        this.tipodeseleccion = tipodeseleccion;
        System.out.println("Constructor called with: " + motor_busqueda + ", " + nombreperfil + ", " + imgperfil + ", " + notificaciones + ", " + tipodeseleccion);
    }

    // Getters and Setters
    // Getters
    /*public int getUsuario_id() {
        return usuario_id;
    }*/

    public String getMotor_busqueda() {
        return motor_busqueda;
    }

    public String getNombreperfil() {
        return nombreperfil;
    }

    public String getImgperfil() {
        return imgperfil;
    }

    public boolean isNotificaciones() {
        return notificaciones;
    }

    public String getTipodeseleccion() {
        return tipodeseleccion;
    }

    // Setters
    /*public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }*/

    public void setMotor_busqueda(String motor_busqueda) {
        this.motor_busqueda = motor_busqueda;
    }

    public void setNombreperfil(String nombreperfil) {
        this.nombreperfil = nombreperfil;
    }

    public void setImgperfil(String imgperfil) {
        this.imgperfil = imgperfil;
    }

    public void setNotificaciones(boolean notificaciones) {
        this.notificaciones = notificaciones;
    }

    public void setTipodeseleccion(String tipodeseleccion) {
        this.tipodeseleccion = tipodeseleccion;
    }
}
