$(document).ready(function(){
	$(".comment-new").on("click", function(e){
		e.preventDefault();
		var request = $.ajax({
			type: "GET",
			url: e.target.href
		})
		request.done(function(data){
			$(".comment-container").html(data);
		});
		request.fail(function(err){
			$(".errors").text(err.responseText);
		});
	})
	$(".comment-container").on("submit", ".new_comment", function(e){
		var form = this
		e.preventDefault();
		var request = $.ajax({
			type: "POST",
			url: e.target.action,
			data: $(this).serialize()
		})
		request.done(function(data){
			$(".comments").prepend(data);
			form.reset();
		});
		request.fail(function(err){
			$(".errors").text(err.responseText);
		});
	})
})