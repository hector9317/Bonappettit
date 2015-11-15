<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Sistema Recomendador De Comidas</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/styles.css" rel="stylesheet">
	</head>

	<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-ex1-collapse">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand page-scroll" href="#page-top">Sistema
						Recomendador de Comida</a>
				</div>
	
				<ul class="nav navbar-nav">
					<li><a class="page-scroll" href="./index.jsp">Menu
							Principal</a></li>
					<li class="dropdown"><a href="about.html"
						class="dropdown-toggle" data-toggle="dropdown">Platillo<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="./form_add_dishes.jsp">Agregrar Un Platillo</a></li>
	
						</ul></li>
					<li class="dropdown"><a href="about.html"
						class="dropdown-toggle" data-toggle="dropdown">Recomendaciones
							<b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="./searcher_for_dishes.jsp">Platillo</a></li>
							<li class="divider"></li>
							<li><a href="./test.jsp">Categoria</a></li>
	
						</ul></li>
				</ul>
			</div>
		</nav>
		<br>
		<br>
		<br>
		<div class="container">
			<div class="row">
				<form role="form" method="post" action="create.jsp">
					<div class="col-lg-6">
						<div class="well well-sm">
							<strong><span class="glyphicon glyphicon-asterisk"></span>Campos
								Requeridos</strong>
						</div>
						<div class="form-group">
							<label for="InputName">Nombre del Platillo</label>
							<div class="input-group">
								<input type="text" class="form-control" name="InputName"
									id="InputName" placeholder="Agrega un Nombre" required>
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-asterisk"></span></span>
							</div>
						</div>
						<div class="form-group">
							<label for="InputMessage">Ingredientes</label>
							<div class="input-group">
								<textarea name="InputMessage" id="InputMessage"
									placeholder="Agrega los ingredientes" class="form-control"
									rows="5" required></textarea>
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-asterisk"></span></span>
							</div>
						</div>
						<div class="row">
							<section id="intro" class="intro-section">
								<div class="container">
									<div class="row">
										<div class="col-lg-9">
											<div class="panel-group" id="accordion">
												<div class="panel panel-default" id="panel1">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-target="#collapseOne"
																href="#collapseOne" class="collapsed">Tipo </a>
														</h4>
	
													</div>
													<div id="collapseOne" class="panel-collapse collapse ">
														<div class="panel-body">
															<div class="form">
																<div class="container">
																	<div class="row vdivide">
																		<div class="col-xs-3">
																			<div style="height: auto; text-align: left">
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Panes y Masas">Panes y Masas
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Pastas">Pastas
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Bizcochos y Galletas">Bizcochos y Galletas
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Carnes">Carnes
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Aves">Aves
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Pescados y Mariscos">Pescados y Mariscos
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Ensaladas">Ensaladas
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Contenido Alcohólico">Contenido Alcoh&oacute;lico
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Salsas y Guarniciones">Salsas y Guarniciones
																				</label><label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Sopas y Cremas">Sopas y cremas
																				</label>
																			</div>
																		</div>
																		<div class="col-xs-3">
																			<div style="height: auto; text-align: left">
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Arroces">Arroces
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Legumbres y guisos">Legumbres y guisos
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Tartas y Dulces">Tartas y Dulces
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Helados y Sorbetes">Helados y Sorbetes
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Frutas">Frutas
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Verduras">Verduras
																				</label><label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Huevos">Huevos
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Lácteos">L&aacute;cteos
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Frutos Secos">Frutos Secos
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Encurtidos y Conservas">Encurtidos y Conservas
																				</label>
																			</div>
	
																		</div>
	
																		<div class="col-xs-4">
																			<div style="height: auto; text-align: left">
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Postre">Postre
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Bebida">Bebida
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Primeros Platos">Primeros Platos
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Segundos Platos">Segundos Platos
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Entradas">Entradas
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Acompañamiento">Acompa&ntilde;amiento
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Emparedados">Emparedados
																				</label>
																				<label class="checkbox">
																					<input type="checkbox" name="Tipo" value="Botana">Botana
																				</label>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="panel panel-default" id="panel2">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-target="#collapseTwo"
																href="#collapseTwo" class="collapsed">Sabor</a>
														</h4>
													</div>
													<div id="collapseTwo" class="panel-collapse collapse"
														style="text-align: left">
														<div class="panel-body">
															<div class="form">
																<div class="row vdivide">
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Sabor" value="Dulce">Dulce
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Sabor" value="Salado">Salado
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Sabor" value="Agrio">Agrio
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Sabor" value="Amargo">Amargo
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Sabor" value="Umami">Umami
																			</label><label class="checkbox">
																				<input type="checkbox" name="Sabor" value="Picante">Picante
																			</label>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="panel panel-default" id="panel3">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-target="#collapseThree"
																href="#collapseThree" class="collapsed">Ocasi&oacute;n</a>
														</h4>
	
													</div>
													<div id="collapseThree" class="panel-collapse collapse">
														<div class="panel-body">
															<div class="form">
																<div class="row vdivide">
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Ocasion" value="Halloween">Hallowen
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Ocasion" value="Navidad">Navidad
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Ocasion" value="San Valentin">San Valent&iacute;n
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Ocasion" value="Primavera">Primavera
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Ocasion" value="Verano">Verano
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Ocasion" value="Otoño">Oto&ntilde;o
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Ocasion" value="Invierno">Invierno
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Ocasion" value="Desayunos">Desayunos
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Ocasion" value="Almuerzos">Almuerzos
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Ocasion" value="Meriendas">Meriendas
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Ocasion" value="Ocación Especial">Ocasi&oacute;n Especial
																			</label>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="panel panel-default" id="panel4">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-target="#collapseFour"
																href="#collapseFour" class="collapsed">Regi&oacute;n </a>
														</h4>
													</div>
													<div id="collapseFour" class="panel-collapse collapse">
														<div class="panel-body">
															<div class="form">
																<div class="row vdivide">
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Italiana">Italiana
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Mediterránea">Mediterr&aacute;nea
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Asiática">Asiática
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Mexicana">Mexicana
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Americana">Americana
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Hindú">Hind&uacute;
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Francesa">Francesa
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Tailandesa">Tailandesa
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Cantonesa">Cantonesa
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Japonesa">Japonesa
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="China">China
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Medio Oriente">Medio Oriente
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Alemana">Alemana
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Argentina">Argentina
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Brasileña">Brasile&ntilde;a
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Colombiana">Colombiana
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Coreana">Coreana
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Cubana">Cubana
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Española">Espa&ntilde;ola
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Filandesa">Filandesa
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Griega">Griega
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Holandesa">Holandesa
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Region" value="Indonesia">Indonesia
																			</label>
																			<label class="checkbox">
																			<input type="checkbox" name="Region" value="Portuguesa">Portuguesa
																			</label>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="panel panel-default" id="panel5">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-target="#collapseFive"
																href="#collapseFive" class="collapsed">Salud </a>
														</h4>
													</div>
													<div id="collapseFive" class="panel-collapse collapse">
														<div class="panel-body">
															<div class="row vdivide">
																<div class="col-xs-4">
																	<div style="height: auto; text-align: left">
																		<label class="checkbox">
																			<input type="checkbox" name="Salud" value="Bajas en Colesterol">Bajas en Colesterol
																		</label>
																		<label class="checkbox">
																			<input type="checkbox" name="Salud" value="Diabéticos">Diab&eacute;ticos
																		</label>
																		<label class="checkbox">
																			<input type="checkbox" name="Salud" value="Sin Lactosa">Sin Lactosa
																		</label>
																	</div>
																</div>
																<div class="col-xs-4">
																	<div style="height: auto; text-align: left">
																		<label class="checkbox">
																			<input type="checkbox" name="Salud" value="Celiacos">Celiacos
																		</label>
																		<label class="checkbox">
																			<input type="checkbox" name="Salud" value="Alérgicos">Al&eacute;rgicos
																		</label>
																	</div>
																</div>
																<div class="col-xs-4">
																	<div style="height: auto; text-align: left">
																		<label class="checkbox">
																			<input type="checkbox" name="Salud" value="Bajar de Peso">Bajar de Peso
																		</label>
																		<label class="checkbox">
																			<input type="checkbox" name="Salud" value="Vegetarianos">Vegetarianos
																		</label>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="panel panel-default" id="panel6">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-target="#collapseSix" href="#collapseSix" class="collapsed">Temperatura </a>
														</h4>
													</div>
													<div id="collapseSix" class="panel-collapse collapse">
														<div class="panel-body">
															<div class="row vdivide">
																<div class="form" style="text-align: left">
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Temperatura" value="Frio">Frio
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																			<input type="checkbox" name="Temperatura" value="Templado">Templado
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																			<input type="checkbox" name="Temperatura" value="Caliente">Caliente
																			</label>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="panel panel-default" id="panel7">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-target="#collapseSeven" href="#collapseSeven" class="collapsed">Tipo De Persona</a>
														</h4>
													</div>
													<div id="collapseSeven" class="panel-collapse collapse">
														<div class="panel-body">
															<div class="row vdivide">
																<div class="form">
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Persona" value="Bebés">Beb&eacute;s
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Persona" value="Niños">Ni&ntilde;os
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Persona" value="Adultos">Adultos
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Persona" value="Familiares">Familiares
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Persona" value="Adultos Mayores">Adultos Mayores
																			</label>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="panel panel-default" id="panel8">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-target="#collapseEigth" href="#collapseEigth" class="collapsed">Textura </a>
														</h4>
													</div>
													<div id="collapseEigth" class="panel-collapse collapse">
														<div class="panel-body">
															<div class="form">
																<div class="row vdivide">
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Textura" value="Líquidas">L&iacute;quidas
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Textura" value="Blandas">Blandas
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Textura" value="Semi-Blandas">Semi-Blandas
																			</label>
																			<label class="checkbox">
																				<input type="checkbox" name="Textura" value="Duras">Duras
																			</label>
																		</div>
																	</div>
																	<div class="col-xs-4">
																		<div style="height: auto; text-align: left">
																			<label class="checkbox">
																				<input type="checkbox" name="Textura" value="Crujientes">Crujientes
																			</label>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br><br><br><input type="submit" name="submit" id="submit" value="Agregar" class="btn btn-info pull-right">
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.easing.min.js"></script>
		<script src="js/scrolling-nav.js"></script>
	</body>
</html>
