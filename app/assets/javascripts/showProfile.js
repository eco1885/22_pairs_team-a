$(function() {
  $(".showPersonalViewModal").on("click", function(e){
    e.preventDefault();
    $(".bg_overlay").fadeIn(800);
  });
  $(".modal_close").on("click", function(e){
    e.preventDefault();
    $(".bg_overlay").fadeOut(500);
  });
});

