<div id="createResponse" class="modal">
	<div class="modal-content">
		<div class="row">
			<div class="col s12">
				<h4>Modifier la réponse</h4>
				<h6>Question :</h6>
				<h5 id="intituleCreateReponse"></h5>
			</div>
			<div class="input-field col s9">
				<input id="reponseModal" type="text" class="validate"> <label
					for="reponseModal">Réponse :</label>
			</div>
			<div class="input-field col s3">
				<input name="correct" type="radio" id="correctTrue" /> <label
					for="correctTrue">Correct</label> <input name="correct"
					type="radio" id="correctFalse" checked="checked" /> <label
					for="correctFalse">Pas correct</label>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a class="modal-action modal-close waves-effect waves-red btn-flat"
			onClick="">Valider</a>
	</div>
</div>