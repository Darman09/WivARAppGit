<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<div id="disconnect" class="modal">
	<div class="modal-content">
		<h4>Déconnexion</h4>
		<p>Souhaitez-vous vraiment quitter l'application?</p>
	</div>
	<div class="modal-footer">
		<button type="submit"
			onClick="document.getElementById('button').value ='disconnect';"
			class="modal-action modal-close btn-flat waves-effect waves-green left">Oui</button>
		<a href="#!"
			class="modal-action modal-close btn-flat waves-red waves-effect left">Non</a>
	</div>
</div>
</html>