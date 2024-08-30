/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Movimiento;
import Modelo.inventarios;
import Modelo.inventariosDB;
import Modelo.usuarios;
import Modelo.usuariosDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.Timestamp;
import java.util.List;

/**
 *
 * @author edwar
 */
public class Controlador extends HttpServlet {

    
    inventarios in=new inventarios();
    inventariosDB inDB=new inventariosDB();
    int idpro;
    int ban = 0;
    int baj = 0;
    inventarios insalida=new inventarios();
    inventariosDB inDBsalida=new inventariosDB();
    int idprosalida;
    int bansalida = 0;
    int bajsalida = 0;
    Movimiento movimiento = new Movimiento();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            
            throws ServletException, IOException {
            
            String menu=request.getParameter("menu");
            String accion=request.getParameter("accion");
            if(menu.equals("Principal")){
                request.getRequestDispatcher("Principal.jsp").forward(request, response);
            }
             if(menu.equals("Historial")){
                
                switch (accion){
                    case "ListarH":
                        List lista=inDB.listarhistorial();
                        
                        request.setAttribute("historial", lista);
                        
                    
                }
                
                request.getRequestDispatcher("Historial.jsp").forward(request, response);
            }
            if(menu.equals("Inventario")){
                
                switch (accion){
                    case "Listar":
                        List lista=inDB.listar();
                        
                        request.setAttribute("productos", lista);
                        boolean campoVisible = true;
                        boolean campoVisible2 = false;
                        boolean campoVisibleBaja2 = false;
                        if (ban == 1) {
                            campoVisible = false;
                            campoVisible2 = true;
                        } else if (baj == 1) {
                            campoVisible = false;
                            campoVisibleBaja2 = true;
                        }

                        ban = 0;
                        baj = 0;

                        request.getSession().setAttribute("campoVisible", campoVisible);
                        request.getSession().setAttribute("campoVisible2", campoVisible2);
                        request.getSession().setAttribute("campoVisibleBaja2", campoVisibleBaja2);
                        
                        break;
                    case "Agregar":
                        in = new inventarios();
                        String nombreProductos=request.getParameter("txtnombreProductos");
                        String estatusProductos=request.getParameter("txtestatusProductos");
                        
                        int CantiadProductos = 0;
                        HttpSession session = request.getSession();
                        int idUsuario = (int) session.getAttribute("idUsuario");
                        in.setNombreProductos(nombreProductos);
                        in.setCantiadProductos(CantiadProductos);
                        in.setEstatusProductos(estatusProductos);
                        in.setIdUsuario(idUsuario);
                        inDB.agregar(in);
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar").forward(request, response);
                        
                        break;
                    case "Entrada de producto":
                        int cantidadActual = Integer.parseInt(request.getParameter("txtcantidadActual"));
                        int cantidadIngresada = Integer.parseInt(request.getParameter("txtcantidadProductos"));
                        
                        if (cantidadIngresada < cantidadActual) {
                            
                            request.setAttribute("error", "La cantidad ingresada no puede ser menor que la cantidad existente.");
                            
                            request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar").forward(request, response);
                        } else {
                            String nombreProductos1=request.getParameter("txtnombreProductos");
                            String estatusProductos1=request.getParameter("txtestatusProductosA");
                            String cantidadproductos1=request.getParameter("txtcantidadProductos");
                            int CantiadProductos1 = 0;
                            CantiadProductos1 = Integer.parseInt(cantidadproductos1);

                            HttpSession session1 = request.getSession();

                            int idUsuario1 = (int) session1.getAttribute("idUsuario");
                            in.setNombreProductos(nombreProductos1);
                            in.setCantiadProductos(CantiadProductos1);
                            in.setEstatusProductos(estatusProductos1);
                            in.setIdUsuario(idUsuario1);
                            in.setIdProductos(idpro);
                            inDB.entradas(in);
                            
                            movimiento.setIdProductos(idpro);
                            movimiento.setTipodemovimiento("Entrada");
                            movimiento.setIdUsuario(idUsuario1);
                            
                            movimiento.setCantidad(CantiadProductos1);
                            inDB.registrarMovimiento(movimiento);
                            
                            
                            request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar").forward(request, response);
                        }
                        
                        
                        
                        
                        break;
                    case "Estatus de producto":
                        
                            String nombreProductos1=request.getParameter("txtnombreProductos");
                            String estatusProductos1=request.getParameter("txtestatusProductosBaja");
                            String cantidadproductos1=request.getParameter("txtcantidadActualBaja");
                            int CantiadProductos1 = 0;
                            CantiadProductos1 = Integer.parseInt(cantidadproductos1);

                            HttpSession session1 = request.getSession();

                            int idUsuario1 = (int) session1.getAttribute("idUsuario");
                            in.setNombreProductos(nombreProductos1);
                            in.setCantiadProductos(CantiadProductos1);
                            in.setEstatusProductos(estatusProductos1);
                            in.setIdUsuario(idUsuario1);
                            in.setIdProductos(idpro);
                            inDB.entradas(in);
                            request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar").forward(request, response);
                        
                        
                        
                        
                        
                        break;
                    case "Entradas":
                        idpro=Integer.parseInt(request.getParameter("idProductos"));
                        inventarios p=inDB.listarId(idpro);
                        request.setAttribute("productoE", p);
                        ban = 1;
                        baj=0;
                        
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar").forward(request, response);
                        break;
                    case "Baja":
                        idpro=Integer.parseInt(request.getParameter("idProductos"));
                        inventarios b=inDB.listarId(idpro);
                        request.setAttribute("productoE", b);
                        baj = 1;
                        ban=0;
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar").forward(request, response);
                        break;
                    case "Cancelar":
                       ban=0;
                       baj=0;
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar").forward(request, response);
                        break;
                    
                }
                
                request.getRequestDispatcher("Inventario.jsp").forward(request, response);
            }
            
            if(menu.equals("Salida")){
               
                switch (accion){
                    case "ListarSalida":
                        List listasalida=inDBsalida.listarsalidas();
                        request.setAttribute("productossalida", listasalida);
                        if(bajsalida==1){
                            request.getSession().setAttribute("campoVisibleSalidas", true);
                            bajsalida=0;
                        }else{
                        request.getSession().setAttribute("campoVisibleSalidas", false);}
                        break;
                    case "Salidas":
                        idprosalida=Integer.parseInt(request.getParameter("idProductos"));
                        inventarios psalida=inDBsalida.listarId(idprosalida);
                        request.setAttribute("productoS", psalida);
                        bajsalida=1;
                        
                        request.getRequestDispatcher("Controlador?menu=Salida&accion=ListarSalida").forward(request, response);
                        break;  
                    case "Cancelar salida":
                        
                        request.getRequestDispatcher("Controlador?menu=Salida&accion=ListarSalida").forward(request, response);
                        
                        break;
                    case "Salida de producto":
                        int cantidadActual = Integer.parseInt(request.getParameter("txtcantidadActual"));
                        int cantidadIngresada = Integer.parseInt(request.getParameter("txtcantidadProductos"));
                        
                        if (cantidadIngresada > cantidadActual) {
                            
                            request.setAttribute("errorS","No hay inventario suficiente.");
                            
                            request.getRequestDispatcher("Controlador?menu=Salida&accion=ListarSalida").forward(request, response);
                        } else {
                            int nuevaCantidad = cantidadActual - cantidadIngresada;
                            String nombreProductos1=request.getParameter("txtnombreProductos");
                            String estatusProductos1=request.getParameter("txtestatusProductosA");

                            HttpSession session1 = request.getSession();

                            int idUsuario1 = (int) session1.getAttribute("idUsuario");
                            insalida.setNombreProductos(nombreProductos1);
                            insalida.setCantiadProductos(nuevaCantidad);
                            insalida.setEstatusProductos(estatusProductos1);
                            insalida.setIdUsuario(idUsuario1);
                            insalida.setIdProductos(idprosalida);
                            inDBsalida.entradas(insalida);
                            
                            movimiento.setIdProductos(idprosalida);
                            movimiento.setTipodemovimiento("Salida");
                            movimiento.setIdUsuario(idUsuario1);
                            movimiento.setCantidad(cantidadIngresada);
                            inDBsalida.registrarMovimiento(movimiento);
                            request.getRequestDispatcher("Controlador?menu=Salida&accion=ListarSalida").forward(request, response);
                        }
                        
                        
                        
                        
                        break;
                        

                }
                request.getRequestDispatcher("Salida.jsp").forward(request, response);
            }
       
            
            switch (accion) {
            case "Principal":
                
                request.getRequestDispatcher("Principal.jsp").forward(request, response);
                break;
            case "Inventario":
                request.getRequestDispatcher("Inventario.jsp").forward(request, response);
                break;
            case "Salida":
                request.getRequestDispatcher("Salida.jsp").forward(request, response);
                break;
            case "Historial":
                request.getRequestDispatcher("Historial.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
