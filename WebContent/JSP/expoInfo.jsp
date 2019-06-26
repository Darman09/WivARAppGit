<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WivArt' - Information Expostion</title>
<%@include file="/JSP/header.jsp"%>
<script type="text/javascript">
var nbEnregistrementsNoteExpo = 0;
var noteTotalNoteExpo = 0;
db.collection("notation_exposition").where("id_exposition", "==", "${expo}")
   .get()
   .then(function(querySnapshot) {
	   var moyenneNoteExposition = 0;
       querySnapshot.forEach(function(doc) {
    	   console.log(doc.data().note);
           nbEnregistrementsNoteExpo ++;
           noteTotalNoteExpo += parseFloat(doc.data().note);
       });
       if (nbEnregistrementsNoteExpo > 0) {
           moyenneNoteExposition = noteTotalNoteExpo / nbEnregistrementsNoteExpo;
       }
	   	var stars = '<span onclick="Materialize.toast(\'Note : '+moyenneNoteExposition + '/5'+'\', 3000, \'rounded\')">';
	   	for (var i = 0; i < 5; i++) {
	   		console.log('moy ' + moyenneNoteExposition);
	   	  	if (moyenneNoteExposition > i) {
	   	  		stars += '<i class="material-icons yellow-text">star</i>';
	   		} else {
	   	  		stars += '<i class="material-icons">star_border</i>';
	   		}
	   	}
	   	stars += "</span>";
	   	$('#notation').append(stars);
	   	$('#notation').attr('data-tooltip',moyenneNoteExposition + ' 5');
   })
   .catch(function(error) {
       console.log("Error getting documents: ", error);
   });

var docRef = db.collection("exposition").doc("${expo}");

docRef.get().then(function(doc) {
    if (doc.exists) {
		$("#nomExposition").text(doc.data().nom_exposition);
		$("#nomExposition2").text(doc.data().nom_exposition);
		$("#nomExpositionOeuvre").val(doc.data().nom_exposition);
		$("#modalAddQuizz_NomExposition").val(doc.data().nom_exposition);
		$("#localisationExposition").text(doc.data().localisation_exposition);
		$("#descriptionExposition").text(doc.data().description_exposition);
		$("#imgExposition").attr("src",doc.data().img_exposition);
		$('#imgViewQrCodeExpo').attr("src","https://chart.googleapis.com/chart?chs=500x500&cht=qr&chl="+doc.id);
		$('#dowloadQrCode').attr("href","https://chart.googleapis.com/chart?chs=500x500&cht=qr&chl="+doc.id);
		$('#dowloadQrCode').attr("download",+doc.id);
		$("#dateDebutExposition").text(doc.data().date_debut_exposition.toDate());
		
		$("#dateFinExposition").text(doc.data().date_fin_exposition.toDate());
		
		var idPeriode = doc.data().id_periode_exposition;
		db.collection("periode").doc(idPeriode).get().then(
				function(doc) {
					if(doc.exists) {
						$("#periodeExposition").text(doc.data().nom_periode);
					} else {
						$("#periodeExposition").text("Inconnu");
					}
				});
		var idTheme = doc.data().id_theme_exposition;
		db.collection("theme_exposition").doc(idTheme).get().then(
				function(doc) {
					if(doc.exists) {
						$("#themeExposition").text(doc.data().nom_theme_exposition);
					} else {
						$("#themeExposition").text("Inconnu");
					}
				});
		var idTypeExpo = doc.data().id_type_exposition;
		db.collection("type_exposition").doc(idTypeExpo).get().then(
				function(doc) {
					if(doc.exists) {
						$("#typeExposition").text(doc.data().nom_type_exposition);
					} else {
						$("#typeExposition").text("Inconnu");
					}
				});
    } else {
        // doc.data() will be undefined in this case
        console.log("No such document!");
    }
}).catch(function(error) {
    console.log("Error getting document:", error);
});

db.collection("quizz").where("id_exposition", "==", "${expo}").get()
.then(function(querySnapshot) {
	cards = ""
    querySnapshot.forEach(function(doc) {
    	cards += '<li class="collection-item"><a class="dark-purple-text" onclick="document.getElementById(\'button\').value=\'quizzInfo\';document.getElementById(\'idQuizz\').value=\''+doc.id+'\';$(\'#formExpoInfo\').submit()"><span  style="cursor:pointer;width:90%;">'+doc.data().nom_quizz+'</span></a><a href="#deleteQuizz" onclick="$(\'#idQuizzToDelete\').val(\''+doc.id+'\');$(\'#nomDeleteQuizz\').text(\''+doc.data().nom_quizz+'\');" class="red-text center-align secondary-content"><i class="material-icons">delete</i></a></li>';
    	// console.log(doc.id, " => ", doc.data());
    });
	$("#cards").append(cards);
	
})
.catch(function(error) {
    console.log("Error getting documents: ", error);
});

