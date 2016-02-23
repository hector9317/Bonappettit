<!DOCTYPE html>
<%@page import="com.aht.dao.category.CategoryDAOImpl"%>
<%@page import="com.aht.dao.utils.ApplicationContextWrapper"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.aht.model.Country"%>
<%@page import="java.util.LinkedList"%>
<%@page
	import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.aht.dao.country.CountryDAOImpl"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.aht.api.engine.ItemRecommender"%>
<%@page import="com.aht.api.config.Config"%>
<%@page import="com.aht.domain.Category"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Set"%>
<%@page import="com.aht.domain.Dish"%>
<%@page import="com.aht.dao.dish.DishDAOImpl"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/addDish.css">
<title>Bonappettit</title>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Bonappettit</a>
		</div>
	</nav>
	<div class="container">
		<h4 class="titulo">Favor de llenar todos los campos</h4>
		<form role="form" action="createUser.jsp" method="post">
			<div class="row divForLabel">
				<div class="col-xs-12">
					<label>Nombre del platillo: </label>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<input type="text" id="name" name="name" class="form-control"
						placeholder="Agrega un nombre" required="required">
				</div>
			</div>
			<div class="row divForLabel">
				<div class="col-xs-12">
					<label>Ingredientes: </label>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<textarea class="form-control" rows="5" id="description"
						name="description"
						placeholder="Ingredientes que lleva el platillo separados por comas"
						required="required"></textarea>
				</div>
			</div>
			<div class="row divForLabel">
				<div class="col-xs-12">
					<label>Categor&iacute;as: </label>
				</div>
			</div>

				<div class="panel-group" id="accordion">

					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapse1">
							<h4 class="panel-title">Tipo de comida</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse in">
							<div class="panel-body">
							</div>
						</div>
					</div>
					
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapse2">
							<h4 class="panel-title">Sabor</h4>
						</div>
						<div id="collapse2" class="panel-collapse collapse">
							<div class="panel-body">
							</div>
						</div>
					</div>
					
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapse3">
							<h4 class="panel-title">Ocasión</h4>
						</div>
						<div id="collapse3" class="panel-collapse collapse">
							<div class="panel-body">
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapse4">
							<h4 class="panel-title">Región</h4>
						</div>
						<div id="collapse4" class="panel-collapse collapse">
							<div class="panel-body">
							</div>
						</div>
					</div>


					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapse5">
							<h4 class="panel-title">Salud</h4>
						</div>
						<div id="collapse5" class="panel-collapse collapse">
							<div class="panel-body">
							</div>
						</div>
					</div>


					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapse6">
							<h4 class="panel-title">Temperatura</h4>
						</div>
						<div id="collapse6" class="panel-collapse collapse">
							<div class="panel-body">
							</div>
						</div>
					</div>


					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapse7">
							<h4 class="panel-title">Gente</h4>
						</div>
						<div id="collapse7" class="panel-collapse collapse">
							<div class="panel-body">
							</div>
						</div>
					</div>


					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapse8">
							<h4 class="panel-title">Textura</h4>
						</div>
						<div id="collapse8" class="panel-collapse collapse">
							<div class="panel-body">
							</div>
						</div>
					</div>


				</div>

			<%
				CategoryDAOImpl cdi = new CategoryDAOImpl();
			%>


			<button type="submit" class="btn btn-info btn-block button">Enviar
				informaci&oacute;n</button>
		</form>
	</div>
		<script src="js/jquery-2.2.0.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/collapse.js"></script>
</body>
</html>

