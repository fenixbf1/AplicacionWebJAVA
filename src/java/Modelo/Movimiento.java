/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Timestamp;

/**
 *
 * @author edwar
 */
public class Movimiento {
    int idHistorico;
    String tipodemovimiento;
    int idUsuario;
    int idProductos;
    int cantidad;
    Timestamp fecha;
    String nombre;
    String nombreProductos;
    
    public Movimiento() {
    }

    public Movimiento(int idHistorico, String tipodemovimiento, int idUsuario, int idProductos, int cantidad, Timestamp fecha, String nombre, String nombreProductos) {
        this.idHistorico = idHistorico;
        this.tipodemovimiento = tipodemovimiento;
        this.idUsuario = idUsuario;
        this.idProductos = idProductos;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.nombre = nombre;
        this.nombreProductos = nombreProductos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombreProductos() {
        return nombreProductos;
    }

    public void setNombreProductos(String nombreProductos) {
        this.nombreProductos = nombreProductos;
    }

    

    public int getIdHistorico() {
        return idHistorico;
    }

    public void setIdHistorico(int idHistorico) {
        this.idHistorico = idHistorico;
    }

    public String getTipodemovimiento() {
        return tipodemovimiento;
    }

    public void setTipodemovimiento(String tipodemovimiento) {
        this.tipodemovimiento = tipodemovimiento;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdProductos() {
        return idProductos;
    }

    public void setIdProductos(int idProductos) {
        this.idProductos = idProductos;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }
    

   
    
}
