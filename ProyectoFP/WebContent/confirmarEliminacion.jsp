<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Confirmar eliminación</title>
<style>
body {
	background-image: url(Background/confirmarEliminacion.jpg);
	background-attachment: fixed; /*para que sea estático*/
	background-position: top left; /*arriba a la derecha*/
	background-repeat: no-repeat; /*que no se repita el fondo*/
}

</style>
</head>
<body>
<center>
<h3>Confirmar eliminación</h3>
<p>¿Estás seguro de que desea eliminar el modelo <b> <%=request.getParameter("modelo") %></b>?</p>

<form action="MainServlet" method="post">
		<input type="hidden" name="action" value="deletedmonitorled">
		<input type="hidden" name="modelo" value="<%=request.getParameter("modelo")%>">
		<button class="btn btn-danger btn-block" type="submit">Sí</button>
	</form>
	<br>
	<form action="MainServlet">
		<input type="hidden" name="action" value="main">
		<button class="btn btn-primary btn-block" type="submit">No</button>
	</form>
	</center>
</body>
</html>