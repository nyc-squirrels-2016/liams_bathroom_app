$(document).ready(function(){
  $(".new-bathroom").on("click", function(e){
    e.preventDefault();
    var request = $.ajax({
      type: "GET",
      url: $(e.target).attr("href")
    });

    request.done(function(response){
      $("#create-bathroom").html(response);
    });
  });

  $("#create-bathroom").on("submit", ".new_bathroom", function(e){
    e.preventDefault();
    var request = $.ajax({
      type: "POST",
      url: $(e.target).attr("action"),
      data: $(this).serialize()
    });

    request.done(function(response){
      $(".errors").html("");
      $("#create-bathroom").html("");
      $(".bathroom-container").prepend(response);
    });


    request.fail(function(errors){
      $(".errors").text(errors.responseText);
    });
  });
})
