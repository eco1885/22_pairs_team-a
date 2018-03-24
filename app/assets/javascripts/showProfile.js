$(function() {
  $(".showPersonalViewModal").on("click", function(e){
    e.preventDefault();
    $(".bg_overlay").fadeIn(300);
    var imageId = $(this).data("id")
    $(".showProfile").each(function(){
      if ($(this).data("id") == imageId){
        $(this).fadeIn(800)
      }
    })

  });
  $(".showProfile").on("click", function(e){
    e.preventDefault();
    $(".bg_overlay").fadeOut(500);
    $(".showProfile").fadeOut(100);
  });
});

