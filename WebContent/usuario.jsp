<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aplicación Gestion de Usuarios</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<header>
	<nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
		<div>
			<a href="#" class="navbar-brand">Gestion de usuarios</a>
		</div>
		<ul class="navbar-nav">
		<li><a href="<%=request.getContextPath()%>/list" class="nav-link">Usuarios</a></li>
		</ul>
	</nav>
	</header>
	<br>
	<div class="container col-4">
		<div class="card">
			<div class="card-body text-center">
				<c:if test="${usuario!=null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${usuario==null}">
					<form action="insert" method="post">
				</c:if>
				<caption>
					<h2>
						<c:if test="${usuario!=null}">
							Editar Usuario
						</c:if>
						<c:if test="${usuario==null}">
							Agregar Nuevo Usuario
						</c:if>
					</h2>
				</caption>
				<c:if test="${usuario!=null}">
					<input type="hidden" name="id" value="<c:out value="${usuario.id}" />" />
				</c:if>
				<fieldset class="form-group">
					<label>Nombre de Usuario</label><br>
					<input type="text" name="nombre" value="<c:out value="${usuario.nombre}" />" />
				</fieldset>
				<fieldset class="form-group">
					<label>Email de Usuario</label><br>
					<input type="text" name="email" value="<c:out value="${usuario.email}" />" />
				</fieldset>
				<fieldset class="form-group">
					<label>Pais de Usuario</label><br>
					<input type="text" name="pais" value="<c:out value="${usuario.pais}" />" />
				</fieldset>
				<br>
				<button type="submit" class="btn btn-success">Guardar</button>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	
</body>
</html>