<script type="text/javascript">

db.collection("users").doc("${idUserConnected}").get().then(function(doc){
 	if (doc.data().type_User_id == "2vF6KfGqERkbyD1q6BFF") {
 		$("#espaceCulturelMenu").text("Mon espace culturel");
 		$('#expoMenu').text("Mes Expositions");
 	} else  {
 		$("#espaceCulturelMenu").text("Espaces Culturels");
 		$('#expoMenu').text("Expositions");
 		$('#usersMenu').css('display','block');
	}

}).catch(function(error){
	console.log("error :" + error);
});

</script>
<input type="hidden" id="button" name="button" value="none">
<input type="hidden" id="idEspaceCulturel" name="idEspaceCulturel" value="none">
<div class="nav-wrapper dark-purple">
	<ul>
		<li>
			<h5 style="margin-top: 17px !important; margin-left: 10px;">
				WivArt'</h5>
		</li>
		<li>
			<h5 style="margin-top: 17px !important; margin-left: 10px;" id="droit"></h5>
		</li>
	</ul>
	<ul class="right hide-on-med-and-down">
		<li>
			<%-- Bouton pour rediriger vers le compte de l'utilisateur --%>
			<button type="submit" class="btn-flat white-text" id="espaceCulturelMenu"
				onClick="document.getElementById('button').value ='home';"></button>
		</li>
		<li><button type="submit" class="btn-flat white-text" id="expoMenu"
				onClick="document.getElementById('button').value ='listExpos';"></button></li>
		<li>
			<%-- Bouton pour rediriger vers le compte de l'utilisateur --%>
			<button type="submit" class="btn-flat white-text"
				onClick="document.getElementById('button').value ='account';">Mon
				Compte</button>
		</li>
		<li style="display: none;" id="usersMenu">
			<%-- Bouton pour rediriger vers le compte de l'utilisateur --%>
			<button type="submit" class="btn-flat white-text"
				onClick="document.getElementById('button').value ='users';">Utilisateurs</button>
		</li>
		<li>
			<%-- Bouton pour rediriger vers le compte de l'utilisateur --%> <button type="submit"
			class="btn-flat white-text"
			onClick="document.getElementById('button').value ='disconnect';">Déconnexion</button>
		</li>
	</ul>
</div>