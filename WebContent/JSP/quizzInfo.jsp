<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WivArt' - Informations Quizz</title>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"
	media="screen,projection" />
<link type="text/css" rel="stylesheet" href="css/style.css" />

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript"
	src="https://www.gstatic.com/firebasejs/6.1.0/firebase-app.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/firebasejs/6.1.0/firebase-firestore.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/6.1.1/firebase-storage.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="js/init.js"></script>
</head>
<body>
	<script type="text/javascript">
	var nbReponse = 0;
	var tabReponse = [];
	
db.collection("quizz").doc("${idQuizz}").get().then(function(doc) {
    if (doc.exists) {
    	console.log("idQuizz "+${idQuizz});
		$("#nomQuizz").text(doc.data().nom_quizz);
		$("#modalModifyQuizz_Nom").val(doc.data().nom_quizz);
		var idDifficulty = doc.data().difficulte_quizz;
		$("#modalModifyQuizz_difficultyQuizz").val(idDifficulty);
		db.collection("difficulte_quizz").doc(idDifficulty).get().then(
				function(doc) {
					if(doc.exists) {
						$("#difficulteQuizz").text(doc.data().nom_difficulte_quizz);
					} else {
						$("#difficulteQuizz").text("Inconnu");
					}
				});

		var idExposition = doc.data().id_exposition;
		db.collection("exposition").doc(idExposition).get().then(
				function(doc) {
					if(doc.exists) {
						$("#nomExposition").text(doc.data().nom_exposition);
						$("#modalModifyQuizz_NomExposition").val(doc.data().nom_exposition);
					} else {
						$("#nomExposition").text("Inconnu");
					}
				});
    } else {
        // doc.data() will be undefined in this case
        console.log("No such document!");
    }
}).catch(function(error) {
    console.log("Error getting document:", error);
});

db.collection("question_quizz").where("id_quizz", "==", "${idQuizz}")
.get()
.then(function(querySnapshot) {
	questions = ""
	modalQuestions = ""
    querySnapshot.forEach(function(doc) {
    	tabReponse.push(doc.data().reponses[i]);
    	questions += '<ul class="collection with-header" id="' + doc.id + '"><li class="collection-header"><h4>' + doc.data().intitule_question + '<a class="secondary-content" href="#deleteQuestion" onclick="$(\'#nomQuestionDelete\').text(\''+doc.data().intitule_question+'\');$(\'#idQuestionToDelete\').val(\''+doc.id+'\');" ><i class="material-icons red-text small">delete</i></a></h4></li>';
    		for (var i = 0; i < doc.data().reponses.length; i++) {
    			if(doc.data().correct == i) {
    	    		questions += '<li class="collection-item"><span class="green-text">' 
    			} else {
    	    		questions += '<li class="collection-item"><span>' 
    			}
    			questions += doc.data().reponses[i] + '</span><a href="#modifyModal" class="secondary-content modal-trigger" onclick="setResponse(\''+doc.id+'\','+i+')"><i class="material-icons dark-purple-text">build</i></a></div></li>';
    	}
    	questions += '<li class="collection-item"><span>Ajouter une réponse</span><a class="secondary-content" href="#createResponse" onclick="$(\'#intituleCreateReponse\').text(\''+doc.data().intitule_question+'\');"><i class="material-icons green-text small">add_circle</i></a></li></ul><div class="col s12"></div>';
    	});
	$("#questions").append(questions);
	
})
.catch(function(error) {
    console.log("Error getting documents: ", error);
});

function modifyReponse(){
	var id = $('#idModalModifyReponse').val();
	var nReponse = $('#NreponseModalModifyReponse').val();
	tabReponse[nReponse] = $('#reponseModal').val();
	db.collection("question_quizz").doc(id).update({
		reponses:tabReponse
	}).then(function(docRef) {
		if ($("input[name='correct']:checked").val() == 1) {
			console.log("Ca marche !");
		}

	})
}

function setResponse(id,nReponse) {
	var docRef = db.collection("question_quizz").doc(id);
	docRef.get().then(function(doc) {
		if (doc.exists) {
			$('#reponseModal').val(doc.data().reponses[nReponse]);
			$('#intituleModal').text(doc.data().intitule_question);
			$('#idModalModifyReponse').val(nReponse);
			$('#NreponseModalModifyReponse').val(id);
			if (doc.data().correct == nReponse) {
				$('#correctTrue').attr( "checked", "checked" );
				$('#correctFalse').removeAttr("checked");
			} else {
				$('#correctFalse').attr( "checked", "checked" );
				$('#correctTrue').removeAttr("checked");
			}
		}
	});
}

