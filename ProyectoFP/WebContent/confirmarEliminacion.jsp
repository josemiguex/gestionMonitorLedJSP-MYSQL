<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Confirmar eliminación</title>
</head>
<body>

<h3>Confirmar eliminación</h3>
<p>¿Estás seguro de que desea eliminar el modelo <b> <%=request.getParameter("modelo") %></b>?</p>

<form action="MainServlet" method="post">
		<input type="hidden" name="action" value="deletedmonitorled">
		<input type="hidden" name="modelo" value="<%=request.getParameter("modelo")%>">
		<button class="waves-effect grey btn" type="submit">Sí</button>
	</form>
	<br>
	<form action="MainServlet">
		<input type="hidden" name="action" value="main">
		<button class="waves-effect grey btn" type="submit">No</button>
	</form>
	
</body>
</html>