<div id="modifyUser" class="modal">
	<div class="modal-content">
		<div class="row">
			<input type="hidden" name="ref" id="ref" value="none" />
			<div class="col s12"></div>
			<h1>Modifier mon compte</h1>
			<div class="col s12">
				<label>Nom</label> <input id="nomUserModify" type="text"
					class="validate" required="required">
			</div>
			<div class="col s6">
				<label>Sexe</label> <select required="required"
					class="browser-default" id="genreUserModify">
					<option disabled="disabled" selected="selected" value="none"></option>
					<option>Homme</option>
					<option>Femme</option>
					<option>Autres</option>
				</select>
			</div>
			<div class=" col s6">
				<label>Age</label> <input id="ageUserModify" type="number"
					class="validate" required="required">
			</div>
			<div class=" col s12">
				<label>Téléphone</label> <input type="tel" id="telephoneUserModify"
					required="required" pattern="[0-9]{10}">
			</div>
			<div class="col s12">
				<a class="btn-flat col s12 dark-purple center-align"
					onclick="modifyUser();">Modifier</a>
			</div>
		</div>
	</div>
</div>