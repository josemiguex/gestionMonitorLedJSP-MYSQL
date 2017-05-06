<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="proyectofp.MonitorLED"%>

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

<style>
h3 {
	text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestión MonitoresLED</title>
</head>
<body>
	<h3>Gestión de monitores LED</h3>

	<script>
	if (${duplicado == 'true'}) {
		  alert("El modelo introducido ya existe");
	}
	</script>

	<%
		MonitorLED[] monitorled = (MonitorLED[]) request.getAttribute("monitorled");
	%>	
	<div class="container">
		<div class="row">
			<div class="col l12 m12 s12">

				<table style="margin: 0 auto;" bgcolor="#dbdbdb" class="striped">
					<thead>
						<tr>
							<th>Modelo</th>
							<th>Precio</th>
							<th>Pulgadas</th>
							<th>Marca</th>
							<th>Tipo</th>
							<th>Cantidad</th>
							<th></th>
							<th></th>
					</thead>
					<%
						for (int i = 0; i < monitorled.length; i++) {
							out.print("<tr><td>" + monitorled[i].getModelo() + "</td><td>" + " " + monitorled[i].getPrecio()
									+ "€</td><td>" + monitorled[i].getPulgadas() + "\"</td><td>" + monitorled[i].getMarca()
									+ "</td><td>" + monitorled[i].getTipo() + "</td><td>" + monitorled[i].getCantidad()
									+ "</td><td><form action=\"MainServlet\" method=\"post\"> <input type=\"hidden\" name=\"action\" value=\"deletemonitorled\"><input type=\"hidden\" name=\"modelo\" value=\""
									+ monitorled[i].getModelo()
									+ "\"><button name=\"eliminar\" class=\"btn waves-effect red\" type=\"submit\">Eliminar</button></form> </td><td><form action=\"MainServlet\" method=\"get\"> <input type=\"hidden\" name=\"action\" value=\"modifymonitorled\"><input type=\"hidden\" name=\"modelo\" value=\""
									+ monitorled[i].getModelo() + "\"><button type=\"submit\" class=\"btn waves-effect blue\" value=\"Modificar\">Modificar</form> </td>");
						}
					%>


				</table>
			</div>
		</div>
	</div>
	<form action="MainServlet">
		<input type="hidden" name="action" value="addmonitorled">
		<button class="waves-effect grey btn" type="submit">Añadir
			MonitorLED</button>
	</form>
</body>
</html>