<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title><s:text name="categories.head" /></title>
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
					<s:text name="categories.title" />
				</h2>		
			</div>
		<!-- Form to add a new Category in DB: -->
			<div class="row">
				<div class="col-xs-8">
					<s:form action="AddCategoryAction" theme="simple">
						<div class = "form-group">
							<label>Name Kategorie</label>
							<s:textfield name="newCatName" required="true" cssClass ="form-control" />
						</div>
						<s:submit method="execute" key="category.submit" cssClass="btn btn-success"/>
					</s:form>
				</div>
			</div>
				
		<font color="red"> <s:actionerror />
		</font>
	
		<div id="categories">
			<table class="table table-striped">
				<tr class="header">
					<td><s:text name="categories.nr" /></td>
					<td><s:text name="categories.name" /></td>
					<td></td>
				</tr>
				<s:iterator value="categories" status="rowstatus">
					<tr>
					<s:if test="#rowstatus.odd == true">
						<td class="odd"><s:property value="id" />
						<td class="odd"><s:property value="name" /></td>
						<td class="odd"><a href="<s:url action="DeleteCategoryAction"><s:param name="catId" value="id" /></s:url>"><img src="img/delBtn.png" alt="<s:text name="product.delete" />"/></a></td>
					</s:if>
					<s:else>
						<td><s:property value="id" /></td>
						<td><s:property value="name" /></td>
						<td><s:form action ="DeleteCategoryAction" >
								<s:hidden name="catId" value="%{id}" />
								<s:submit value="loeschen"/>
							</s:form>
							</td>
					</s:else>
					</tr>
				</s:iterator>
				
			</table>
		</div>
	</div>
			<s:actionerror/>
		
		<s:actionmessage/>
	
	</body>
</html>