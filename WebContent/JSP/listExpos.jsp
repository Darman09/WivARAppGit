<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WivArt' - Mes Expositions</title>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"
	media="screen,projection" />
<link type="text/css" rel="stylesheet" href="css/style.css" />

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript"
	src="https://www.gstatic.com/firebasejs/6.1.0/firebase-app.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/firebasejs/6.1.0/firebase-firestore.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/6.1.1/firebase-storage.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="js/init.js"></script>
<script type="text/javascript">

/**
 * Récupère la totalité des expositions pour l'espace culturel
 */
db.collection("users").doc("${idUserConnected}").get().then(function(doc){
 	if (doc.data().type_User_id == "2vF6KfGqERkbyD1q6BFF") {
 		$('#addExpositionClick').attr('href','#createExpo');
		db.collection("exposition").where("id_espace_culturel", "==", doc.data().id_espaceCulturel)
		.get()
		.then(function(querySnapshot) {
			cards = ""
		    querySnapshot.forEach(function(doc) {
		    	cards += "<div class=\"col s12 m12 l4\"><div class=\"card\">	<div style=\"max-height:300px !important;\" class=\"card-image waves-effect waves-block waves-light\"  onclick=\"document.getElementById('expo').value ='"+doc.id+"';document.getElementById('button').value ='expo';$('#formListExpo').submit();\"><img style=\"max-height:100%\" class=\"activator\" src=\""
		    	cards += doc.data().img_exposition + "\"></div><div class=\"card-content\"><span class=\"card-title activator grey-text text-darken-4\">"
		    	cards += doc.data().nom_exposition
		    	cards += "\</span><p><a class=\"waves-effect waves-light btn modal-trigger btn-flat red-outline\" style=\"width:100%;\" href=\"#delete\" onclick=\"document.getElementById('delExpo').value ='"+doc.id+"';\" >Supprimer</a></p></div></div></div>"
		    });
			$("#cards").append(cards);
		})
		.catch(function(error) {
		    console.log("Error getting documents: ", error);
		});	
	} else  {
 		$('#addExpositionClick').attr('href','#createExpoAdmin');
		db.collection("exposition")
		.get()
		.then(function(querySnapshot) {
			cards = ""
		    querySnapshot.forEach(function(doc) {
		    	cards += "<div class=\"col s12 m12 l4\"><div class=\"card\">	<div style=\"max-height:300px !important;\" class=\"card-image waves-effect waves-block waves-light\"  onclick=\"document.getElementById('expo').value ='"+doc.id+"';document.getElementById('button').value ='expo';$('#formListExpo').submit();\"><img style=\"max-height:100%\" class=\"activator\" src=\""
		    	cards += doc.data().img_exposition + "\"></div><div class=\"card-content\"><span class=\"card-title activator grey-text text-darken-4\">"
		    	cards += doc.data().nom_exposition
		    	cards += "\</span><p><a class=\"waves-effect waves-light btn modal-trigger btn-flat red-outline\" style=\"width:100%;\" href=\"#delete\" onclick=\"document.getElementById('delExpo').value ='"+doc.id+"';\" >Supprimer</a></p></div></div></div>"
		    });
			$("#cards").append(cards);
		})
		.catch(function(error) {
		    console.log("Error getting documents: ", error);
		});	
	}
}).catch(function(error){
	console.log("error :" + error);
});

/**
 * Fonction permettant de supprimer une exposition
 * 
 */
function delExpo(){
	var id = document.getElementById('delExpo').value
	db.collection("exposition").doc(id).delete().then(function() {
		$('#formListExpo').submit();
	});
}

