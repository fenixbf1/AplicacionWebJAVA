

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
            <div class="card col-sm-14">
                <form id="filterForm">
                    <label for="tipoMovimiento">Filtrar por tipo de movimiento:</label>
                    <select id="tipoMovimiento" name="tipoMovimiento">
                        <option value="todos">Todos</option>
                        <option value="Entrada">Entrada</option>
                        <option value="Salida">Salida</option>
                    </select>
                </form>
                <table class="table table-hover text-center">
                    <thead>
                        <tr>
                            <td>Id Historial</td>
                            <td>Tipo de movimiento</td>
                            <td>Usuario</td>
                            <td>Producto</td>
                            <td>Cantidad</td>
                            <td>Fecha</td>
                        </tr>
                    </thead>
                    <tbody id="historialTable">
                        <c:forEach var="in" items="${historial}">
                            <tr>
                                <td>${in.getIdHistorico()}</td>
                                <td class="tipoMovimiento">${in.getTipodemovimiento()}</td>
                                <td>${in.getNombre()}</td>
                                <td>${in.getNombreProductos()}</td>
                                <td>${in.getCantidad()}</td>
                                <td>${in.getFecha()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script>
        document.getElementById('tipoMovimiento').addEventListener('change', function() {
            var tipoMovimiento = this.value;
            var rows = document.querySelectorAll('#historialTable tr');
            rows.forEach(function(row) {
                var tipo = row.querySelector('.tipoMovimiento').textContent;
                if (tipoMovimiento === 'todos' || tipo === tipoMovimiento) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>               
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    </body>
</html>