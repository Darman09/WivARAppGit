<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WivArt' - Informations Quizz</title>
<%@include file="/JSP/header.jsp"%>
</head>
<body>
	<script type="text/javascript">
	
	function setDateOfInput(date) {
		  var dd = date.getDate();
		  var mm = date.getMonth() + 1; //January is 0!
		  var yyyy = date.getFullYear();
		  if(dd < 10) {
		      dd = '0'+dd
		  } 
		  if(mm < 10) {
		      mm = '0'+mm
		  } 
		  var today = yyyy + '-' + mm + '-' + dd;
		  return today;
		}
	var nbEnregistrementsNoteOeuvre = 0;
	var noteTotalNoteOeuvre = 0;
	db.collection("notation_oeuvre").where("id_oeuvre", "==", "${idOeuvre}")
	   .get()
	   .then(function(querySnapshot) {
		   var moyenneNoteOeuvre = 0;
	       querySnapshot.forEach(function(doc) {
	    	   console.log(doc.data().note);
	    	   nbEnregistrementsNoteOeuvre ++;
	           noteTotalNoteOeuvre += parseFloat(doc.data().notation);
	       });
	       if (nbEnregistrementsNoteOeuvre > 0) {
	    	   moyenneNoteOeuvre = noteTotalNoteOeuvre / nbEnregistrementsNoteOeuvre;
	       }
		   	var stars = '<span onclick="Materialize.toast(\'Note : '+moyenneNoteOeuvre + '/5'+'\', 3000, \'rounded\')">';
		   	for (var i = 0; i < 5; i++) {
		   		console.log('moy ' + moyenneNoteOeuvre);
		   	  	if (moyenneNoteOeuvre > i) {
		   	  		stars += '<i class="material-icons yellow-text">star</i>';
		   		} else {
		   	  		stars += '<i class="material-icons">star_border</i>';
		   		}
		   	}
		   	stars += "</span>";
		   	$('#notation').append(stars);
		   	$('#notation').attr('data-tooltip',moyenneNoteOeuvre + ' 5');
	   })
	   .catch(function(error) {
	       console.log("Error getting documents: ", error);
	   });

	/**
	 * Filtre type d'oeuvre
	 */
	db.collection("type_oeuvre").get().then(
			function(querySnapshot) {
				var select = ' ';
				querySnapshot.forEach(function(doc) {
					select += '<option value="' + doc.id + '">'
					+ doc.data().nom_type_oeuvre + '</option>';
				});
				$("#typeOeuvreModify").append(select);
			});
/**
*	Initialisation des éléments de l'oeuvre
*/
db.collection("oeuvre").doc("${idOeuvre}").get().then(function(doc) {
    if (doc.exists) {
		$("#nomOeuvreTableTable").text(doc.data().nom_oeuvre);
		$('#nomOeuvre').text(doc.data().nom_oeuvre)
		$('#nomAuteurTable').text(doc.data().nom_auteur_oeuvre);
		$('#nomProprietaireTable').text(doc.data().nom_propriétaire);
		$('#descriptionTable').text(doc.data().description_oeuvre);
		$('#dateDebutCreationTable').text(doc.data().date_debut_creation.toDate());
		$('#dateFinCreationTable').text(doc.data().date_fin_creation.toDate());
		$("#imgOeuvre").attr("src",doc.data().img_oeuvre);
		$('#typeOeuvreModify').val(doc.data().id_type_oeuvre);
		$('#imgViewQrCodeExpo').attr("src","https://chart.googleapis.com/chart?chs=500x500&cht=qr&chl="+doc.id);
		$('#dowloadQrCode').attr("href","https://chart.googleapis.com/chart?chs=500x500&cht=qr&chl="+doc.id);
		$('#dowloadQrCode').attr("download",+doc.id);
		
		$("#nomOeuvreModify").val(doc.data().nom_oeuvre);
		$('#nomAuteurModify').val(doc.data().nom_auteur_oeuvre);
		$('#nomProprietaireModify').val(doc.data().nom_propriétaire);
		$('#descriptionModify').val(doc.data().description_oeuvre);
		var dateDebut = doc.data().date_debut_creation.toDate();
		var dd = dateDebut.getDate();
		var mm = dateDebut.getMonth() + 1;
		var yyyy = dateDebut.getFullYear();
		if(dd < 10) {
		    dd = '0'+dd
		} 
		if(mm < 10) {
			mm = '0'+mm
		} 
		var dateDebutToInput = yyyy + '-' + mm + '-' + dd;
		$('#dateDebutCreationModify').val(dateDebutToInput);

		var dateFin = doc.data().date_fin_creation.toDate();
		dd = dateFin.getDate();
		mm = dateFin.getMonth() + 1;
		yyyy = dateFin.getFullYear();
		if(dd < 10) {
		    dd = '0'+dd
		} 
		if(mm < 10) {
			mm = '0'+mm
		} 
		var dateFinToInput = yyyy + '-' + mm + '-' + dd;
		$('#dateFinCreationModify').val(dateFinToInput);
		
		var idExposition = doc.data().id_exposition;
		$("#modalModifyOeuvre_idExposition").val(idExposition);
		db.collection("exposition").doc(idExposition).get().then(
				function(doc) {
					if(doc.exists) {
						$("#nomExpositionTable").text(doc.data().nom_exposition);
						$("#nomExpositionOeuvreModify").val(doc.data().nom_exposition);
					} else {
						$("#nomExpositionTable").text("Inconnu");
					}
				});
		var idTypeOeuvre = doc.data().id_type_oeuvre;
		db.collection("type_oeuvre").doc(idTypeOeuvre).get().then(
				function(doc) {
					if(doc.exists) {
						$("#typeOeuvreTable").text(doc.data().nom_type_oeuvre);
					} else {
						$("#typeOeuvreTable").text("Inconnu");
					}
				});
    } else {
        // doc.data() will be undefined in this case
        console.log("No such document!");
    }
}).catch(function(error) {
    console.log("Error getting document:", error);
});

