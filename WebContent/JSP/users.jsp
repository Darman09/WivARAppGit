<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WivArt' - Information Expostion</title>
<%@include file="/JSP/header.jsp"%>
<script type="text/javascript" src="js/users.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('ul.tabs').tabs();
		$('.modal').modal();
		$('select').material_select();
		$('.chips').material_chip();
		$('.tooltipped').tooltip({
			delay : 50
		});
	});
</script>
</head>
<body>
	<form method="post" action="users" id="formUsers">
		<input type="hidden" name="idUser" id="idUser">
		<nav>
			<%@include file="/JSP/menu.jsp"%>
			<%@include file="/JSP/disconnect.jsp"%>
		</nav>
		<div class="contenair">
			<div class="row">
				<div class="col s12">
					<h1 id="nomOeuvre">Liste des utilisateurs</h1>
				</div>
				<div class="col s12 input-field">
					<label for="searchUser">Rechercher</label> <input type="text"
						id="searchUser">
				</div>
				<div class="col s12">
					<ul class="collection" id="listUser">

					</ul>
				</div>
				<div class="fixed-action-btn toolbar">
					<a class="btn-floating btn-large dark-purple"> <i
						class="large material-icons">settings</i>
					</a>
					<ul>
						<li class="waves-effect waves-light tooltipped"
							data-position="top" data-tooltip="Créer un utilisateur"><a
							href="#createUser"><i class="material-icons">add</i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</form>
	<%@include file="/JSP/modal/modalDeleteUser.jsp"%>
	<%@include file="/JSP/modal/modalAddUser.jsp"%>
	<!--JavaScript at end of body for optimized loading-->
	<script type="text/javascript" src="js/materialize.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".button-collapse").sideNav({
				edge : 'right',
			});
			$('ul.tabs').tabs();
			$('.modal').modal();
			$('select').material_select();
			$('.chips').material_chip();
			$('.tooltipped').tooltip({
				delay : 50
			});
		});
	</script>
</body>
</html>