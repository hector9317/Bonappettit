<%@ page import="java.util.LinkedList" %>
<%@ page import="com.aht.dao.dish.DishDAOImpl" %>
<%@ page import="com.aht.domain.Dish" %>
<%@ page import="sun.awt.image.ImageWatched" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.aht.api.engine.ItemRecommender" %>
<%@ page import="com.aht.api.config.Config" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
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
                        <li><a href="form.jsp">Agregar</a></li>
                        <!-- ________________________________________________________________________________________________________________________________________________________________ -->
                        <!-- <li><a href="modify_or_delete.jsp">Modificar o Eliminar</a></li> -->
                    </ul>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- MENU SECTION END-->
<div class="content-wrapper">
    <%
        DishDAOImpl ddi = new DishDAOImpl();
        int numberOfRecommendations = 12;
        Class.forName("org.neo4j.jdbc.Driver");
        String search = request.getParameter("search");
        try {
            Connection con = Config.connectToNeo4j("neo4j","burros93");
            ItemRecommender ir = new ItemRecommender();
            ResultSet rs = ir.selectItemLike(search, numberOfRecommendations, con);
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line">Resultados para <i><%=search%></i></h4>
            </div>
            <%
                int i = 0;
                String location = "var/";
                while (i < 3 && rs.next()) {
                    Map<String, Object> res = (Map<String, Object>) rs.getObject("dish");
                    Dish dish = ddi.findByName((String) res.get("name"));
            %>
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="<%=location+dish.getPicture().trim()%>" alt="<%= dish.getName()%>">
                </a>
                <h3><a href="information.jsp?dish=<%= dish.getId()%>"><%= dish.getName()%></a></h3>
            </div>
            <%
                    i++;
                }
            %>
        </div>
        <% for(int j=2; j <= 4; j++) {%>
        <div class="row">
            <%
                while (i < 3*j && rs.next()) {
                    Map<String, Object> res = (Map<String, Object>) rs.getObject("dish");
                    Dish dish = ddi.findByName((String) res.get("name"));
            %>
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="<%=location+dish.getPicture().trim()%>" alt="<%= dish.getName()%>">
                </a>
                <h3><a href="information.jsp?dish=<%= dish.getId()%>"><%= dish.getName()%></a></h3>
            </div>
            <%
                    i++;
                }
            %>
        </div>
        <% } %>
    </div>
    <%
            } catch (Exception e) {
                e.printStackTrace();
            }
    %>
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
</body>
<script>
    function search(){
        var searching = document.getElementById("search-box").value;
        window.location = "results.jsp?search="+searching;
    }
</script>
</html>
