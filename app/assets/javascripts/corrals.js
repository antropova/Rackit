$(document).ready(function($){
  $('#myModal').modal('options');
  var body = $('show');
});

function clearNotice(){
  $(".notice").animate({opacity:'0'}, 1500);
}

$(document).ready(ready);
$(document).on('page:load', ready);

var ready = function() {    
   setTimeout(clearNotice, 1000);  //Flash fade
};