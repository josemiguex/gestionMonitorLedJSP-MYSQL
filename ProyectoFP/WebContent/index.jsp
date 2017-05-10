<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="proyectofp.MonitorLED"%>

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

<style>
h3 {
	text-align: center;
}

body {
	background-image: url(Background/index.jpg);
	background-attachment: fixed; /*para que sea estático*/
	background-position: top left; /*arriba a la derecha*/
	background-repeat: no-repeat; /*que no se repita el fondo*/
}

table {
background-color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestión MonitoresLED</title>
</head>
<body>

	<h3>Gestión de monitores LED</h3>

	<script>
	if (${duplicado == 'true'}) {
		  
		document.write("<div class=\"container\">");
		document.write("<div class=\"alert alert-danger alert-dismissable\">");
		document.write("  <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>");
		document.write("<strong>Error!</strong> El modelo introducido ya existe.");
		document.write("</div>");
		document.write("</div>");
		  
	}
	
	</script>

	<%
		MonitorLED[] monitorled = (MonitorLED[]) request.getAttribute("monitorled");
	%>

	<div class="container">

		<table style="margin: 0 auto;" bgcolor="#dbdbdb"
			class="table table-striped">
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
							+ "</td><td><form name=\"eliminar\" action=\"MainServlet\" method=\"get\"> <input type=\"hidden\" name=\"action\" value=\"deletemonitorled\"><input type=\"hidden\" name=\"modelo\" value=\""
							+ monitorled[i].getModelo()
							+ "\"><button name=\"eliminar\" class=\"btn btn-danger\" type=\"submit\">Eliminar</button></form> </td><td><form action=\"MainServlet\" method=\"get\"> <input type=\"hidden\" name=\"action\" value=\"modifymonitorled\"><input type=\"hidden\" name=\"modelo\" value=\""
							+ monitorled[i].getModelo()
							+ "\"><button type=\"submit\" class=\"btn btn-primary\" value=\"Modificar\">Modificar</form> </td>");
				}
			%>


		</table>
<br/>
	</div>
<center>
	<button class="btn btn-primary" data-toggle="modal" data-target="#add">Añadir
		monitorLED</button></center>
	<div class="modal fade" id="add" role="dialog">
		<div class="modal-dialog">


			<div class="modal-content">
<form action="MainServlet?action=addedmonitorled" 
						method="post" role="form">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 style="text-align: center">
					 Añadir monitorLED
					</h4>
				</div>
				<div class="modal-body">
					
						<div class="form-group row">

							<div class="col-xs-4">
								<label for="modelo">Modelo</label> <input type="text"
									class="form-control" name="modelo" id="modelo" placeholder="Modelo" required>
							</div>

							<div class="col-xs-4">
								<label for="precio">Precio</label> <input type="number"
									class="form-control" name="precio" id="precio" placeholder="Precio" required>
							</div>

							<div class="col-xs-4">
								<label for="pulgadas">Pulgadas</label> <input type="number"
									class="form-control" name="pulgadas" id="pulgadas" placeholder="Pulgadas"
									required>
							</div>
</div>
<div class="form-group row">
							<div class="col-xs-4">
								<label for="marca">Marca</label> <input type="text"
									class="form-control" name="marca" id="marca" placeholder="Marca" required>
							</div>

							<div class="col-xs-4">
								<label for="tipo">Tipo</label> <input type="text"
									class="form-control" name="tipo" id="tipo" placeholder="Tipo" required>
							</div>

							<div class="col-xs-4">
								<label for="cantidad">Cantidad</label> <input type="number"
									class="form-control" name="cantidad" id="cantidad" placeholder="Cantidad"
									required>
							</div>

						</div>
					<button type="submit" class="btn btn-block btn-primary">Añadir 
                <span class="glyphicon glyphicon-ok"></span>
              </button>
						
				</div>


				</form>
			</div>
		</div>
	</div>

</body>
</html>