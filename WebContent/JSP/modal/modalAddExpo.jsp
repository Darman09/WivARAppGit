<input type="hidden" id="IdExpoCreated" name="IdExpoCreated">
<div id="createExpo" class="modal">
	<div class="modal-content">
		<div class="row">
			<input type="hidden" name="ref" id="ref" value="none" />
			<div class="col s12"></div>
			<h1>Créer une exposition</h1>
			<div class="input-field col s12">
				<input id="nomExpo" type="text" class="validate" required="required">
				<label for="nomExpo">Nom de l'exposition</label>
			</div>
			<div class="col s6">
				<label>Thème d'exposition</label> <select required="required"
					class="browser-default" id="themeExpo"></select>
			</div>
			<div class="col s6">
				<label>Période d'exposition</label> <select required="required"
					class="browser-default" id="periode"></select>
			</div>
			<div class="col s6">
				<label>Type d'exposition</label> <select required="required"
					class="browser-default" id="typeExpo">
				</select>
			</div>
			<div class="input-field col s6">
				<input id="localisation" type="text" class="validate"
					required="required"> <label for="localisation">Localisation</label>
			</div>
			<div class="col s6">
				<label>Date de début</label> <input type="date" id="dateDebut"
					required="required">
			</div>
			<div class="col s6">
				<label>Date de fin</label> <input type="date" id="dateFin"
					required="required">
			</div>
			<div class="input-field col s12">
				<textarea id="description" class="materialize-textarea"
					required="required"></textarea>
				<label for="description">Description</label>
			</div>
			<div class="file-field input-field col s12">
				<div class="btn dark-purple-outline">
					<span>Image</span> <input type="file" id="imgExposition"
						accept="png,jpg,jpeg">
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate" type="text">
				</div>
			</div>
			<div class="col s12">
				<a class="btn-flat col s12 dark-purple center-align modal-trigger"
					onclick="addExpo();">Valider</a>
			</div>
		</div>
	</div>
</div>