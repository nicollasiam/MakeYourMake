$(document).ready(function() {

  $(".btn-user").click(function(e){
    e.preventDefault();

    $("#mymodal").removeClass("hidden").addClass("show");
  });

  $(".close-orçamento").click(function(e){
    e.preventDefault();

    $("#mymodal").addClass("hidden").removeClass("show");
  });
});
