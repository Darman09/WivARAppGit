<div id="modifyOeuvre" class="modal">
	<div class="modal-content">
		<div class="row">
			<div class="col s12">
				<h4 class="dark-purple-text">Modifier l'oeuvre</h4>
			</div>
			<div class="col s12">
				<label for="nomOeuvreModify">Nom de l'oeuvre</label> <input
					id="nomOeuvreModify" type="text" class="validate"
					required="required">
			</div>
			<div class="col s12">
				<span>Nom de l'exposition</span> <input type="text" class="validate"
					required="required" id="nomExpositionOeuvreModify"
					disabled="disabled" />
			</div>
			<div class="col s6">
				<label for="nomAuteurModify">Nom de l'auteur de l'oeuvre</label> <input
					id="nomAuteurModify" type="text" class="validate"
					required="required">
			</div>
			<div class="input-field col s6"><label for="nomProprietaireModify">Nom
					du propriétaire de l'oeuvre</label>
				<input id="nomProprietaireModify" type="text" class="validate"
					required="required"> 
			</div>
			<div class="col s12">
				<label>Type d'oeuvre</label> <select required="required"
					class="browser-default" id="typeOeuvreModify">
				</select>
			</div>
			<div class="col s6">
				<label>Date de début de création</label> <input type="date"
					id="dateDebutCreationModify" required="required">
			</div>
			<div class="col s6">
				<label>Date de fin de création</label> <input type="date"
					id="dateFinCreationModify" required="required">
			</div>
			<div class="col s12">
				<label for="descriptionModify">Description</label>
				<textarea id="descriptionModify" class="materialize-textarea"
					required="required"></textarea>
			</div>
		</div>
		<div class="row"></div>
		<div class="row">
			<div class="col s12">
				<a
					class="col s12 modal-action modal-close btn-flat dark-purple-outline center-align"
					onclick="modifyOeuvre();">Modifier</a>
			</div>
		</div>
		<div class="row">
			<div class="col s12">
				<a
					class="col s12 btn-flat modal-action modal-close red-outline center-align white">Annuler</a>
			</div>

		</div>
	</div>
</div>