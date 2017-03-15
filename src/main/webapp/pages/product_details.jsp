<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<title><s:text name="details.head" /></title>
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
						<s:text name="details.title" />
					</h2>
			</div>
			<table class="table table-striped">
				<tr>
					<td><s:text name="details.name" /></td>
					<td><s:property value="product.name" /></td>
				</tr>
				<tr>
					<td><s:text name="details.price" /></td>
					<td><s:property value="product.price" /></td>
				</tr>
				<tr>
					<td><s:text name="details.category" /></td>
					<td><s:property value="product.category.name" /></td>
				</tr>
				<tr>
					<td><s:text name="details.details" /></td>
					<td><s:property value="product.details" /></td>
				</tr>
			</table>
	
			<a href="./SearchAction.action?id=<s:property value='id'/>&searchValue=<s:property value='searchValue'/>&searchMinPrice=<s:property value='searchMinPrice'/>&searchMaxPrice=<s:property value='searchMaxPrice'/>">[<s:text name="link.back" />]</a>
		</div>
	</body>
</html>