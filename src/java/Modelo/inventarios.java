/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;



/**
 *
 * @author edwar
 */
public class inventarios {
    
    int idProductos;
    String nombreProductos;
    int cantiadProductos;
    String estatusProductos;
    int idUsuario;
    String nombre;
    
    public inventarios(){
        
    }
    
    public inventarios(int idProductos, String nombreProductos, int cantidadProductos, String estatusProductos, int idUsuarios,  String nombre){
        this.idProductos=idProductos;
        this.nombreProductos=nombreProductos;
        this.cantiadProductos=cantidadProductos;
        this.estatusProductos=estatusProductos;
        this.idUsuario=idUsuarios;
        this.nombre=nombre;
    }

    public int getIdProductos() {
        return idProductos;
    }

    public void setIdProductos(int idProductos) {
        this.idProductos = idProductos;
    }

    public String getNombreProductos() {
        return nombreProductos;
    }

    public void setNombreProductos(String nombreProductos) {
        this.nombreProductos = nombreProductos;
    }

    public int getCantiadProductos() {
        return cantiadProductos;
    }

    public void setCantiadProductos(int cantiadProductos) {
        this.cantiadProductos = cantiadProductos;
    }

    public String getEstatusProductos() {
        return estatusProductos;
    }

    public void setEstatusProductos(String estatusProductos) {
        this.estatusProductos = estatusProductos;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
