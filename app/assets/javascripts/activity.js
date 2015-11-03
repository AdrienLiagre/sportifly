$(document).on("ready", function(){

  $(".create-activity").on("click", function(){
    // recuperer la source
    var source = $(this).attr("render");
    // remplir la source de la creation d'activité

    $(".modal-activity").attr("render", source);
    // faire apparaite le bg et cette modale
    $(".modal-bg").removeClass("hidden");
    $(".modal-activity").removeClass("hidden");
  });

  $(".modal-bg").on("click", function(){
    $(".modal-bg").removeClass("hidden");
    $(".modal-activity").removeClass("hidden");

    $(".modal-activity").animate({"opacity": "1"}, 500);
  });

  $(".modal-bg").on("click", function(){
    revertModal();
  });

  $(".modal-activity").on("click", function(event){
    event.stopPropagation();
  });

  $(document).on("keydown", function(e){
    if (e.keyCode == 27 ){
      revertModal();
    }
  });

});

