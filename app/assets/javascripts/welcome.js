$(function() {

  $("#search").autocomplete({
    source: "/search_suggestions"
  });

});
$('document').ready(function() {
  setTimeout(function() {
    $('#flash').slideUp();
  }, 3000);
});