$(document).ready(function() {
  $("#menu-toggle, .navbar-toggle").on("click", function(e){
    e.preventDefault;
    $("#wrapper").toggleClass("expand");
  });
});
