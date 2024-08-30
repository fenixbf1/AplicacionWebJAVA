/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

/**
 *
 * @author edwar
 */
/**
 Se crea la coneccion con la base de datos MySQL
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection con;
    /*con el conector se ingresa a la base de datos a utilizar*/
    String url="jdbc:mysql://localhost:3306/temp01";
    String user="root";
    String pass="";
    public Connection Conexion(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection(url,user,pass);
            System.out.println(con);
        } catch (Exception e){
            System.out.println(con);
        }
        System.out.println(con);
        return con;
    }
}
