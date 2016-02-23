<%@ page import="java.util.LinkedList" %>-
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
        <div class="navbar navbar-inverse set-radius-zero">
            <div class="container">
                <img src="img/bonappetit.png" style="width: 60px;padding-top:5px;padding-bottom: 5px;">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
            </div>
        </div>
        <!-- LOGO HEADER END-->
        <section class="menu-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-lg-5" style="padding-top: 3px">
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
                                <li><a href="perfil_user.jsp">Mi Perfil</a></li>
                                <li><a href="modify_or_delete.jsp">Mis Platillos</a></li>
                                <li><a href="#">Cerrar Sesi&oacute;n</a></li>
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
                int quantity = 6;
                int pagination = Integer.parseInt(String.valueOf(Math.round(Math.random()* (842/6))));
                LinkedList<Dish> dishes = ddi.retrieveSome(pagination,quantity);
                String location = "var/";
            %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">Lo M&aacute;s Relevante</h4>
                </div>
                <%
                    for(int i=0; i < 3; i++){
                        Dish d = dishes.get(i);
                %>
                <div class="col-md-4 portfolio-item">
                     <a href="#">
                         <img class="img-responsive" src="<%=location+d.getPicture().trim()%>" alt="<%= d.getName()%>">
                     </a>
                     <h3>
                         <a href="information.jsp?dish=<%=d.getId()%>"><%= d.getName()%></a>
                     </h3>

                    </div>
                    <% } %>
            </div>
            <div class="row">
                    <%
                         for(int i=3; i < 6; i++){
                             Dish d = dishes.get(i);
                     %>
                <div class="col-md-4 portfolio-item">
                     <a href="#">
                         <img class="img-responsive" src="<%=location+d.getPicture().trim()%>" alt="<%= d.getName()%>">
                     </a>
                     <h3>
                         <a href="information.jsp?dish=<%=d.getId()%>"><%= d.getName()%></a>
                     </h3>

                    </div>
                    <% } %>
            </div>
        </div>
        <hr>
            <%
            Cookie[] cookies = request.getCookies();
            if(cookies != null && cookies.length > 1) {
                LinkedList<Long> ids= new LinkedList<Long>();
                LinkedList<Integer> visualisations= new LinkedList<Integer>();
                for(int i=0; i < cookies.length; i++){
                    if(!cookies[i].getName().equals("JSESSIONID")){
                        ids.add(Long.parseLong(cookies[i].getName()));
                        visualisations.add(Integer.parseInt(cookies[i].getValue()));
                    }
                }
                int numberOfRecommendations = 6;
                Class.forName("org.neo4j.jdbc.Driver");
                try {
                    Connection con = Config.connectToNeo4j("neo4j","burros93");
                    ItemRecommender ir = new ItemRecommender();
                    ResultSet rs = ir.getItemBasedRecommendations(ids, visualisations, numberOfRecommendations, con);
        %> 
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="page-head-line">Recomendado para ti</h4>
                    </div>
                    <%
                        int i = 0;
                        while (i < 3 && rs.next()) {
                            Map<String, Object> res = (Map<String, Object>) rs.getObject("reco");
                            Dish reco = ddi.findByName((String) res.get("name"));
                    %>
                    <div class="col-md-4 portfolio-item">
                        <a href="#">
                            <img class="img-responsive" src="<%=location+reco.getPicture().trim()%>" alt="<%= reco.getName()%>">
                        </a>
                        <h3><a href="information.jsp?dish=<%= reco.getId()%>"><%= reco.getName()%></a></h3>
                    </div>-->
                     <%
                        i++;
                    }
                %>
                </div>
                <div class="row">
                     <%
                        while (i < numberOfRecommendations && rs.next()) {
                            Map<String, Object> res = (Map<String, Object>) rs.getObject("reco");
                            Dish reco = ddi.findByName((String) res.get("name"));
                    %>
                    <div class="col-md-4 portfolio-item">
                        <a href="#">
                            <img class="img-responsive" src="<%=location+reco.getPicture().trim()%>" alt="<%= reco.getName()%>">
                        </a>
                        <h3><a href="information.jsp?dish=<%= reco.getId()%>"><%= reco.getName()%></a></h3>
                    </div>
                    <%
                            i++;
                        }
                    %>
                </div>
            </div>
             <%
            } catch (Exception e){
                e.printStackTrace();
            }
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
    <!--<script>
        function search(){
            var searching = document.getElementById("search-box").value;
            window.location = "results.jsp?search="+searching
        }
    </script>-->
</html>
