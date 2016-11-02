<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aves</title>
         
         <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/estilo.css"/>

    </head>
    <body>
        <h1 id="titulo">Página de avistamientos</h1>
        <form action="<%=request.getContextPath()%>/ControladorMenuIncial" method="post">
        
        <table id="centro">
            <%if(request.getAttribute("mensaje") != null){
            %><p><%=request.getAttribute("mensaje")%></p><%
            }   %>
            <tr>
                <td><a href="<%=request.getContextPath()%>/ControladorMenuIncial?Crear"> <input type="button" value="Crear" name="menu"/></a></td>
               <!-- <td><input type="submit" value="Crear" name="menu"/></td>-->
                <td><input type="submit" value="Borrar" name="menu"/></td>
                <td><input type="submit" value="Editar" name="menu"/></td>
                <td><input type="submit" value="Listar" name="menu"/></td>
            </tr>
        </table>
               
        </form>
    </body>
</html>
