$(document).ready(function(){

  $("#photo-group1").hover(function(){
    $('#picture1').toggleClass('hidden');
    $('#picture1b').toggleClass('hidden');
    });
  $("#photo-group2").hover(function(){
    $('#picture2').toggleClass('hidden');
    $('#picture2b').toggleClass('hidden');
    });
});
