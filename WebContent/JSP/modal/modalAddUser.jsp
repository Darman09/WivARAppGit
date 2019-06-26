<div id="createUser" class="modal">
	<div class="modal-content">
		<div class="row">
			<input type="hidden" name="ref" id="ref" value="none" />
			<div class="col s12"></div>
			<h1>Créer un utilisateur</h1>
			<div class="input-field col s6">
				<input id="nomUserAdd" type="text" class="validate"	required="required"> 
				<label for="nomUserAdd">Nom</label>
			</div>
			<div class="input-field col s6">
				<input id="prenomUserAdd" type="text" class="validate"required="required"> 
				<label for="prenomUserAdd">Prénom</label>
			</div>
			<div class="col s6">
				<label>Type d'utilisateur</label> 
				<select required="required"	class="browser-default" id="typeUserAdd">
				</select>
			</div>
			<div class="col s6">
				<label>Espace Culturel Associé</label> 
				<select class="browser-default" id="IdEspaceCulturelAdd">
					<option value="none" disabled="disabled" selected="selected"></option>
				</select>
			</div>
			<div class="col s6">
				<label>Sexe</label> 
				<select required="required"	class="browser-default" id="genreUserAdd">
					<option disabled="disabled" selected="selected" value="none"></option>
					<option>Homme</option>
					<option>Femme</option>
					<option>Autres</option>
				</select>
			</div>
			<div class="input-field col s6">
				<input id="ageUserAdd" type="number" class="validate"
				required="required"> <label for="ageUserAdd">Age</label>
			</div>
			<div class="input-field col s12">
				<label>Téléphone</label> <input type="tel" id="telephoneUserAdd"
				required="required" pattern="[0-9]{10}">
			</div>
			<div class="input-field col s12">
				<input id="mailUserAdd" type="text" class="validate"
				required="required"> <label for="mailUserAdd">Adresse mail</label>
			</div>
			<div class="col s12">
				<label>Générer mot de passe automatiquement</label>
				<div class="switch">
					<label>
						Non
						<input type="checkbox" id="displayMdpSwitch" onclick="diplayMdp()">
						<span class="lever"></span>
						Oui
					</label>
				</div>
			</div>
			<div class="row">
				<div id="mdpContent">
					<div class="input-field col s12">
						<input id="mdpUserAdd" type="password" class="validate"
						required="required"> <label for="mdpUserAdd">Mot de passe</label>
					</div>
					<div class="input-field col s12">
						<input id="confirmMdpUserAdd" type="password" class="validate"
						required="required"> <label for="confirmMdpUserAdd">Confirmer le mot de passe</label>
					</div>
				</div>
			</div>
			<div class="col s12">
				<a class="btn-flat col s12 dark-purple center-align"
				onclick="addUser();">Valider</a>
			</div>
		</div>
	</div>
</div>
