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
		<nav class="navbar navbar-default" role="navigation">
			<div class = "navbar-header">
				<a class="navbar-brand" href="#">Bonappettit</a>
			</div>
		</nav>
		<div class="container">
			<h4 class="red">Favor de llenar todos los campos</h4>
			<form role="form">
				<div class="container-fluid">
					<div class="row">
						<div class="class='col-xs-6 col-sm-4 col-md-4 col-lg-4 posicion">
							<input type="text" id="nombre" name="nombre" class="form-control campoTexto" placeholder="Ingrese su nombre" required="required">
						</div>
						<div class="class='col-xs-6 col-sm-4 col-md-4 col-lg-4 posicion">
							<input type="text" id="paterno" name="paterno" class="form-control campoTexto" placeholder="Ingrese su apellido paterno" required="required">
						</div>
						<div class="class='col-xs-6 col-sm-4 col-md-4 col-lg-4 posicion">
							<input type="text" id="materno" name="materno" class="form-control campoTexto" placeholder="Ingrese su apellido materno" required="required">
						</div>
					</div>
				</div>						
			</form>
		</div>
	</body>
</html>



<!--
<!DOCTYPE html>
<html>
    <head>
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
                                <label for="Name">Nombre:</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="Name"
                                           id="Name" placeholder="Agrega un Nombre" required>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                            <hr>
                            <div class="form-group">
                                <label for="last_name_1">Apellido Paterno:</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="last_name_1"
                                           id="last_name_1" placeholder="Agrega un Nombre" required>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                            <hr>
                            <div class="form-group">
                                <label for="last_name_2">Apellido Materno:</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="last_name_2"
                                           id="last_name_2" placeholder="Agrega un Nombre" required>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                            <hr>
                            <div class="form-group">
                                <label for="gender">Genero:</label>
                                <div class="input-group">

                                    <select id="listaDeshabilitada" class="form-control" name="gender"required>
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                        
                                    </select>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-asterisk"></span></span>
                               
                                    </div>
                                         
                            </div> 
                                <hr>
                                <div class="form-group">
                                    <label for="birth_day">Fecha de Nacimiento:</label>
                                    <div class="input-group">
                                        <input type="date" class="form-control" name="birth_day"
                                               id="InputName" required>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-asterisk"></span></span>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group">
                                <label for="nationality">Nacionalidad :</label>
                                <div class="input-group">

                                    <select id="listaDeshabilitada" class="form-control" name="nationality" required>
                                        <option value="0">Alemania</option>
                                        <option value="1">Argentina</option>
                                        <option value="2">Australia</option>
                                        <option value="3">Bélgica</option>
                                        <option value="4">Brasil</option>
                                        <option value="5">Canadá</option>
                                        <option value="6">Chile</option>
                                        <option value="7">China</option>
                                        <option value="8">Colombia</option>
                                        <option value="9">Corea del Norte</option>
                                        <option value="10">Corea del Sur</option>
                                        <option value="11">Costa Rica</option>
                                        <option value="12">Croacia</option>
                                        <option value="13">Ecuador</option>
                                        <option value="14">España</option>
                                        <option value="15">Estados Unidos</option>
                                        <option value="16">Francia</option>
                                        <option value="17">Grecia</option>
                                        <option value="18">Guatemala</option>
                                        <option value="19">Honduras</option>
                                        <option value="20">Irlanda</option>
                                        <option value="21">Italia</option>
                                        <option value="22">Japón</option>
                                        <option value="23">México</option>
                                        <option value="24">Noruega</option>
                                        <option value="25">Nueva Zelanda</option>
                                        <option value="26">Panamá</option>
                                        <option value="27">Paraguay</option>
                                        <option value="28">Perú</option>
                                        <option value="29">Portugal</option>
                                        <option value="30">Rumanía</option>
                                        <option value="31">Rusia</option>
                                        <option value="32">Suecia</option>
                                        <option value="33">Suiza</option>
                                        <option value="34">Tailandia</option>
                                        <option value="35">Turquía</option>
                                        <option value="36">Uruguay</option>
                                        <option value="37">Venezuela</option>
                                     </select>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-asterisk"></span></span>
                               
                                    </div>
                                         
                            </div> 
                                <hr>
                                <div class="form-group">
                                    <label for="email">Correo Electronio:</label>
                                    <div class="input-group">
                                        <input type="email" class="form-control" name="email"
                                               id="email" placeholder="Agrega un Nombre" required>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-asterisk"></span></span>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <label for="password">Contraseña:</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" name="password"
                                               id="password" placeholder="Agrega un Nombre" required>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-asterisk"></span></span>
                                    </div>
                                </div>
                               <  
                                   //guardar en la base de datos la fecha en que se registro el usuario
                                //pero no se mostrara en la pagina
                                 
Date fecha=new Date(); 
String sFecha = ""; 
int iEntero = fecha.getDate(); 
sFecha = String.valueOf(iEntero); 
iEntero = fecha.getMonth(); 
sFecha = sFecha + "/" + String.valueOf(iEntero); 
iEntero = fecha.getYear() + 1900; 
sFecha = sFecha + "/" + String.valueOf(iEntero); 

out.print("<span class='style2'>La fecha actual es: </span>" + sFecha); 
%>
                               
                    </form>

                </div>
            </div>
        </div>
        </div>
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
<page contentType="text/html" pageEncoding="utf-8"%>
-->