function modifyOeuvre(){
	var nomOeuvre = $('#nomOeuvreModify').val();
	var idExpo = "${expo}";
	var dateDebutCreationOeuvre = $('#dateDebutCreationModify').val();
	var dateFinCreationOeuvre = $('#dateFinCreationModify').val();
	var descriptionOeuvre = $('#descriptionModify').val();
	var nomAuteurOeuvre = $('#nomAuteurModify').val();
	var proprietaireOeuvre = $('#nomProprietaireModify').val();
	var typeOeuvre = $('#typeOeuvreModify').val();
	if (nomOeuvre === '') {
		Materialize.toast("Nom de l'oeuvre manquant", 3000);
		return;
	}
	if (idExpo === '') {
		Materialize.toast("Nom de l'exposition manquant", 3000);
		return;
	}
	if (dateDebutCreationOeuvre === '') {
		Materialize.toast("Date de debut creation manquante", 3000);
		return;
	}
	if (dateFinCreationOeuvre === '') {
		Materialize.toast("Date de fin de creation manquante", 3000);
		return;
	}
	if (descriptionOeuvre === '') {
		Materialize.toast("Description manquante", 3000);
		return;
	}
	if (nomAuteurOeuvre === '') {
		Materialize.toast("Nom de l'oeuvre manquant", 3000);
		return;
	}
	if (typeOeuvre === '') {
		Materialize.toast("Type de l'oeuvre manquant", 3000);
		return;
	}
	db.collection("oeuvre").doc("${idOeuvre}").update({
		date_debut_creation: firebase.firestore.Timestamp.fromDate(new Date(dateDebutCreationOeuvre +" 00:00")),
		date_fin_creation: firebase.firestore.Timestamp.fromDate(new Date(dateFinCreationOeuvre +" 00:00")),
		description_oeuvre: descriptionOeuvre,
		id_exposition: idExpo,
		id_type_oeuvre: typeOeuvre,
		img_oeuvre: "https://firebasestorage.googleapis.com/v0/b/wivart-d15a2.appspot.com/o/NoImage.png?alt=media&token=d53bd64e-6595-4612-9ff4-1d4f6cfff8cb",
		nom_auteur_oeuvre: nomAuteurOeuvre,
		nom_oeuvre: nomOeuvre,
		nom_propriétaire: proprietaireOeuvre
	}).then(function() {
		$('#formOeuvreInfo').submit();
	});
}

</script>
	<form method="POST" action="oeuvreInfo" id="formOeuvreInfo">
		<nav>
			<%@include file="/JSP/menu.jsp"%>
			<%@include file="/JSP/disconnect.jsp"%>
		</nav>
	</form>
	<div class="contenair">
		<div class="row">
			<div class="col s12">
				<h1 id="nomOeuvre">Nom de l'oeuvre</h1>
			</div>
			<div class="col s3">
				<img class="responsive-img" id="imgOeuvre">
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
							<td>Nom de l'oeuvre</td>
							<td id="nomOeuvreTableTable"></td>
						</tr>
						<tr>
							<td>Exposition</td>
							<td id="nomExpositionTable"></td>
						</tr>
						<tr>
							<td>Type d'oeuvre</td>
							<td id="typeOeuvreTable"></td>
						</tr>
						<tr>
							<td>Nom de l'auteur</td>
							<td id="nomAuteurTable"></td>
						</tr>
						<tr>
							<td>Nom du propriétaire</td>
							<td id="nomProprietaireTable"></td>
						</tr>
						<tr>
							<td>Date de début de création</td>
							<td id="dateDebutCreationTable"></td>
						</tr>
						<tr>
							<td>Date de fin de création</td>
							<td id="dateFinCreationTable"></td>
						</tr>
						<tr>
							<td>Description</td>
							<td id="descriptionTable"></td>
						</tr>
						<tr>
							<td>QR Code</td>
							<td><a href="#viewQrCodeExpo" class="btn">Consulter</a></td>
						</tr>
						<tr>
							<td>Note</td>
							<td id="notation" style="cursor: pointer;"></td>
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
						data-tooltip="Modifier l'oeuvre"><a href="#modifyOeuvre"><i
							class="material-icons">build</i></a></li>
				</ul>
			</div>
			<%@include file="/JSP/modal/modalModifyOeuvre.jsp"%>
			<%@include file="/JSP/modal/modalViewQrCode.jsp"%>
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