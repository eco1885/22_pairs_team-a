$(document).on('turbolinks:load',function(){
  $(function() {
    $(".link_help").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeIn(300);
      $(".box_modal_window").fadeIn(800)
    });
    $(".modal_close").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeOut(500);
      $(".box_modal_window").fadeOut(100);
    });
    $(".bg_overlay").on('click', function(e) {
      if (!$(e.target).closest('.box_modal_window').length) {
      $(".bg_overlay").fadeOut(500);
      $(".box_modal_window").fadeOut(100);
      }
    });
  });
})
