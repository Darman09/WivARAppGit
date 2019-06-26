<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WivArt' - Informations Utilisateur</title>
<%@include file="/JSP/header.jsp"%>
</head>
<body>
	<script type="text/javascript">
	/**
	 * Filtre type d'oeuvre
	 */
	db.collection("type_utilisateur").get().then(
			function(querySnapshot) {
				var select = ' ';
				querySnapshot.forEach(function(doc) {
					select += '<option value="' + doc.id + '">'
					+ doc.data().nom_type_utilisateur + '</option>';
				});
				$("#typeUserModify").append(select);
			});
	db.collection("espace_culturel").get().then(
			function(querySnapshot) {
				var select = ' ';
				querySnapshot.forEach(function(doc) {
					select += '<option value="' + doc.id + '">'
					+ doc.data().nom_espace_culturel + '</option>';
				});
				$("#espaceCulturelUserModify").append(select);
			});
/**
*	Initialisation des éléments de l'oeuvre
*/
db.collection("users").doc("${idUser}").get().then(function(doc) {
    if (doc.exists) {
    	// Tableau
		$("#nomUserTable").text(doc.data().name);
		$('#mailUserTable').text(doc.data().email)
		$('#sexeUserTable').text(doc.data().gender);
		$('#phoneUserTable').text(doc.data().phone);
		$('#ageUserTable').text(doc.data().age);
		
		// Modal Modification Utilisateur
		$("#nomUserModify").val(doc.data().name);
		$('#typeUserModify').val(doc.data().type_User_id)
		$('#genreUserModify').val(doc.data().gender);
		$('#ageUserModify').val(doc.data().age);
		$('#telephoneUserModify').val(doc.data().phone);
		$('#mailUserModify').val(doc.data().email);
		$('#typeUserModify').val(doc.data().type_User_id);
		var droits = doc.data().type_User_id;
		db.collection("type_utilisateur").doc(droits).get().then(
				function(doc) {
					if(doc.exists) {
						$("#droitUserTable").text(doc.data().nom_type_utilisateur);
						$("#nomExpositionOeuvreModify").val(doc.data().nom_exposition);
					} else {
						$("#droitUserTable").text("-");
					}
				});

		var espaceCulturel = doc.data().id_espaceCulturel;
		if (espaceCulturel === '') {
			espaceCulturel = "none";
		}
		db.collection("espace_culturel").doc(espaceCulturel).get().then(
				function(doc) {
					if(doc.exists) {
						$("#espaceCultuerlUserTable").text(doc.data().nom_espace_culturel);
						$("#espaceCulturelUserModify").val(doc.id);
					} else {
						$("#espaceCultuerlUserTable").text("-");
						$("#espaceCulturelUserModify").val("");
					}
				});
    } else {
        console.log("No such document!");
    }
}).catch(function(error) {
    console.log("Error getting document:", error);
});

function modifyUser(){
	var nomUser = $('#nomUserModify').val();
	var typeUser = $('#typeUserModify').val();
	var espaceCulturelUser = $('#espaceCulturelUserModify').val();
	var genreUser = $('#genreUserModify').val();
	var ageUser = $('#ageUserModify').val();
	var mailUser = $('#mailUserModify').val();
	var telephoneUserModify = $('#telephoneUserModify').val();
	if (nomUser === '') {
		console.log(ageUser);
		console.log(ageUser);
		Materialize.toast("Nom de l'oeuvre manquant", 3000);
		return;
	}
	if (typeUser === '') {
		Materialize.toast("Date de debut creation manquante", 3000);
		return;
	}
	if (genreUser === '') {
		Materialize.toast("Date de fin de creation manquante", 3000);
		return;
	}
	if (ageUser === '') {
		Materialize.toast("Description manquante", 3000);
		return;
	}
	if (mailUser === '') {
		Materialize.toast("Nom de l'oeuvre manquant", 3000);
		return;
	}
	if (telephoneUserModify === '') {
		Materialize.toast("Type de l'oeuvre manquant", 3000);
		return;
	}
	db.collection("users").doc("${idUser}").update({
		age: ageUser.toString(),
		email: mailUser.toString(),
		gender: genreUser.toString(),
		id_espaceCulturel: espaceCulturelUser.toString(),
		name: nomUser.toString(),
		phone: telephoneUserModify.toString(),
		type_User_id: typeUser.toString()
	}).then(function() {
		$('#formUserInfo').submit();
	});
}

</script>
	<form method="POST" action="userInfo" id="formUserInfo">
		<nav>
			<%@include file="/JSP/menu.jsp"%>
			<%@include file="/JSP/disconnect.jsp"%>
		</nav>
	</form>
	<div class="contenair">
		<div class="row">
			<div class="col s12">
				<h1 id="nomOeuvre"></h1>
			</div>
			<div class="col s12">
				<table>
					<thead>
						<tr>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Nom</td>
							<td id="nomUserTable"></td>
						</tr>
						<tr>
							<td>Adresse mail</td>
							<td id="mailUserTable"></td>
						</tr>
						<tr>
							<td>Sexe</td>
							<td id="sexeUserTable"></td>
						</tr>
						<tr>
							<td>Téléphone</td>
							<td id="phoneUserTable"></td>
						</tr>
						<tr>
							<td>Âge</td>
							<td id="ageUserTable"></td>
						</tr>
						<tr>
							<td>Droit</td>
							<td id="droitUserTable"></td>
						</tr>
						<tr>
							<td>Espace Culturel Associé</td>
							<td id="espaceCultuerlUserTable"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="fixed-action-btn toolbar">
				<a class="btn-floating btn-large dark-purple"> <i
					class="large material-icons">settings</i>
				</a>
				<ul>
					<li class="waves-effect waves-light tooltipped" data-position="top"
						data-tooltip="Modifier l'utilisateur"><a href="#modifyUser"><i
							class="material-icons">how_to_reg</i></a></li>
				</ul>
			</div>
			<%@include file="/JSP/modal/modalModifyUser.jsp"%>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript">
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
</html>