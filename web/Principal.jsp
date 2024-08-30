

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%-- CSS bootstrap--%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-info">
            <div class="collapse navbar-collapse" id="navbarNav">
                <% String rol = (String) session.getAttribute("rol");
                    String nombreUsuario = (String) session.getAttribute("nombre");%>
                <ul class="navbar-nav">
                    <% if ("Administrador".equals(rol)) { %>
                    <li class="nav-item active">
                        <a style="margin-left: 10px; border: none" class="nav-link" aria-current="page" href="Controlador?menu=Inventario&accion=Listar" target="myFrame">Inventario</a>
                    </li>
                    <% } %>
                    <% if ("Almacenista".equals(rol)) { %>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none" class="nav-link" href="Controlador?menu=Salida&accion=ListarSalida" target="myFrame">Salida de productos</a>
                    </li>
                    <% } %>
                    
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"  class="nav-link" href="Controlador?menu=Historial&accion=ListarH" target="myFrame">Historial</a>
                    </li>
                    <li class="nav-item">
                        <form action="Validar" method="POST">
                            <button type="submit" name="accion" value="Salir" class="nav-link" href="#"><%= nombreUsuario %> <%= rol %> Salir</button>
                        </form>
                    </li>
                </ul>
            </div>
            
        </nav>
        <div class="m-4" style="height: 530px;">
            <iframe name="myFrame" style="height: 100%; width: 100%; border: none"></iframe>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
    </body>
</html>