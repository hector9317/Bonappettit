<!DOCTYPE html>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.aht.dao.dish.DishDAOImpl"%>
<%@page import="com.aht.domain.Dish"%>
<html>
    <head>
        <!--  <meta charset="utf-8" />-->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
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
                                <li><a class="menu-top-active"  href="form.jsp">Agregar</a></li>
                                <!--<li><a href="modify_or_delete.jsp">Modificar o Eliminar</a></li>-->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="content-wrapper">
            <div class="container">
                <div class="row">
                    <form role="form" method="post" action="create.jsp">
                        <div class="col-lg-4">
                            <div class="well well-sm">
                                <strong><span class="glyphicon glyphicon-asterisk"></span>Campos
                                    Requeridos</strong>
                            </div>
                            <hr>

                            <div class="form-group">
                                <label for="InputName">Nombre:</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="nombre"
                                           id="InputName" placeholder="Agrega un Nombre" required>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                            <hr>
                            <div class="form-group">
                                <label for="InputName">Apellido Paterno:</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="apellido_paterno"
                                           id="InputName" placeholder="Agrega un Nombre" required>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                            <hr>
                            <div class="form-group">
                                <label for="InputName">Apellido Materno:</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="apellido_materno"
                                           id="InputName" placeholder="Agrega un Nombre" required>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                            <hr>
                            <div class="form-group">
                                <label for="InputName">Genero:</label>
                                <div class="input-group">

                                    <select id="listaDeshabilitada" class="form-control" name="nacionalidad" required>
                                        <option value="1"></option>
                                        <option value="2"></option>
                                        
                                    </select>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-asterisk"></span></span>
                               
                                    </div>
                                         
                            </div> 
                                <hr>
                                <div class="form-group">
                                    <label for="InputName">Fecha de Nacimiento:</label>
                                    <div class="input-group">
                                        <input type="date" class="form-control" name="fecha_nacimiento"
                                               id="InputName" placeholder="Agrega un Nombre" required>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-asterisk"></span></span>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group">
                                <label for="InputName">Nacionalidad :</label>
                                <div class="input-group">

                                    <select id="listaDeshabilitada" class="form-control" required>
                                        
                                     </select>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-asterisk"></span></span>
                               
                                    </div>
                                         
                            </div> 
                                <hr>
                                <div class="form-group">
                                    <label for="InputName">Correo Electronio:</label>
                                    <div class="input-group">
                                        <input type="email" class="form-control" name="email"
                                               id="InputName" placeholder="Agrega un Nombre" required>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-asterisk"></span></span>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <label for="InputName">ContraseÃ±a:</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" name="password"
                                               id="InputName" placeholder="Agrega un Nombre" required>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-asterisk"></span></span>
                                    </div>
                                </div>
                                <input type="submit"
                                       name="submit" id="submit" value="guardar"
                                       class="btn btn-info pull-right">
                            </div>
                    </form>

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
        <script src="js/jquery-1.11.1.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/script.js"></script>    
    </body>
</html>
<%@page contentType="text/html" pageEncoding="utf-8"%>