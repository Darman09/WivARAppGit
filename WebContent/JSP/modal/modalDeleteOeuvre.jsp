<input type="hidden" name="idOeuvreToDelete" id="idOeuvreToDelete">
<div id="deleteOeuvre" class="modal">
	<div class="modal-content">
		<div class="row">
			<div class="col s12">
				<h4>Supression d'Oeuvre</h4>
			</div>
		</div>
		<div class="row">
			<div class="col s12">
				<h5>Souhaitez-vous vraiment supprimer l'oeuvre "<span id="nomDeleteOeuvre"></span>" ?</h5>
			</div>
		</div>
		<div class="row">
			<div class="col s12">
				<a
					class="col s12 modal-action modal-close btn-flat red-outline center-align" onclick="deleteOeuvre()">Supprimer</a>
			</div>
		</div>
	</div>
</div>