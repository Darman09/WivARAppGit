<div id="modifyQuizz" class="modal">
	<div class="modal-content">
		<div class="row">
			<div class="col s12">
				<h4 class="dark-purple-text">Modifier le quizz</h4>
			</div>
			<div class="input-field col s12">
				<input id="modalModifyQuizz_Nom" type="text" class="validate">
				<label for="modalModifyQuizz_Nom">Nom du Quizz :</label>
			</div>
			<div class="col s12">
				<label>Type d'exposition</label> <select required="required"
					class="browser-default" id="modalModifyQuizz_difficultyQuizz">
					<option value="1">Facile</option>
					<option value="1Sqjxhaej5F3cyXXBGhA">Normal</option>
					<option value="YzCWsktheM3YCqNmBvCh">Difficile</option>
				</select>
			</div>
			<div class="input-field col s12">
				<span>Nom de l'exposition :</span> <input
					id="modalModifyQuizz_NomExposition" type="text" class="validate"
					disabled="disabled">
			</div>
		</div>
		<div class="row"></div>
		<div class="row">
			<div class="col s12">
				<a
					class="col s12 modal-action modal-close btn-flat dark-purple-outline center-align"
					onclick="modifyQuizz()">Modifier</a>
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