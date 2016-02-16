<!DOCTYPE html>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.aht.api.engine.ItemRecommender"%>
<%@page import="com.aht.api.config.Config"%>
<%@page import="com.aht.domain.Category"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Set"%>
<%@page import="com.aht.domain.Dish"%>
<%@page import="com.aht.dao.dish.DishDAOImpl"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/style.css">
		<title>Bonappettit</title>
	</head>
	<body>
	<%
		long dishId = 0;
	    if(request.getParameter("dish") != null) {
	        dishId = Long.parseLong(request.getParameter("dish"));
	        int counter = 1;
	        Cookie[] cookies = request.getCookies();
	        Cookie cookie = null;
	        for(int i=0; i < cookies.length; i++){
	            cookie =  cookies[i];
	            if(cookie.getName().equals(dishId + "")){
	                counter = Integer.parseInt(cookies[i].getValue()) + 1;
	                cookie.setMaxAge(0);
	                response.addCookie(cookie);
	            }
	        }
	        cookie = new Cookie(dishId+"", counter + "");
	        response.addCookie(cookie);
		}
	%>
		<nav class="navbar navbar-default" role="navigation">
			<div class = "navbar-header">
				<a class="navbar-brand" href="#">Bonappettit</a>
				<div class="contenedorSession">
					<div class="dropdown-toggle userContainer" data-toggle="collapse" data-target="#formularioLogin">
						<span class="glyphicon glyphicon-user" aria-hidden="false"></span>
					</div>
					<div id="formularioLogin" class="collapse container">
						<form role="form">
							<input type="text" class="form-control" placeholder="Usuario" />
							<input type="password" class="form-control"  placeholder="Contrase&ntilde;a" />
							<button type="submit" class="btn btn-info botonSubmit">Iniciar sesi&oacute;n</button>
							<button type="submit" class="btn btn-danger botonSubmit">Resgistrar</button>
						</form>
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
		
	<%
		Dish dish = null;
		DishDAOImpl ddi = new DishDAOImpl();
		dish = ddi.retrieve(dishId);
		
		if(dish != null) {
	%>

		<div class="container posicion">
			<h3 class="top0"><%= dish.getName() %></h3>
			<div class="container-fluid">
				<div class="row">
					<div class="class='col-xs-12 col-sm-6 col-md-6 col-lg-6 posicion">
						<img src="<%= "var/" + dish.getPicture() %>" class="img-responsive">
					</div>
					<div class="class='col-xs-12 col-sm-6 col-md-6 col-lg-6 posicion">
						<h4 class="top20">Descripción</h4>
						<p class="descripcion"><%= dish.getDescription() %></p>
						<h4 class="top20">Categorias</h4>
						<ul class="descripcion">
						<%
							Set<Category> categories = dish.getCategories();
							for(Category category : categories)
								out.println("<li class='descripcion'>" + category.getName() + "</li>");
						%>
						</ul>
					</div>
				</div>
			</div>
			<% } %>

			<h4 class="top20">Platillos relacionados</h4>
		<%
			Class.forName("org.neo4j.jdbc.Driver");
			try {
				Connection connection = Config.connectToNeo4j("neo4j", "burros93");
				ItemRecommender item = new ItemRecommender();
				ResultSet results = item.getRecommendationsForItem(dishId, 4, connection);

				int i = 0;
				while(i < 3 && results.next()) {
					Map<String, Object> res = (Map<String, Object>) results.getObject("reco");
					Dish recomendacion = ddi.findByName((String) res.get("name"));
					System.out.println("+--------" + recomendacion.toString());
		%>
			<div class="container-fluid">
				<div class="row">
				<%
					out.println("<div class='col-xs-12 col-sm-6 col-md-4 col-lg-4 posicion'>");
						out.println("<img src='var/" + recomendacion.getPicture() + "' class='img-responsive'>");
						out.println("<a href='information.jsp?dish=" +  recomendacion.getId() + "'><h4 class='top0 noLine'>" + recomendacion.getName() + "</h4></a>");		
					out.println("</div>");
				%>
				</div>
			</div>
		<%
					i++;
				}
			} catch(Exception exception) {}
		%>
	
		</div>
<!--
                /*
				else {
                    //Delete cookie
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                */
                %>
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">No se encontrÃ³ el platillo :(</h2>
                    </div>
                </div>
                < } %>
            </div>
        </div>



        <footer>
            <div class="container">
                <div class="row">
                </div>
            </div>
        </footer>
        <script src="js/jquery-1.11.1.js"></script>

        <script src="js/bootstrap.js"></script>
    <
    /*

        } else {
            //If dish id is not especified, redirect to index page
            response.sendRedirect("index.jsp");
        }
	*/
    %>
    </body>
    <script>
        function search(){
            var searching = document.getElementById("search-box").value;
            window.location = "results.jsp?search="+searching;
        }
    </script>
</html>
    <page contentType="text/html" pageEncoding="UTF-8"%>
-->
		<script src="js/jquery-2.2.0.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/collapse.js"></script>
	</body>
</html>
