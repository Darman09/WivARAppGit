
/**
 * Filtre themes exposition
 * 
 * @param querySnapshot
 * @returns
 */
db.collection("espace_culturel").doc("KSEz4MZDFy6kOBarGB6g").get().then(
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
			} else {
				$("#nomEspaceCulturel").text("Pas de nom");
				$("#imgEspaceCulturel").attr("src","https://firebasestorage.googleapis.com/v0/b/wivart-d15a2.appspot.com/o/noimage.jpg?alt=media&token=69f0869f-1dbe-4268-9ce5-81916050149f");
			}
		});
