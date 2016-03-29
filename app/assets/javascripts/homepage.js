$(document).ready(function(){
	$(".login-button").on('click', function(e){
		e.preventDefault();
		var request = $.ajax({
			type: "GET",
			url: "/login"
		})
		request.done(function(data){
			$("#user-box").html(data);
		});
		request.fail(function(err){
			$(".errors").text(err.responseText);
		});
	});

	$('.register-button').on('click', function(e){
		e.preventDefault();
		var request = $.ajax({
			type: "GET",
			url: "/register"
		})
		request.done(function(data){
			$("#user-box").html(data);
		});
		request.fail(function(err){
			$(".errors").text(err.responseText);
		});
	});
})