<!DOCTYPE html>
<%@page import="com.aht.domain.Dish"%>
<%@page import="java.util.LinkedList"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.aht.dao.dish.DishDAOImpl"%>
<%@page contentType="text/html" %>
<%@page pageEncoding="utf-8" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Bonappettit</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
		<link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
    </head>
    <body>
        <div class="navbar navbar-inverse set-radius-zero">
            <div class="container">
                <img src="img/bonappetit.png" style="width: 90px;padding-top:5px;padding-bottom: 5px;">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
            </div>
        </div>
        <section class="menu-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <br>
                        <div class="col-lg-5">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Buscar Platillo....">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </span>
                            </div>
                        </div>
                        <div class="navbar-collapse collapse ">
                            <ul id="menu-top" class="nav navbar-nav navbar-right">
                                <li><a href="index.jsp">Menu Principal</a></li>
                                <li><a href="add.jsp">Agregar</a></li>
                                <li><a class="menu-top-active"   href="modify_or_delete.jsp">Modificar o Eliminar</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="content-wrapper">
            <div class="container">
                <div class="row">
                    <div class="row" >
                        <div class="col-lg-5">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Buscar Platillo....">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </span>
                            </div>
                        </div>
                    </div>
					<hr>
                    <div>
                        <h4>Resultados de la Busqueda</h4>
                    </div>
                        <div class="container">
                            <div class="table-responsive">          
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre Platillo</th>
                                            <th>Ingredientes</th>
                                            <th>Categorias</th>
                                            <th>Opciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Platillo 1</td>
                                            <td>Ingredientes</td>
                                            <td>Segundos Platos|Familiares</td>
                                            <td>
                                                <button type="button" class="btn btn-danger">Eliminar</button>
                                                <a href="add.jsp"><button type="button" class="btn btn-info">Modificar</button></a>
                                            </td>
                                        </tr>
								<%
								DishDAOImpl ddi = new DishDAOImpl();
								LinkedList<Dish> dishes = ddi.retrieveAll();
								
								if(dishes != null) {
									for(Dish dish : dishes) {
										out.println("<td class='idDish'");
											out.println("<td>");
												out.println(dish.getId());
											out.println("</td>");
											
											out.println("<td class='name'>");
												out.println(dish.getName());
											out.println("</td>");
											
											out.println("<td>");
												out.println(dish.getIngredients().replace(" ", ", "));
											out.println("</td>");
											
											out.println("<td>");
												out.println(dish.getCategoriesNames());
											out.println("</td>");
											
											out.println("<td class='options'>");
												out.println("<a href='form.jsp?id=" + dish.getId() + "'><button type='submit' class='btn btn-info'>Modificar</button></a>");
												out.println("<a href='delete.jsp?id=" + dish.getId() + "'> <button type='submit' class='btn btn-danger'>Eliminar</button></a>");												
											out.println("</td>");
										out.println("</tr>");
									}
								}
								%>
                                    </tbody>
                                </table>
                            </div>
                        </div> 
                </div>
            </div>
        </div>        
        <!-- CONTENT-WRAPPER SECTION END-->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                    </div>

                </div>
            </div>
        </footer>
        <!-- FOOTER SECTION END-->
        <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY SCRIPTS -->
        <script src="js/jquery-1.11.1.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="js/bootstrap.js"></script>
    </body>
</html>
