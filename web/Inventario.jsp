

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
                    <form  action="Controlador?menu=Inventario" method="POST" >
                        <jsp:include page="Entrada.jsp" />
                        <jsp:include page="Agregar.jsp" />
                        <jsp:include page="Baja.jsp" />
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
                        <c:forEach var="in" items="${productos}">
                            <tr>
                                <td>${in.getIdProductos()}</td>
                                <td>${in.getNombreProductos()}</td>
                                <td>${in.getCantiadProductos()}</td>
                                <td>${in.getEstatusProductos()}</td>
                                <td>${in.getNombre()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Inventario&accion=Entradas&idProductos=${in.getIdProductos()}" >Entrada</a>
                                
                                    <a class="btn btn-info" href="Controlador?menu=Inventario&accion=Baja&idProductos=${in.getIdProductos()}">Estatus</a>
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