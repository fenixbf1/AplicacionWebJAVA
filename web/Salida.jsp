
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
        <div class="d-flex">
            <div class="card col-sm-6"  ">
                <div class="card-body">
                    <% if (request.getAttribute("errorS") != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= request.getAttribute("errorS") %>
                            </div>
                    <% } %>
       
                    <form  action="Controlador?menu=Salida" method="POST" style="<%= (Boolean.FALSE.equals(request.getSession().getAttribute("campoVisibleSalidas")) ? "display:none;" : "") %>">
                            
                        
                      
                        
                        
                        <!-- Salidas de producto -->
                        
                            <!-- Producto -->
                        
                        <div >
                            <label> Producto salidas</label><br>
                            <label> ${productoS.getNombreProductos()}</label>
                            <input type="text"  name="txtnombreProductos" value="${productoS.getNombreProductos()}" class="form-control" required style="display:none">
                            
                        </div>
                            <!-- Cantidad de Productos -->
                        <div class="form-group" >
                            <label> Cantidad de productos a sacar</label>
                            <input type="text"  name="txtcantidadActual" value="${productoS.getCantiadProductos()}" class="form-control" style="display:none" >
                            <input type="text"  name="txtcantidadProductos" value="${productoS.getCantiadProductos()}" class="form-control" >
                        </div>
                            <!-- Estatus -->
                        
                        <div class="form-group" id="miCampo"  >
                            <input type="text"  name="txtestatusProductosA" value="${productoS.getEstatusProductos()}" class="form-control" style="display: none">
                            
                        </div>
                            <br>
                        
                        <div >
                            <input type="submit" name="accion" value="Salida de producto"  class="btn btn-info">
                            <input type="submit" name="accion" value="Cancelar salida" class="btn btn-info" >
                        </div>    
                    </form>         
                    
                </div>
            </div>
                 
            <div class="card col-sm-14">
                <table class="table table-hover text-center">
                    <thead>
                        <tr>
                            <td>idProductos</td>
                            <td>Productos</td>
                            <td>Cantidad</td>
                            <td>Estatus</td>
                            <td>Usuario</td>
                            <td>Accion</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="insalida" items="${productossalida}">
                            <tr>
                                <td>${insalida.getIdProductos()}</td>
                                <td>${insalida.getNombreProductos()}</td>
                                <td>${insalida.getCantiadProductos()}</td>
                                <td>${insalida.getEstatusProductos()}</td>
                                <td>${insalida.getNombre()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Salida&accion=Salidas&idProductos=${insalida.getIdProductos()}" >Salida</a>
                                </td>
                            </tr>
                        </c:forEach>
                        
                    </tbody>
                </table> 
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>               
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    </body>
</html>