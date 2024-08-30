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
                        
                        <div style="<%= (Boolean.FALSE.equals(request.getSession().getAttribute("campoVisibleBaja2")) ? "display:none;" : "") %>">
                            <label> Producto Baja</label><br>
                            <label> ${productoE.getNombreProductos()}</label>
                            
                        </div>
                            <!-- Cantidad de Productos -->
                        
                        <div class="form-group" style="<%= (Boolean.FALSE.equals(request.getSession().getAttribute("campoVisibleBaja2")) ? "display:none;" : "") %>">
                            <label> Cantidad de productos</label><br>
                            <label> ${productoE.getCantiadProductos()}</label>
                            <input type="text"  name="txtcantidadActualBaja" value="${productoE.getCantiadProductos()}" class="form-control" style="display:none" >
                        </div>
                            <!-- Estatus -->
                        
                        
                        <div class="form-group"  style="<%= (Boolean.FALSE.equals(request.getSession().getAttribute("campoVisibleBaja2")) ? "display:none;" : "") %>">
                            <label>Estatus de producto</label><br>
                              
                            <select name="txtestatusProductosBaja" class="form-control">
                                <option value="Activo" ${"Activo".equals(productoE.getEstatusProductos()) ? "selected" : "" }>Activo</option>
                                <option value="Inactivo" ${"Inactivo".equals(productoE.getEstatusProductos()) ? "selected" : "" }>Inactivo</option>
                            </select>
                            
                            
                            <input type="text"  name="txtestatusProductosBaja" value="${productoE.getEstatusProductos()}" class="form-control" style="display: none">
                            
                        </div>
                      
                        
                        <div style="<%= (Boolean.FALSE.equals(request.getSession().getAttribute("campoVisibleBaja2")) ? "display:none;" : "") %>">
                            <input type="submit" name="accion" value="Estatus de producto"  class="btn btn-info">
                            <input type="submit" name="accion" value="Cancelar" class="btn btn-info" >
                        </div>       
                        
                
                        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    </body>
 </html>
