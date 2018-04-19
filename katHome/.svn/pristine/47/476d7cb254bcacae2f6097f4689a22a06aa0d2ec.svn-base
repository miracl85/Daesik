$(document).ready(function(){
	$("#user_id").focus();
});

function login() {
	$.ajax({
		type : "POST",
		url : "/admin//loginProcessing",
		data : $("#login_form").serialize(),
		dataType : "json",
		success : function(data) {
			if(data.result == true) {
				location.href="/admin/dashBoard";
			} else {
				$("#user_id").val('');
				$("#user_pw").val('');
				$("#user_id").focus();
			}
		},
		error : function(data) {
			alert("login error");
		}
	});
}