<%-- 
    Document   : errorBorrado
    Created on : 01-nov-2016, 12:52:22
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
            <h1 id="error">Error de borrado</h1>
            <p>No has seleccionado ningún campo para borrar</p>
            <input type="submit" value="Borrar" name="menu"/>
        </form>
    </body>
</html>
