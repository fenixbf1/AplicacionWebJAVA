<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%-- CSS bootstrap--%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
       
                            <!-- Producto -->
                        <div class="form-group" style="<%= (Boolean.FALSE.equals(request.getSession().getAttribute("campoVisible")) ? "display:none;" : "") %>">
                            <label> Producto agregar</label>
                            <input type="text"  name="txtnombreProductos" value="${productoE.getNombreProductos()}" class="form-control" required>
                        </div>
                        
                            <!-- Cantidad de Productos -->
                        
                            <!-- Estatus -->
                        <div class="form-group" id="miCampo"  style="<%= (Boolean.FALSE.equals(request.getSession().getAttribute("campoVisible")) ? "display:none;" : "") %>">
                            <label>Estatus</label>
                            <select name="txtestatusProductos" id="miLista" class="form-control">
                                <option value="Activo">Activo</option>
                                <option value="Inactivo">Inactivo</option>
                            </select>
                            
                        </div>
                        
                      
                        
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info" style="<%= (Boolean.FALSE.equals(request.getSession().getAttribute("campoVisible")) ? "display:none;" : "") %>">        
                        
                
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    </body>
 </html>