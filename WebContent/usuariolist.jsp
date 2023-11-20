<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Aplicacion Gestion de Usuarios</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<header>
		<div class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
			<div>
				<a href="#" class="navbar-brand">Gestion de Usuarios</a>
			</div>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list" class="nav-link">Usuarios</a></li>
			</ul>
		</div>
	</header>
	<br>
	
	<div class="container">
		<div class="row">
			<h3 class="text-center">Listado de Usuarios</h3>
			<br>
			<div class="container text-left">
				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Agregar Nuevo Usuario</a>
			</div>
			<br>
			<br>
			<table class="table table-bordered table-hover"">
				<thead class="table-dark">
					<tr>
						<th>Id</th>
						<th>Nombre</th>
						<th>E-mail</th>
						<th>Pais</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="usuario" items="${listUsuarios}">
						<tr>
							<td>
								<c:out value="${usuario.id }"/>
							</td>
							<td>
								<c:out value="${usuario.nombre }"/>
							</td>
							<td>
								<c:out value="${usuario.email }"/>
							</td>
							<td>
								<c:out value="${usuario.pais }"/>
							</td>
							<td>
								<a href="edit?id=<c:out value="${usuario.id }"/>">Editar</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="delete?id=<c:out value="${usuario.id }"/>">Eliminar </a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>