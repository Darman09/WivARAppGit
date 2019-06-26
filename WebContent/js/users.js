			db.collection("type_utilisateur").get().then(
				function(querySnapshot) {
					var select = ' ';
					querySnapshot.forEach(function(doc) {
						select += '<option value="' + doc.id + '">'
						+ doc.data().nom_type_utilisateur + '</option>';
					});
					$("#typeUserAdd").append(select);
				});
			$(document).ready(function() {
			});

			db.collection("espace_culturel").get().then(
				function(querySnapshot) {
					var select = ' ';
					querySnapshot.forEach(function(doc) {
						select += '<option value="' + doc.id + '">'
						+ doc.data().nom_espace_culturel + '</option>';
					});
					$("#IdEspaceCulturelAdd").append(select);
				});
			$(document).ready(function() {
			});

			db.collection("users").get().then(
				function(querySnapshot) {
					var list = ' ';
					querySnapshot.forEach(function(doc) {
						list += '<li class="collection-item"><span style="cursor:pointer;" class="dark-purple-text" onclick="$(\'#idUser\').val(\''+doc.id+'\');$(\'#button\').val(\'userInfo\');$(\'#formUsers\').submit();">'+doc.data().name.toUpperCase()+'</span><a href="#deleteUser" class="secondary-content" onclick="$(\'#idUser\').val(\''+doc.id+'\');$(\'#nomUserDelete\').text(\''+doc.data().name+'\')"><i class="material-icons red-text">delete</i></a></li>';
					});
					$("#listUser").append(list);
				});
			$(document).ready(function() {
			});

			function genPassword(length) {
			    var chars = "abcdefghijklmnopqrstuvwxyz!@#$%^&()ABCDEFGHIJKLMNOP1234567890";
			    var password = "";
			    for (var x = 0; x < length; x++) {
			        var i = Math.floor(Math.random() * chars.length);
			        password += chars.charAt(i);
			    }
			    return password;
			}
			
			function deleteUser() {
				var idUser = $('#idUser').val();
				db.collection("users").doc(idUser).delete().then(function() {
					$('#formUsers').submit();
				}).catch(function(error) {
				    console.error("Error removing document: ", error);
				});
			}
			
			var content = 'aa';
			// PROCESS
			var contentBytes = CryptoJS.enc.Utf8.parse(content);
			var contentHash = CryptoJS.MD5(contentBytes);
			var contentBase64String = CryptoJS.enc.Base64.stringify(contentHash);


			// WRITE
			document.getElementById("demo0").innerHTML = content;
			document.getElementById("demo5").innerHTML = contentBase64String;
			
			function addUser() {
				var nomUserAdd = $('#nomUserAdd').val();
				var prenomUserAdd = $('#prenomUserAdd').val();
				var typeUserAdd = $('#typeUserAdd').val();
				var IdEspaceCulturelAdd = $('#IdEspaceCulturelAdd').val();
				var genreUserAdd = $('#genreUserAdd').val();
				var ageUserAdd = $('#ageUserAdd').val();
				var telephoneUserAdd = $('#telephoneUserAdd').val();
				var mailUserAdd = $('#mailUserAdd').val();
				var mdpUserAdd = $('#mdpUserAdd').val();
				var confirmMdpUserAdd = $('#confirmMdpUserAdd').val();
				var mdp = " ";
				if (nomUserAdd === '' || prenomUserAdd === '') {
					Materialize.toast('Nom manquant', 2000);
					return;
				}
				if (typeUserAdd === '') {
					Materialize.toast('Type d\'utilisateur manquant', 2000);
					return;
				}
				if (genreUserAdd === '') {
					Materialize.toast('Genre manquant', 2000);
					return;
				}
				if (ageUserAdd === '') {
					Materialize.toast('Age manquant', 2000);
					return;
				}
				if (telephoneUserAdd === '') {
					Materialize.toast('Téléphone manquant', 2000);
					return;
				}
				if (mailUserAdd === '') {
					Materialize.toast('Mail manquant', 2000);
					return;
				}
				if(!($('#displayMdpSwitch').is(':checked'))) {
					if (mdpUserAdd != '' && (mdpUserAdd == confirmMdpUserAdd)) {
						var contentBytes = CryptoJS.enc.Utf8.parse(mdpUserAdd);
						var contentHash = CryptoJS.MD5(contentBytes);
						var contentBase64String = CryptoJS.enc.Base64.stringify(contentHash);	
						mdp = contentBase64String;
					} else {
						Materialize.toast('Mot de passe mal renseigne', 2000);
						return;
					}
				} else {
					var contentBytes = CryptoJS.enc.Utf8.parse(genPassword(8));
					var contentHash = CryptoJS.MD5(contentBytes);
					var contentBase64String = CryptoJS.enc.Base64.stringify(contentHash);	
					mdp = contentBase64String	
				}
				if (IdEspaceCulturelAdd != "none") {
					IdEspaceCulturelAdd = " ";
				}
				var nameUser = nomUserAdd +" "+prenomUserAdd;
				db.collection("users").add({
					age: ageUserAdd.toString(),
					email: mailUserAdd.toString(),
					gender: genreUserAdd.toString(),
					id_espaceCulturel: IdEspaceCulturelAdd.toString(),
					name: nameUser.toString(),
					phone: telephoneUserAdd.toString(),
					type_User_id: typeUserAdd.toString(),
					mdpUser: mdp.toString()
				})
				.then(function(docRef) {
					$('#formUsers').submit();
				})
				.catch(function(error) {
				    console.error("Error adding document: ", error);
				});
			}
			
			function diplayMdp(){
				if ($('#displayMdpSwitch').is(':checked')) {
					console.log('checked')
					$('#mdpContent').css('display','none');
				} else {
					console.log('no-checked')
					$('#mdpContent').css('display','block');
				}
			}

			$(document).ready(
					function() {
						$("#searchUser").on(
								"keyup",
								function() {
									var value = $(this).val().toLowerCase();
									$("#listUser li span").filter(
											function() {
												$(this).parent().toggle(
														$(this).text().toLowerCase()
																.indexOf(value) > -1);
											});
									if ($('#listUser').children().length === 0) {
										console.log("Pas de résultat");
									} else {
										console
												.log("Nb result "
														+ $('collection-item')
																.children().length);
									}
								});
					});