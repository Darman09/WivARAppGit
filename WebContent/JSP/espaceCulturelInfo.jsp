<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WivArt' - Informations Espace Culturel</title>
<%@include file="/JSP/header.jsp"%>
</head>
<body>
	<script type="text/javascript">
	db.collection("espace_culturel").doc("${idEspaceCulturel}").get().then(
			function(doc) {
				console.log(doc.data());
				if(doc.exists) {
					$("#nomEspaceCulturel").text(doc.data().nom_espace_culturel);
					$("#nomEspaceCulturelTable").text(doc.data().nom_espace_culturel);
					$("#imgEspaceCulturel").attr("src",doc.data().image_espace_culturel);
					$("#descriptionEspaceCulturel").text(doc.data().description_espace_culturel);
					var idTypeEspaceCulturel = doc.data().id_type_espace_culturel;
					db.collection("type_espace_culturel").doc(idTypeEspaceCulturel).get().then(
							function(doc) {
								console.log(doc.data());
								if(doc.exists) {
									$("#typeEspaceCulturel").text(doc.data().nom_type_espace_culturel);
								} else {
									$("#typeEspaceCulturel").text("Inconnu");
								}
							});
					var idAdresseEspaceCulturel = doc.data().id_adresse_espace_culturel
					db.collection("adresse").doc(idAdresseEspaceCulturel).get().then(
							function(doc) {
								if(doc.exists) {
									var idVille = doc.data().id_ville
									var adresse = doc.data().numero_adresse + " "+ doc.data().route_adresse + ", "; 
									db.collection("ville").doc(idVille).get().then(
											function(doc) {
												if(doc.exists) {
													adresse += doc.data().nom_ville + ", ";
													db.collection("region").doc(doc.data().id_region).get().then(
															function(doc) {
																if(doc.exists) {
																	adresse += doc.data().nom_region + " / " + doc.data().code_region;
																	$("#adresseEspaceCulturel").text(adresse);
																} else {
																	$("#adresseEspaceCulturel").text("Inconnu");
																}
															});
												} else {
													$("#adresseEspaceCulturel").text("Inconnu");
												}
											});
									$("#adresseEspaceCulturel").text(doc.data().nom_adresse);
								} else {
									$("#adresseEspaceCulturel").text("Inconnu");
								}
							});
				} else {
					$("#nomEspaceCulturel").text("Pas de nom");
					$("#imgEspaceCulturel").attr("src","https://firebasestorage.googleapis.com/v0/b/wivart-d15a2.appspot.com/o/noimage.jpg?alt=media&token=69f0869f-1dbe-4268-9ce5-81916050149f");
				}
			});
	</script>
	<form method="POST" action="quizzInfo" id="formQuizzInfo">
		<nav>
			<%@include file="/JSP/menu.jsp"%>
			<%@include file="/JSP/disconnect.jsp"%>
		</nav>
	</form>
	<div class="contenair">
	<div class="row">
	<div class="col s12"><h1 id="nomEspaceCulturel"></h1></div>
		<div class="col s3"> 
			<img class="responsive-img" id="imgEspaceCulturel">
		</div>
		<div class="col s9">
			<table>
				<thead>
					<tr>
						<th></th>
						<th>Informations</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Nom</td>
						<td id="nomEspaceCulturelTable">${idEspaceCulturel}</td>
					</tr>
					<tr>
						<td>Description</td>
						<td id="descriptionEspaceCulturel"></td>
					</tr>
					<tr>
						<td>Type d'exposition</td>
						<td id="typeEspaceCulturel"></td>
					</tr>
					<tr>
						<td>Adresse</td>
						<td id="adresseEspaceCulturel"></td>
					</tr>
				</tbody>
			</table>
		</div>
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