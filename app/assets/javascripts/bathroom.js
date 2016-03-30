$(document).ready(function(){
	$(".comment-new").on("click", function(e){
		debugger
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
})