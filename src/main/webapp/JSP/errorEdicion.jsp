<%-- 
    Document   : errorEdicion
    Created on : 01-nov-2016, 12:52:05
    Author     : AlfonsoTerrones
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                 <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/estilo.css"/>

    </head>
    <body>      
        <form action="<%=request.getContextPath()%>/ControladorMenuIncial" method="post">
            <h1 id="error">No has seleccionado ninguna casilla para editar</h1>
            <input type="submit" value="Editar" name="menu"/>
        </form>
    </body>
</html>