function setSelects(){
	/**
	 * Filtre themes exposition
	 */
	db.collection("theme_exposition").get().then(
			function(querySnapshot) {
				var select = ' ';
				querySnapshot.forEach(function(doc) {
					select += '<option value="' + doc.id + '">'
					+ doc.data().nom_theme_exposition + '</option>';
				});
				$("#themeExpo").append(select);
				$("#themeExpoAdmin").append(select);
			});
	$(document).ready(function() {
	});
	
	/**
	 * Filtre themes exposition
	 */
	db.collection("espace_culturel").get().then(
			function(querySnapshot) {
				var select = ' ';
				querySnapshot.forEach(function(doc) {
					select += '<option value="' + doc.id + '">'
					+ doc.data().nom_espace_culturel + '</option>';
				});
				$("#espaceCulturelAddExpoAdmin").append(select);
			});
	$(document).ready(function() {
	});

	/**
	 * Filtre période
	 */
	db.collection("periode").get().then(
			function(querySnapshot) {
				var select = ' ';
				querySnapshot.forEach(function(doc) {
					select += '<option value="' + doc.id + '">'
							+ doc.data().nom_periode + '</option>';
				});
				$("#periode").append(select);
				$("#periodeAdmin").append(select);
			});
	$(document).ready(function() {
	});

	/**
	 * Filtre type exposition
	 * 
	 */
	db.collection("type_exposition").get().then(
			function(querySnapshot) {
				var select = ' ';
				querySnapshot.forEach(function(doc) {
					select += '<option value="' + doc.id + '">'
							+ doc.data().nom_type_exposition + '</option>';
				});
				$("#typeExpo").append(select);
				$("#typeExpoAdmin").append(select);
			});
}

/**
 * Ajoute une exposition
 */
