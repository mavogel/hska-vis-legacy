<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<title><s:text name="register.head" /></title>
		<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-theme.min.css">
		<link rel="stylesheet" type="text/css" href="../bootstrap/css/custom.css">
		<script type="text/javascript" src="jquery/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<nav class="navbar navbar-default " role="navigation">
	
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="http://www.iwi.hs-karlsruhe.de">Informatik</a>
				</div>
				<div >
					<ul class="nav navbar-nav">
					</ul>
				</div>
			</div>
		</nav>
	
		<div class="container">
			<div class="row">
					<h2> Registrierung </h2>
			</div>
			<div class="row">
				<div class="col-xs-8">
					<s:form action="RegisterAction" theme="simple">
						<div class = "form-group">
							<label>Vorname*:</label>
							<s:textfield name="firstname" cssClass ="form-control" required="true" />
						</div>
						
						<div class = "form-group">
							<label>Nachname*:</label>
							<s:textfield name="lastname" cssClass ="form-control"	required="true" />
						</div>
						
						<div class = "form-group">
							<label>Username*:</label>
							<s:textfield name="username" cssClass ="form-control" required="true" />
						</div>
						
						<div class = "form-group">
							<label>Passwort*:</label>
							<s:password name="password1" cssClass ="form-control" required="true" />
						</div>
						
						<div class = "form-group">
							<label>Passwort(wiederh.)*:</label>
							<s:password name="password2" cssClass ="form-control" required="true" />
						</div>
						<s:submit method="execute" key="register.submit" align="center" cssClass="btn btn-success" />
					</s:form>
				</div>
			</div>
			</div>
		<s:actionerror/>
		
		<s:actionmessage/>
	
	</body>
</html>