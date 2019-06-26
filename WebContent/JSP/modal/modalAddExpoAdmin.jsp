<input type="hidden" id="IdExpoCreatedAdmin" name="IdExpoCreatedAdmin">
<div id="createExpoAdmin" class="modal">
	<div class="modal-content">
		<div class="row">
			<input type="hidden" name="ref" id="ref" value="none" />
			<div class="col s12"></div>
			<h1>Créer une exposition</h1>
			<div class="input-field col s12">
				<input id="nomExpoAdmin" type="text" class="validate" required="required">
				<label for="nomExpoAdmin">Nom de l'exposition</label>
			</div>
			<div class="col s6">
				<label>Nom de l'espace culturel</label> <select required="required"
					class="browser-default" id="espaceCulturelAddExpoAdmin"></select>
			</div>
			<div class="col s6">
				<label>Thème d'exposition</label> <select required="required"
					class="browser-default" id="themeExpoAdmin"></select>
			</div>
			<div class="col s6">
				<label>Période d'exposition</label> <select required="required"
					class="browser-default" id="periodeAdmin"></select>
			</div>
			<div class="col s6">
				<label>Type d'exposition</label> <select required="required"
					class="browser-default" id="typeExpoAdmin">
				</select>
			</div>
			<div class="input-field col s6">
				<input id="localisationAdmin" type="text" class="validate"
					required="required"> <label for="localisationAdmin">Localisation</label>
			</div>
			<div class="col s6">
				<label>Date de début</label> <input type="date" id="dateDebutAdmin"
					required="required">
			</div>
			<div class="col s6">
				<label>Date de fin</label> <input type="date" id="dateFinAdmin"
					required="required">
			</div>
			<div class="input-field col s12">
				<textarea id="descriptionAdmin" class="materialize-textarea"
					required="required"></textarea>
				<label for="descriptionAdmin">Description</label>
			</div>
			<div class="file-field input-field col s12">
				<div class="btn dark-purple-outline">
					<span>Image</span> <input type="file" id="imgExpositionAdmin"
						accept="png,jpg,jpeg">
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate" type="text">
				</div>
			</div>
			<div class="col s12">
				<a class="btn-flat col s12 dark-purple center-align modal-trigger"
					onclick="addExpoAdmin();">Valider</a>
			</div>
		</div>
	</div>
</div>