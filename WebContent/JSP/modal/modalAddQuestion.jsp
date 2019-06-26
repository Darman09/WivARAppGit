<div id="createQuestion" class="modal">
	<div class="modal-content">
		<div class="row">
			<div class="col s12">
				<h4 class="dark-purple-text">Ajouter une question</h4>
			</div>
			<div class="input-field col s12">
				<input id="modalAddQuestion_question" type="text" class="validate"
					required="required"> <label for="modalAddQuestion_question">Question
					:</label>
			</div>
			<div id="modalAddQuestion_reponses">
				<div class="childReponse collection" id="childReponse0">
					<div class="input-field col s9">
						<input id="modalAddQuestion_reponse0" type="text" class="validate"
							required="required"> <label
							for="modalAddQuestion_reponse0">Réponse :</label>
					</div>
					<div class="input-field col s2">
						<input name="correct" type="radio" id="correctReponse0" value="0"
							checked="checked" /> <label for="correctReponse0">Correct</label>
					</div>
					<div class="input-field col s1 center-align"><a class="input-field" onclick="removeReponse(0);"><i class="material-icons small red-text">close</i></a></div>
				</div>
			</div>
			<div class="col s12">
				<a class="col s12 center-align tooltipped" data-position="bottom"
					data-tooltip="Ajouter une réponse" style="cursor: pointer;"
					onclick="newReponse()"><i
					class="material-icons medium dark-purple-text ">add_circle</i></a>
			</div>
		</div>
		<div class="row"></div>
		<div class="row">
			<div class="col s12">
				<a
					class="col s12 modal-action modal-close btn-flat dark-purple-outline center-align"
					onclick="createQuestion()">Valider</a>
			</div>
		</div>
	</div>
</div>