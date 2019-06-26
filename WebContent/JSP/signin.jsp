<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>WivArt' - Connexion</title>
<%@include file="/JSP/header.jsp"%>
<script type="text/javascript" src="js/connexion.js"></script>
</head>
<body>
	<nav>
	<form method="post" action="signin" id="formSignin">
	<input type="hidden" name="idUserSignin" id="idUserSignin" value="none"/>
		<div class="nav-wrapper dark-purple">
			<ul>
				<li>
					<h5 style="margin-top: 17px !important; margin-left: 10px;">
						WivArt'</h5>
				</li>
			</ul>
		</div>
	</form>
	</nav>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row">
		<div class="col offset-l3 l6 s12">
			<div class="card-panel">
				<h3 class="card-title dark-purple-text">Connexion</h3>
				<div class="card-content">
					<div class="row">
						<div class="input-field col s12">
							<input id="login" type="text" class="validate"> <label
								for="login">Identifiant*</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<input id="password" type="password" class="validate"> <label
								for="password">Mot de passe*</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<a class="btn-flat col s12 dark-purple center-align"
								onclick="connect();">Valider</a>
						</div>
					</div>
					<div class="row">
						<span class="red-text col s12">*Ces informations sont
							obligatoires</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/materialize.min.js"></script>
</body>
</html>