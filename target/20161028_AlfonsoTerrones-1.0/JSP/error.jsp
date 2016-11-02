<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERROR</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/estilo.css"/>
</head>
<body>
    <h2 id="error">Error al introducir la clave</h2>
    <form action="<%=request.getContextPath()%>/JSP/CrearAveFormulario.jsp" method="get">
    <p>Error al introducir la clave, es posible que este duplicada o que la hayas dejado en blanco</p>

        <input type="hidden" name="anilla" value="<%=request.getParameter("anilla")%>"/><!--Cargamos el formulario oculto para que a la hora de tenerlos que cambiar los muestre en el jsp CrearFormulario -->
        <input type="hidden" name="especie" value="<%=request.getParameter("especie")%>"/>
        <input type="hidden" name="lugar" value="<%=request.getParameter("lugar")%>"/>
        <input type="hidden" name="fecha" value="<%=request.getParameter("fecha")%>"/>  
        <input type="submit" value="volver" name="volver"/>
</form>
</body>
</html>