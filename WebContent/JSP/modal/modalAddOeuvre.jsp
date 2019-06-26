<input type="hidden" id="idOeuvreCreated">
<div id="createOeuvre" class="modal">
	<div class="modal-content">
		<div class="row">
			<input type="hidden" name="ref" id="ref" value="none" />
			<h1>Créer une oeuvre</h1>
			<div class="input-field col s12">
				<input id="nomOeuvre" type="text" class="validate" required="required">
				<label for="nomOeuvre">Nom de l'oeuvre</label>
			</div>
			<div class="input-field col s12">
				<span>Nom de l'exposition</span>
				<input type="text" class="validate" required="required"	id="nomExpositionOeuvre" disabled="disabled"/> 
			</div>
			<div class="input-field col s6">
				<input id="nomAuteurOeuvre" type="text" class="validate"
					required="required"> <label for="nomAuteurOeuvre">Nom auteur oeuvre</label>
			</div>
			<div class="input-field col s6">
				<input id="proprietaireOeuvre" type="text" class="validate"
					required="required"> <label for="proprietaireOeuvre">Nom propriétaire oeuvre</label>
			</div>
			<div class="col s12">
				<label>Type d'oeuvre</label> <select required="required"
					class="browser-default" id="typeOeuvre">
				</select>
			</div>
			<div class="col s6">
				<label>Date de début de création</label> <input type="date"
					id="dateDebutCreationOeuvre" required="required">
			</div>
			<div class="col s6">
				<label>Date de fin de création</label> <input type="date"
					id="dateFinCreationOeuvre" required="required">
			</div>
			<div class="input-field col s12">
				<textarea id="descriptionOeuvre" class="materialize-textarea"
					required="required"></textarea>
				<label for="descriptionOeuvre">Description</label>
			</div>
			<div class="file-field input-field col s12">
				<div class="btn dark-purple-outline">
					<span>Image</span> <input type="file" id="imgOeuvre"
						accept="png,jpg,jpeg">
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate" type="text">
				</div>
			</div>
			<div class="col s12">
				<a class="btn-flat col s12 dark-purple center-align"
					onclick="createOeuvre();">Valider</a>
			</div>
		</div>
	</div>
</div>