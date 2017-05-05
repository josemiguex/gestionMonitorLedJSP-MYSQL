<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Añadir usuario</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<h1>Introduzca los datos del nuevo MonitorLED</h1>
<form class="col s12" action="MainServlet?action=addedmonitorled" method="post">
<div class="row">

<div class="input-field col l4 m12 s12">
<input type="text" name="modelo" id="modelo" placeholder="Escriba aquí el modelo" required>
<label for="modelo">Modelo</label>
</div>

<div class="input-field col l4 m12 s12">
<input type="number" step="0.01" name="precio" id="precio" placeholder="Escriba aquí el precio" required>
<label for="precio">Precio</label>
</div>

<div class="input-field col l4 m12 s12">
<input type="text" name="resolucion" id="resolucion" placeholder="Escriba aquí la resolución" required>
<label for="resolucion">Resolución</label>
</div>

<div class="input-field col l4 m12 s12">
<input type="text" name="marca" id="marca" placeholder="Escriba aquí la marca" required>
<label for="resolucion">Marca</label>
</div>

<div class="input-field col l4 m12 s12">
<input type="text" name="tipo" id="Tipo" placeholder="Escriba aquí el tipo" required>
<label for="tipo">Tipo</label>
</div>

<div class="input-field col l4 m12 s12">
<input type="number" name="cantidad" id="Tipo" placeholder="Escriba aquí la cantidad" required>
<label for="cantidad">Cantidad</label>
</div>

<input type="submit" value="Añadir MonitorLED">
</form>
</body>
</html>