function createQuestion(){
	var question = $('#modalAddQuestion_question').val();
	var nbReponses = $(".childReponse").length;
	var reponse = [];
	for (var i = 0; i < nbReponses; i++) {
		reponse[i] = $("#modalAddQuestion_reponse"+i).val();
	}
	var correctValue = parseInt($("input[name='correct']:checked").val(),10);
	console.log(reponse);
	db.collection("question_quizz").add({
		correct:correctValue,
		id_quizz:"${idQuizz}",
		intitule_question:question,
		reponses:reponse
	}).then(function(docRef) {
		$('#formQuizzInfo').submit();
	})
	.catch(function(error) {
	    console.error("Error adding document: ", error);
	});
}


function newReponse(){
	nbReponse ++;
 	var reponse = '<div class="childReponse collection" id="childReponse'+nbReponse+'"><div class="input-field col s9"><input id="modalAddQuestion_reponse'+nbReponse+'" type="text" class="validate"><label for="modalAddQuestion_reponse'+nbReponse+'">Réponse :</label></div><div class="input-field col s2"><input name="correct" type="radio" id="correctReponse'+nbReponse+'"  value="'+nbReponse+'"/> <label for="correctReponse'+nbReponse+'">Correct</label></div><div class="input-field col s1 center-align"><a class="input-field" onclick="removeReponse('+nbReponse+');"><i class="material-icons small red-text">close</i></a></div></div>';
	$('#modalAddQuestion_reponses').append(reponse);
}

function deleteQuestion() {
	var id = $('#idQuestionToDelete').val();
 	db.collection("question_quizz").doc(id).delete().then(function() {
 	    console.log("Document successfully deleted!");
 		$('#formQuizzInfo').submit();
 	}).catch(function(error) {
 	    console.error("Error removing document: ", error);
 	});
}

function removeReponse(id) {
	$('#childReponse'+id).remove();
	nbReponse --;
}

function modifyQuizz(){
	db.collection("quizz").doc("${idQuizz}").update({
		nom_quizz:$('#modalModifyQuizz_Nom').val(),
		difficulte_quizz:$('#modalModifyQuizz_difficultyQuizz').val()
	}).then(function() {
		$('#formQuizzInfo').submit();
	});
}
</script>
	<form method="POST" action="quizzInfo" id="formQuizzInfo">
		<nav>
			<%@include file="/JSP/menu.jsp"%>
			<%@include file="/JSP/disconnect.jsp"%>
		</nav>
	</form>
	<div class="contenair">
		<div class="row">
			<div class="col s12">
				<h1 id="nomQuizz"></h1>
			</div>
			<div class="col s6">
				Difficulté :
				<h5 id="difficulteQuizz"></h5>
			</div>
			<div class="col s6">
				Nom de l'exposition :
				<h5 id="nomExposition"></h5>
			</div>
		</div>

		<div class="row">
			<div class="col s12" id="questions">
				<h4>Questions</h4>
			</div>
		</div>
		<div class="fixed-action-btn toolbar">
			<a class="btn-floating btn-large dark-purple"> <i
				class="large material-icons">settings</i>
			</a>
			<ul>
				<li class="waves-effect waves-light tooltipped" data-position="top"
					data-tooltip="Modifier le quizz"><a href="#modifyQuizz"><i
						class="material-icons">build</i></a></li>
				<li class="waves-effect waves-light tooltipped" data-position="top"
					data-tooltip="Ajouter une question"><a href="#createQuestion"><i
						class="material-icons">add_circle</i></a></li>
			</ul>
		</div>
		<%@include file="/JSP/modal/modalModifyReponse.jsp"%>
		<%@include file="/JSP/modal/modalAddReponse.jsp"%>
		<%@include file="/JSP/modal/modalAddQuestion.jsp"%>
		<%@include file="/JSP/modal/modalDeleteQuestion.jsp"%>
		<%@include file="/JSP/modal/modalModifyQuizz.jsp"%>
	</div>
</body>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".button-collapse").sideNav({
			edge : 'right',
		});
		$('ul.tabs').tabs();
		$('.modal').modal();
		$('select').material_select();
		$('.chips').material_chip();
		$('.tooltipped').tooltip({
			delay : 50
		});
	});
</script>
</html>