function addExpo(){
	var nomExpo = document.getElementById('nomExpo').value;
	var idTheme = document.getElementById('themeExpo').value;
	var typeExpo = document.getElementById('typeExpo').value;
	var dateFin = document.getElementById('dateFin').value;
	var dateDebut = document.getElementById('dateDebut').value;
	var descriptionExpo = document.getElementById('description').value;
	var localisation = document.getElementById('localisation').value;
	var periode = document.getElementById('periode').value;
	if (nomExpo === '') {
		Materialize.toast('Nom d\'exposition manquant', 3000);
		return;
	}
	if (typeExpo === '') {
		Materialize.toast('Type d\'exposition manquant', 3000);
		return;
	}
	if (localisation === '') {
		Materialize.toast('Localisation manquante', 3000);
		return;
	}
	if (dateDebut === '') {
		Materialize.toast('Date de debut manquante', 3000);
		return;
	}
	if (dateFin === '') {
		Materialize.toast('Date de fin manquante', 3000);
		return;
	}
	if (descriptionExpo === '') {
		Materialize.toast('Description manquante', 3000);
		return;
	}
	if (periode === '') {
		Materialize.toast('Periode manquante', 3000);
		return;
	}
	db.collection("exposition").add({
		nom_exposition: nomExpo,
		localisation_exposition: localisation,
		description_exposition:descriptionExpo,
		date_debut_exposition:firebase.firestore.Timestamp.fromDate(new Date(dateDebut+" 00:00")),
		date_fin_exposition:firebase.firestore.Timestamp.fromDate(new Date(dateFin+" 00:00")),
		id_periode_exposition:periode,
		id_theme_exposition:idTheme,
		id_type_exposition:typeExpo,
		id_espace_culturel:"1"
	})
	.then(function(docRef) {
		$('#IdExpoCreated').val(docRef.id);
		var input = document.getElementById('imgExposition');
		var file = input.files[0];
		var ref = store.ref('img_expo/' + docRef.id + "." + getFileExtension(file.name));
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
	           var id = $('#IdExpoCreated').val();
	           var docRefExpo = db.collection("exposition").doc(id);
	           docRefExpo.update({
	        	   img_exposition: downloadURL.toString()
	           }).then(function() {
	        	   $('#formListExpo').submit();
	           });
	        }); 
	      }); 
		console.log('File : '+'img_expo/'+docRef.id+"."+getFileExtension(file.name));
	})
	.catch(function(error) {
	    console.error("Error adding document: ", error);
	});
}

	/**
	 * Ajoute une exposition
	 */
	function addExpoAdmin(){
		var nomExpo = document.getElementById('nomExpoAdmin').value;
		var idTheme = document.getElementById('themeExpoAdmin').value;
		var typeExpo = document.getElementById('typeExpoAdmin').value;
		var dateFin = document.getElementById('dateFinAdmin').value;
		var dateDebut = document.getElementById('dateDebutAdmin').value;
		var descriptionExpo = document.getElementById('descriptionAdmin').value;
		var localisation = document.getElementById('localisationAdmin').value;
		var periode = document.getElementById('periodeAdmin').value;
		var espaceCulturel = document.getElementById('espaceCulturelAddExpoAdmin').value;
		if (espaceCulturel === '') {
			Materialize.toast('Espace Culturel manquant', 3000);
			return;
		}
		if (nomExpo === '') {
			Materialize.toast('Nom d\'exposition manquant', 3000);
			return;
		}
		if (typeExpo === '') {
			Materialize.toast('Type d\'exposition manquant', 3000);
			return;
		}
		if (localisation === '') {
			Materialize.toast('Localisation manquante', 3000);
			return;
		}
		if (dateDebut === '') {
			Materialize.toast('Date de debut manquante', 3000);
			return;
		}
		if (dateFin === '') {
			Materialize.toast('Date de fin manquante', 3000);
			return;
		}
		if (descriptionExpo === '') {
			Materialize.toast('Description manquante', 3000);
			return;
		}
		if (periode === '') {
			Materialize.toast('Periode manquante', 3000);
			return;
		}
		db.collection("exposition").add({
			nom_exposition: nomExpo,
			localisation_exposition: localisation,
			description_exposition:descriptionExpo,
			date_debut_exposition:firebase.firestore.Timestamp.fromDate(new Date(dateDebut + " 00:00")),
			date_fin_exposition:firebase.firestore.Timestamp.fromDate(new Date(dateFin + " 00:00")),
			id_periode_exposition:periode,
			id_theme_exposition:idTheme,
			id_type_exposition:typeExpo,
			id_espace_culturel:espaceCulturel
		})
		.then(function(docRef) {
			$('#IdExpoCreatedAdmin').val(docRef.id);
			var input = document.getElementById('imgExpositionAdmin');
			var file = input.files[0];
			var ref = store.ref('img_expo/' + docRef.id + "." + getFileExtension(file.name));
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
		           var id = $('#IdExpoCreatedAdmin').val();
		           var docRefExpo = db.collection("exposition").doc(id);
		           docRefExpo.update({
		        	   img_exposition: downloadURL.toString()
		           }).then(function() {
		        	   $('#formListExpo').submit();
		           });
		        }); 
		      }); 
			console.log('File : '+'img_expo/'+docRef.id+"."+getFileExtension(file.name));
		})
		.catch(function(error) {
		    console.error("Error adding document: ", error);
		});
	}
</script>
</head>
<body>
	<form method="post" action="listExpos" id="formListExpo">
		<input type="hidden" id="expo" name="expo" value="none"> <input
			type="hidden" id="delExpo" name="delExpo" value="none">
		<nav>
			<%@include file="/JSP/menu.jsp"%>
			<%@include file="/JSP/disconnect.jsp"%>
		</nav>
		<div class="row">
			<div class="col s12">
				<h2>Liste de vos expositions</h2>
			</div>
		</div>
		<div class="row" id="cards"></div>
		<div class="fixed-action-btn toolbar">
			<a class="btn-floating btn-large dark-purple"> <i
				class="large material-icons">settings</i>
			</a>
			<ul>
				<li class="waves-effect waves-light tooltipped" data-position="top"
					data-tooltip="Créer une exposition"><a id="addExpositionClick"
					onclick="setSelects()"><i class="material-icons">edit_location</i></a></li>
			</ul>
		</div>
	</form>
	<%@include file="/JSP/modal/modalAddExpo.jsp"%>
	<%@include file="/JSP/modal/modalAddExpoAdmin.jsp"%>
	<%@include file="/JSP/modal/modalDeleteExpo.jsp"%>
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
</body>
</html>