db.collection("oeuvre").where("id_exposition", "==", "${expo}").get()
.then(function(querySnapshot) {
	cardsOeuvre = ""
    querySnapshot.forEach(function(doc) {
    	cardsOeuvre += '<li class="collection-item"><a class="dark-purple-text" onclick="document.getElementById(\'button\').value=\'oeuvreInfo\';document.getElementById(\'idOeuvre\').value=\''+doc.id+'\';$(\'#formExpoInfo\').submit()"><span  style="cursor:pointer;width:90%;">'+doc.data().nom_oeuvre+'</span></a><a href="#deleteOeuvre" onclick="$(\'#idOeuvreToDelete\').val(\''+doc.id+'\');$(\'#nomDeleteOeuvre\').text(\''+doc.data().nom_oeuvre+'\');" class="red-text center-align secondary-content"><i class="material-icons">delete</i></a></li>';
    	// console.log(doc.id, " => ", doc.data());
    });
	$("#cardsOeuvre").append(cardsOeuvre);
	
})
.catch(function(error) {
    console.log("Error getting documents: ", error);
});



db.collection("type_oeuvre").get().then(
		function(querySnapshot) {
			var select = ' ';
			querySnapshot.forEach(function(doc) {
				select += '<option value="' + doc.id + '">'
				+ doc.data().nom_type_oeuvre + '</option>';
			});
			$("#typeOeuvre").append(select);
		});
$(document).ready(function() {
});

function createQuizz(){
	var difficulyReference = db.collection("difficulte_quizz").doc($('#difficulteQuizz').val());
	var expoReference = db.collection("exposition").doc('${expo}');
	db.collection("quizz").add({
		difficulte_quizz: difficulyReference, 
		id_exposition: expoReference,
		nom_quizz: $('#modalAddQuizz_Nom').val()
	})
	.then(function(docRef) {
		$('#formExpoInfo').submit();
	})
	.catch(function(error) {
	    console.error("Error adding document: ", error);
	});
}

function createOeuvre(){
	var nomOeuvre = $('#nomOeuvre').val();
	var idExpo = "${expo}";
	var dateDebutCreationOeuvre = $('#dateDebutCreationOeuvre').val();
	var dateFinCreationOeuvre = $('#dateFinCreationOeuvre').val();
	var descriptionOeuvre = $('#descriptionOeuvre').val();
	var nomAuteurOeuvre = $('#nomAuteurOeuvre').val();
	var proprietaireOeuvre = $('#proprietaireOeuvre').val();
	var typeOeuvre = $('#typeOeuvre').val();
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
	
	db.collection("oeuvre").add({
		date_debut_creation:firebase.firestore.Timestamp.fromDate(new Date(dateDebutCreationOeuvre +" 00:00")),
		date_fin_creation:firebase.firestore.Timestamp.fromDate(new Date(dateFinCreationOeuvre +" 00:00")),
		description_oeuvre:descriptionOeuvre,
		id_exposition:idExpo,
		id_type_oeuvre:typeOeuvre,
		nom_auteur_oeuvre:nomAuteurOeuvre,
		nom_oeuvre:nomOeuvre,
		nom_propriétaire:proprietaireOeuvre
	})
	.then(function(docRef) {
		$('#idOeuvreCreated').val(docRef.id);
		var input = document.getElementById('imgOeuvre');
		var file = input.files[0];
		var ref = store.ref('img_oeuvre/' + docRef.id + "." + getFileExtension(file.name));
	    var uploadTask = ref.put(file);
	    uploadTask.on('state_changed', function(snapshot){ 
	          switch (snapshot.state) { 
	            case firebase.storage.TaskState.PAUSED: 
	            	// console.log('Upload is paused'); 
	              break; 
	            case firebase.storage.TaskState.RUNNING: 
	            	// console.log('Upload is running'); 
	              break; 
	          } 
	      }, function(error) {console.log(error); 
	      }, function() { 

	           // get the uploaded image url back 
	           uploadTask.snapshot.ref.getDownloadURL().then( 
	            function(downloadURL) { 

	           // You get your url from here 
	           // console.log('File available at', downloadURL); 

	          // print the image url  
	          // console.log(downloadURL); 
	           var id = $('#idOeuvreCreated').val();
	           var docRefExpo = db.collection("oeuvre").doc(id);
	           docRefExpo.update({
	        	   img_oeuvre: downloadURL.toString()
	           }).then(function() {
	        	   $('#formExpoInfo').submit();
	           });
	        }); 
	      }); 
		console.log('File : '+'img_oeuvre/'+docRef.id+"."+getFileExtension(file.name));
	})
	.catch(function(){
		console.error("Error adding document: ", error);
	});
}

