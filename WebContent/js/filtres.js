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
		});

/**
 * Ajoute une exposition
 */
function addExpo(){
	var nomExpo = document.getElementById('nomExpo').value;
	var idTheme = document.getElementById('themeExpo').value;
	var typeExpo = document.getElementById('typeExpo').value;
	var localisation = document.getElementById('localisation').value;
	var dateFin = document.getElementById('dateFin').value;
	var dateDebut = document.getElementById('dateDebut').value;
	var descriptionExpo = document.getElementById('description').value;
	var localisation = document.getElementById('localisation').value;
	var periode = document.getElementById('periode').value;
	db.collection("exposition").add({
		nom_exposition: nomExpo,
		localisation_exposition: localisation,
		description_exposition:descriptionExpo,
		img_exposition:"https://firebasestorage.googleapis.com/v0/b/wivart-d15a2.appspot.com/o/noimage.jpg?alt=media&token=69f0869f-1dbe-4268-9ce5-81916050149f",
		date_debut_exposition:firebase.firestore.Timestamp.fromDate(new Date(dateDebut+" 00:00")),
		date_fin_exposition:firebase.firestore.Timestamp.fromDate(new Date(dateFin+" 00:00")),
		id_periode_exposition:periode,
		id_theme_exposition:idTheme,
		id_type_exposition:typeExpo,
		id_espace_culturel:"1"
	})
	.then(function(docRef) {
		$('#formListExpo').submit();
	})
	.catch(function(error) {
	    console.error("Error adding document: ", error);
	});
}
