<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<title><s:text name="product.add.head" /></title>
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.min.css">
		<link rel="stylesheet" type="text/css" href="bootstrap/css/custom.css">
		<script type="text/javascript" src="jquery/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="http://www.iwi.hs-karlsruhe.de">Informatik</a>
				</div>
				<div>
					<ul class="nav navbar-nav">
						<li><a href="<s:url action="listAllProducts" />">Alle Produkte</a>
						<s:if test="#session.webshop_user.role.level==0">   <!-- if admin -->
							<li><a href="./InitCategorySiteAction.action?pageToGoTo=p"><s:text name="product.add" /></a></li>
							<li><a href="./InitCategorySiteAction.action?pageToGoTo=c"><s:text name="categories.edit" /></a></li>
						</s:if>
					</ul>
				    <div>
						<nav class="nav navbar-nav navbar-right">
							<li><a href="<s:url action = "LogoutAction"/>">Logout</a></li>
						</nav>
				    </div>
				</div>
			</div>
		</nav>
		<div class="container">
			<div class="row">
				<s:text name="login.status" /> 	${webshop_user.firstname} ${webshop_user.lastname}
			</div>
	
			<div class="row">
				<h2>
					<s:text name="product.add.title" />
				</h2>
			</div>
			<div class="row">
				<div class="col-xs-8">
					
					<s:form action="AddProductAction" theme="simple" focusElement="name">
						<div class = "form-group">
							<label>Produktname*:</label>
							<s:textfield name="name" cssClass ="form-control"  required="true" />
						</div>
						
						<div class = "form-group">
							<label>Preis*:</label>
							<s:textfield name="price" cssClass ="form-control" required="true" />
						</div>
								
						<div class = "form-group">
							<label>Kategorie*:</label>
							<s:select name="categoryId" cssClass ="form-control"  list="categories" listKey="id" listValue="name" value="%{categories.{name}}" required="true" />
						</div>
						
						<div class = "form-group">
							<label>Beschreibung*:</label>
							<s:textarea name="details" cssClass ="form-control"  cols="15" rows="3" />
						</div>
						
					<s:submit method="execute" key="product.submit" cssClass="btn btn-success"/>
					<s:reset key="product.reset" cssClass="btn btn-default"/>
				</s:form>
	
				<font color="red">
					<s:actionerror />
				</font>
				
					</div>
				</div>
		</div>
	</body>
</html>