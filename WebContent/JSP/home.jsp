<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WivArt' - Mon Espace Culturel</title>
<%@include file="/JSP/header.jsp"%>
<script type="text/javascript">
db.collection("users").doc("${idUserConnected}").get()
.then(function(doc){
	if (doc.data().type_User_id == "2vF6KfGqERkbyD1q6BFF") {
		$("#espaceCulturel").css('display','block');
		var idEspaceCulturel = doc.data().id_espaceCulturel;
		db.collection("espace_culturel").doc(idEspaceCulturel).get().then(
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
									console.log(doc.data());
									if(doc.exists) {
										$("#adresseEspaceCulturel").text(doc.data().nom_type_espace_culturel);
									} else {
										$("#adresseEspaceCulturel").text("Inconnu");
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
	} else  {
		db.collection("espace_culturel")
		.get()
		.then(function(querySnapshot) {
			cards = ""
		    querySnapshot.forEach(function(doc) {
		    	cards += "<div class=\"col s12 m12 l4\"><div class=\"card\">	<div  style=\"max-height:300px !important;\" class=\"card-image waves-effect waves-block waves-light\"  onclick=\"document.getElementById('idEspaceCulturel').value ='"+doc.id+"';document.getElementById('button').value ='espaceCulturelInfo';$('#formHome').submit();\"><img style=\"max-height:100%\" class=\"activator responsive-img\" src=\""
		    	cards += doc.data().image_espace_culturel + "\"></div><div class=\"card-content\"><span class=\"card-title activator grey-text text-darken-4\">"
		    	cards += doc.data().nom_espace_culturel
		    	cards += "\</span></div></div></div>"
		    });
			$("#cards").append(cards);	
		})
			.catch(function(error) {
			    console.log("Error getting documents: ", error);
			});	
		$("#admin").css('display','block');
	}

}).catch(function(error){
	console.log("error :" + error);
});

$(document).ready(
		function() {
			$("#searchEC").on(
					"keyup",
					function() {
						var value = $(this).val().toLowerCase();
						$("#cards div div").filter(
								function() {
									$(this).parent().toggle(
											$(this).text().toLowerCase()
													.indexOf(value) > -1);
								});
						if ($('#searchEC').children().length === 0) {
							console.log("Pas de résultat");
						} else {
						
						}
					});
		});
</script>
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
</head>
<body>
	<nav>
		<form method="post" action="home" id="formHome">
			<%@include file="/JSP/menu.jsp"%>
			<%@include file="/JSP/disconnect.jsp"%>
		</form>
	</nav>
	<div id="espaceCulturel" class="row" style="display: none;">
		<div id="index-banner" class="parallax-container">
			<div class="section no-pad-bot"
				style="background-color: rgba(101, 17, 113, 0.18);">
				<div class="container">
					<br> <br>
					<h1 class="header center teal-text text-lighten-2"
						style="opacity: 1 !important;" id="nomEspaceCulturel"></h1>
					<br> <br>

				</div>
			</div>
			<div class="parallax">
				<img id="imgEspaceCulturel">
			</div>
		</div>
		<div class="col s12">
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
						<td id="nomEspaceCulturelTable"></td>
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
	<div id="admin" style="display: none;">
		<div class="row">
			<div class="col s12">
				<h1>Liste des espaces culturels</h1>
			</div>
			<div class="col s12 input-field">
				<label for="searchEC">Rechercher un espace culturel</label> <input
					type="text" id="searchEC">
			</div>
		</div>
		<div class="row" id="cards"></div>
	</div>
	<!--JavaScript at end of body for optimized loading-->
	<script type="text/javascript" src="js/materialize.min.js"></script>
	<script>
		(function($) {
			$(function() {

				$('.button-collapse').sideNav();
				$('.parallax').parallax();

			}); // end of document ready
		})(jQuery); // end of jQuery name space

		$('.dropdown-button').dropdown({
			inDuration : 300,
			outDuration : 225,
			constrainWidth : false, // Does not change width of dropdown to that of the activator
			hover : false, // Activate on hover
			gutter : 0, // Spacing from edge
			belowOrigin : false, // Displays dropdown below the button
			alignment : 'right', // Displays dropdown with edge aligned to the left of button
			stopPropagation : false
		// Stops event propagation
		});
	</script>
</body>
</html>