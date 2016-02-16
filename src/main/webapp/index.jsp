<!DOCTYPE html>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.aht.api.engine.ItemRecommender"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.aht.api.config.Config"%>
<%@page import="com.aht.domain.Dish"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.aht.dao.dish.DishDAOImpl"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/style.css">
		<title>Elementos de prueba</title>
	</head>
	<body>
		<nav class="navbar navbar-default" role="navigation">
			<div class = "navbar-header">
				<a class="navbar-brand" href="#">Bonappettit</a>
				<div class="contenedorSession">
					<div class="dropdown-toggle userContainer" data-toggle="collapse" data-target="#formularioLogin">
						<span class="glyphicon glyphicon-user" aria-hidden="false"></span>
					</div>
					<div id="formularioLogin" class="collapse container">
						<input type="text" class="form-control" placeholder="Usuario" />
						<input type="password" class="form-control"  placeholder="Contrase&ntilde;a" />
						<button type="submit" class="btn btn-info botonSubmit">Iniciar sesi&oacute;n</button>
						<button type="submit" class="btn btn-danger botonSubmit">Resgistrar</button>
					</div>
				</div>
			</div>
		</nav>
		<div class="barrita">
			<form role="search">
				<div class="form-group">
					<input type="text" class="form-control searchInput" placeholder="Estoy buscando ..." />
					<button type="submit" class="btn btn-default">
						<span class="glyphicon glyphicon-search posicion" aria-hidden="false"></span>
					</button>
				</div>
			</form>
		</div>
		<div class="container posicion">
			<h4 class="page-head-line">LO M&Aacute;S RELEVANTE</h4>
		<%
			int quantity = 6;
			LinkedList<Dish> dishes = null;
			DishDAOImpl ddi = new DishDAOImpl();
			int pagination = Integer.parseInt(String.valueOf(Math.round(Math.random() * (842 / 6))));
			dishes = ddi.retrieveSome(pagination, quantity);
			String location = "var/";
		%>
			<div class="container-fluid">
				<div class="row">
				<%
					if(dishes != null) {
						for(int i = 0; i < 3; i++) {
							out.println("<div class='col-xs-12 col-sm-6 col-md-4 col-lg-4 posicion'>");
								out.println("<img src='var/" + dishes.get(i).getPicture() + "' class='img-responsive'>");
								out.println("<a href='information.jsp?dish=" + dishes.get(i).getId() + "'><h3>" + dishes.get(i).getName() + "</h3></a>");
							out.println("</div>");
						}
					}
				%>
				</div>
			</div>
			<hr>

		<%
		int numberOfRecommendations = 6;
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 1) {
			LinkedList<Long> ids = new LinkedList<Long>();
			LinkedList<Integer> visualisations = new LinkedList<Integer>();
			for (int i = 0; i < cookies.length; i++) {
				if(!cookies[i].getName().equals("JSESSIONID")) {
					ids.add(Long.parseLong(cookies[i].getName()));
					visualisations.add(Integer.parseInt(cookies[i].getValue()));
				}
			}
			Class.forName("org.neo4j.jdbc.Driver");
			try {
				Connection connection = Config.connectToNeo4j("neo4j", "burros93");
				ItemRecommender item = new ItemRecommender();
				ResultSet result = item.getItemBasedRecommendations(ids, visualisations, numberOfRecommendations, connection);		
		%>
			<h4 class="page-head-line">RECOMENDADO PARA TI</h4>
			
		<%
				int i = 0;
				while(i < 3 && result.next()) {
					Map<String, Object> res = (Map<String, Object>) result.getObject("reco");
					Dish recomendacion = ddi.findByName((String) res.get("name"));
		%>
			<div class="container-fluid">
				<div class="row">
				<%
					out.println("<div class='col-xs-12 col-sm-6 col-md-4 col-lg-4 posicion'>");
						out.println("<img src='var/" + recomendacion.getPicture() + "' class='img-responsive'>");
						out.println("<a href='information.jsp?dish=" +  recomendacion.getId() + "'><h3>" + recomendacion.getName() + "</h3></a>");		
					out.println("</div>");
				%>
				</div>
			</div>
		<%
					i++;
				}
			} catch(Exception exception) {}
			
		}
		%>
		</div>
		<script src="js/jquery-2.2.0.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/collapse.js"></script>
	</body>
</html>