function deleteQuizz(){
	var idQuizz = $('#idQuizzToDelete').val();
	db.collection("quizz").doc(idQuizz).delete().then(function() {
		$('#formExpoInfo').submit();
	}).catch(function(error) {
	    console.error("Error removing document: ", error);
	});
}

function deleteOeuvre(){
	var idOeuvre = $('#idOeuvreToDelete').val();
	db.collection("oeuvre").doc(idOeuvre).delete().then(function() {
		$('#formExpoInfo').submit();
	}).catch(function(error) {
	    console.error("Error removing document: ", error);
	});
}

</script>

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
	<form method="post" action="expoInfo" id="formExpoInfo">
		<nav>
			<%@include file="/JSP/menu.jsp"%>
			<%@include file="/JSP/disconnect.jsp"%>
		</nav>
		<div class="row">
			<div class="col s12">
				<h1 id="nomExposition"></h1>
			</div>
			<div class="col l3 m3 s12">
				<img class="materialboxed" id="imgExposition" width="100%">
			</div>
			<div class="col l9 m9 s12">
				<table class="bordered">
					<thead>
						<tr>
							<th></th>
							<th>Informations</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>Nom</td>
							<td id="nomExposition2"></td>
						</tr>
						<tr>
							<td>Description</td>
							<td id="descriptionExposition"></td>
						</tr>
						<tr>
							<td>Localisation</td>
							<td id="localisationExposition"></td>
						</tr>
						<tr>
							<td>Période</td>
							<td id="periodeExposition"></td>
						</tr>
						<tr>
							<td>Thème de l'exposition</td>
							<td id="themeExposition"></td>
						</tr>
						<tr>
							<td>Date de début de l'exposition</td>
							<td id="dateDebutExposition"></td>
						</tr>
						<tr>
							<td>Date de fin de l'exposition</td>
							<td id="dateFinExposition"></td>
						</tr>
						<tr>
							<td>Type d'exposition</td>
							<td id="typeExposition"></td>
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
		</div>
		<div class="row">
			<div class="col s12">
				<hr style="border: 1px #148B6A solid;">
			</div>
			<input type="hidden" name="idQuizz" id="idQuizz" value="none">
			<input type="hidden" name="idOeuvre" id="idOeuvre" value="none">
			<div class="fixed-action-btn toolbar">
				<a class="btn-floating btn-large dark-purple"> <i
					class="large material-icons">settings</i>
				</a>
				<ul>
					<li class="waves-effect waves-light tooltipped" data-position="top"
						data-tooltip="Créer un quizz"><a href="#createQuizz"><i
							class="material-icons">list</i></a></li>
					<li class="waves-effect waves-light tooltipped" data-position="top"
						data-tooltip="Créer une oeuvre"><a href="#createOeuvre"><i
							class="material-icons">view_carousel</i></a></li>
				</ul>
			</div>
			<div class="col s11">
				<ul class="collection with-header" id="cards">
					<li class="collection-header"><h4>Quizz</h4></li>
				</ul>
			</div>
			<div class="col s11">
				<ul class="collection with-header" id="cardsOeuvre">
					<li class="collection-header"><h4>Oeuvre</h4></li>
				</ul>
			</div>
		</div>
	</form>

	<%@include file="/JSP/modal/modalViewQrCode.jsp"%>
	<%@include file="/JSP/modal/modalAddQuizz.jsp"%>
	<%@include file="/JSP/modal/modalAddOeuvre.jsp"%>
	<%@include file="/JSP/modal/modalDeleteQuizz.jsp"%>
	<%@include file="/JSP/modal/modalDeleteOeuvre.jsp"%>
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