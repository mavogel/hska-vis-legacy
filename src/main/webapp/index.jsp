<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>VS Labor Webshop mit Bootstrap 3 </title>
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.min.css">
		<link rel="stylesheet" type="text/css" href="bootstrap/css/custom.css">
		<script type="text/javascript" src="jquery/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<nav id="myNavbar"
			class="navbar navbar-default navbar-inverse navbar-fixed-top"
			role="navigation">
	
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="http://www.iwi.hs-karlsruhe.de">Informatik</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="nav navbar-nav">
					</ul>
				</div>
			</div>
		</nav>
	
		<div class="jumbotron">
			<div class="container-fluid">
				<h1>VS Lab EShop </h1>
			</div>
		</div>
	
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-4">
					<h2>Login</h2>
					<s:form action="LoginAction" focusElement="username" theme="simple"> 
							
						<div class = "form-group">
							<label>Username<font color="red">*</font>:</label>
							<s:textfield name="username" placeholder="Username" required ="true" cssClass ="form-control"/>
						</div>
						
						<div class = "form-group">
							<label>Passwort <font color="red">*</font></label>
							<s:password name="password" placeholder="Passwort" cssClass = "form-control" />
						</div>
							
						<div class = "pull-right">
							<s:submit method="execute" value="login" align="center" cssClass="btn btn-success"/>
						</div>
							
						<div>
							<p><a href="./pages/register.jsp">Noch nicht registriert?</a> </p>
			 			</div>
					</s:form>
				</div>
			</div>

			<font color="red">
				${message }		
			</font>	
			
			<div class="row">
				<div class="col-xs-12">
					<footer>
						<p>&copy; Copyright 2016 Informatik -  Hochschule Karlsruhe</p>
					</footer>
				</div>
			</div>
		</div>
		
	<font color="red">
		<s:actionerror/>
	</font>	
	</body>
</html>

