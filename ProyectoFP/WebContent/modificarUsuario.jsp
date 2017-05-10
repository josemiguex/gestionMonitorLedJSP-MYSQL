<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="proyectofp.MonitorLED"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modificar usuario</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

body {
	background-image: url(Background/modificarUsuario.png);
	background-attachment: fixed; /*para que sea estático*/
	background-position: top left; /*arriba a la derecha*/
	background-repeat: no-repeat; /*que no se repita el fondo*/
}

</style>
</head>
<body>
<h1>Modificar MonitorLED</h1>

<%MonitorLED mled = (MonitorLED)request.getAttribute("monitorled"); %>
<form  action="MainServlet?action=modifiedmonitorled" method="post">
<div class="form-group row">

<div class="col-xs-4">
<label for="modelo">Modelo</label>
<input type="text" class="form-control" name="modelo" id="modelo" value="<%= mled.getModelo() %>" placeholder="Escriba aquí el modelo" required>

</div>

<div class="col-xs-4">
<label for="precio">Precio</label>
<input type="number" class="form-control" step="0.01" name="precio" id="precio" value="<%= mled.getPrecio() %>" placeholder="Escriba aquí el precio" required>

</div>

<div class="col-xs-4">
<label for="pulgadas">Pulgadas</label>
<input type="number" class="form-control" step="0.1" name="pulgadas" id="pulgadas" value="<%= mled.getPulgadas() %>" placeholder="Escriba aquí las pulgadas" required>

</div>
</div>
<div class="form-group row">
<div class="col-xs-4">
<label for="resolucion">Marca</label>
<input type="text" class="form-control" name="marca" id="marca" value="<%= mled.getMarca() %>" placeholder="Escriba aquí la marca" required>

</div>

<div class="col-xs-4">
<label for="tipo">Tipo</label>
<input type="text" class="form-control" name="tipo" id="Tipo" value="<%= mled.getTipo() %>" placeholder="Escriba aquí el tipo" required>

</div>

<div class="col-xs-4">
<label for="cantidad">Cantidad</label>
<input type="number" class="form-control" name="cantidad" id="Tipo" value="<%= mled.getCantidad() %>" placeholder="Escriba aquí la cantidad" required>

</div>
</div>
<input type="hidden" name="modeloantiguo" value="<%= mled.getModelo() %>">
<button type="submit" class="btn btn-primary">Modificar monitorLED</button></form>
</body>
</html>