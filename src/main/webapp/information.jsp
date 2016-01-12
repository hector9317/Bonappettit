<%@ page import="com.aht.dao.dish.DishDAOImpl" %>
<%@ page import="com.aht.domain.Dish" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.aht.domain.Category" %>
<%@ page import="com.aht.dao.category.CategoryDAOImpl" %>
<%@ page import="com.aht.api.config.Config" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.aht.api.engine.ItemRecommender" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.neo4j.ogm.session.result.Result" %>
<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<%
    if(request.getParameter("dish") != null) {
        long dishId = Long.parseLong(request.getParameter("dish"));
        int counter = 1;
        Cookie[] cookies = request.getCookies();
        Cookie cookie = null;
        for(int i=0; i < cookies.length; i++){
            cookie =  cookies[i];
            if(cookie.getName().equals(dishId+"")){
                counter = Integer.parseInt(cookies[i].getValue()) + 1;
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        cookie = new Cookie(dishId+"", counter + "");
        response.addCookie(cookie);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!--[if IE]>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <![endif]-->
        <title>Bonappettit</title>
        <!-- BOOTSTRAP CORE STYLE  -->
        <link href="css/bootstrap.css" rel="stylesheet" />
         <link href="css/bootstrap.min.css" rel="stylesheet" />
        <!-- FONT AWESOME ICONS  -->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLE  -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <!-- HEADER END-->
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

                <!--   <div class="left-div">
                       <div class="user-settings-wrapper">
                           <ul class="nav">
       
                               <li class="dropdown">
                                   <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                       <span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
                                   </a>
                                   <div class="dropdown-menu dropdown-settings">
                                       <div class="media">
                                           <a class="media-left" href="#">
                                               <img src="assets/img/64-64.jpg" alt="" class="img-rounded" />
                                           </a>
                                           <div class="media-body">
                                               <h4 class="media-heading">Jhon Deo Alex </h4>
                                               <h5>Developer & Designer</h5>
       
                                           </div>
                                       </div>
                                       <hr />
                                       <h5><strong>Personal Bio : </strong></h5>
                                       Anim pariatur cliche reprehen derit.
                                       <hr />
                                       <a href="#" class="btn btn-info btn-sm">Full Profile</a>&nbsp; <a href="login.html" class="btn btn-danger btn-sm">Logout</a>
       
                                   </div>
                               </li>
       
       
                           </ul>
                       </div>
                   </div>-->
                
            </div>
        </div>
        <!-- LOGO HEADER END-->
        <section class="menu-section">
            
            <div class="container">
                
                <div class="row">
                    <div class="col-md-12">
                        <br>
                        <div class="col-lg-5">
                            <div class="input-group">
                                <input id="search-box" type="text" class="form-control" placeholder="Buscar Platillo....">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button" onclick="search()">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </span>
                            </div>

                        </div>
                        <div class="navbar-collapse collapse ">
                            <ul id="menu-top" class="nav navbar-nav navbar-right">
                                <li><a class="menu-top-active" href="index.jsp">Menu Principal</a></li>
                                <li><a href="add.jsp">Agregar</a></li>
                             <!--   <li><a href="modify_or_delete.jsp">Modificar o Eliminar</a></li>--> 
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- MENU SECTION END-->

        <div class="content-wrapper">
            <div class="container">
                <%
                    String location = "var/";
                    DishDAOImpl ddi = new DishDAOImpl();
                    Dish dish = ddi.retrieve(dishId);
                    if(dish != null) {
                %>
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><%= dish.getName()%></h1>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Portfolio Item Row -->
                <div class="row">
                    <div class="col-md-8">
                        <img class="img-responsive" src="<%=location+dish.getPicture().trim()%>" alt="<%= dish.getName()%>">
                    </div>

                    <div class="col-md-4">
                        <h3>Descripci&oacute;n</h3>
                        <p><%= dish.getDescription()%></p>
                        <h3>Categorias</h3>
                        <ul>
                        <%
                            Set<Category> categories = dish.getCategories();
                            for (Category cat: categories) {
                        %>
                            <li><%= cat.getName()%></li>
                        <%  } %>
                        </ul>
                    </div>
                </div>
                <!-- /.row -->
                <!-- Related Projects Row -->
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Platillos relacionados</h3>
                    </div>
                    <%
                    Class.forName("org.neo4j.jdbc.Driver");
                    try {
                        Connection con = Config.connectToNeo4j("neo4j","n0m3l0s3");
                        ItemRecommender ir = new ItemRecommender();
                        ResultSet rs = ir.getRecommendationsForItem(dishId, 4, con);
                        int i = 0;
                        while (i < 4 && rs.next()) {
                            Map<String, Object> res = (Map<String, Object>) rs.getObject("reco");
                            Dish reco = ddi.findByName((String) res.get("name"));
                    %>
                    <div class="col-sm-3 col-xs-6">
                        <a href="information.jsp?dish=<%= reco.getId()%>">
                        <img class="img-responsive portfolio-item" src="<%=location+reco.getPicture().trim()%>" alt="<%= reco.getName()%>">
                        <p><%= reco.getName()%></p>
                        </a>
                    </div>
                    <%
                        i++;
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                </div>
                <% } else {
                    //Delete cookie
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                %>
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">No se encontró el platillo :(</h2>
                    </div>
                </div>
                <% } %>
            </div>
        </div>


        <!-- CONTENT-WRAPPER SECTION END-->
        <footer>
            <div class="container">
                <div class="row">
                </div>
            </div>
        </footer>
        <!-- FOOTER SECTION END-->
        <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY SCRIPTS -->
        <script src="js/jquery-1.11.1.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="js/bootstrap.js"></script>
    <%
        } else {
            //If dish id is not especified, redirect to index page
            response.sendRedirect("index.jsp");
        }
    %>
    </body>
    <script>
        function search(){
            var searching = document.getElementById("search-box").value;
            window.location = "results.jsp?search="+searching;
        }
    </script>
</html>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
