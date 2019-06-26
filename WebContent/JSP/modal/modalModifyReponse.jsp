<div id="modifyModal" class="modal">
<input type="hidden" id="idModalModifyReponse">
<input type="hidden" id="NreponseModalModifyReponse">
	<div class="modal-content">
		<div class="row">
			<div class="col s12">
				<h4>Modifier la réponse</h4>
				<h6>Question :</h6>
				<h5 id="intituleModal"></h5>
			</div>
			<div class="input-field col s9">
				<input id="reponseModal" type="text" class="validate"> <label
					for="reponseModal">Réponse :</label>
			</div>
			<div class="input-field col s3">
				<input name="correct" type="radio" id="correctTrue" value="1"/> <label
					for="correctTrue">Correct</label> <input name="correct"  value="0"
					type="radio" id="correctFalse" /> <label for="correctFalse">Pas
					correct</label>
			</div>
		</div>
		<div class="row">
			<div class="col s12">
				<a
					class="col s12 modal-action modal-close btn-flat dark-purple-outline center-align"
					onclick="modifyReponse()">Modifier</a>
			</div>
		</div>
	</div>
</div>