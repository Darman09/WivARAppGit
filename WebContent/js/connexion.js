function connect(){
	var login = $('#login').val();
	var mdp = $('#password').val();
	var contentBytes = CryptoJS.enc.Utf8.parse(mdp);
	var contentHash = CryptoJS.MD5(contentBytes);
	var contentBase64String = CryptoJS.enc.Base64.stringify(contentHash);
	// console.log("Mdp :"+mdp.toString());
	db.collection('users').where("email","==",login.toString())
	.where("mdpUser","==",contentBase64String.toString())
    .get()
    .then(function(querySnapshot) {
        querySnapshot.forEach(function(doc) {
        	if (doc.data().type_User_id == 'RQsv4LIMlipBsLB0zKry') {
				Materialize.toast('Vous n\'avez pas le droit', 2000);
				return;
			}
        	$('#idUserSignin').val(doc.id);
            $('#formSignin').submit();
        });
    })
    .catch(function(error) {
        console.log("Error getting documents: ", error);
    });

}
