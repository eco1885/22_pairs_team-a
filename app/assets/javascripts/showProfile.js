$(document).on('turbolinks:load',function(){
  $(function() {
    $(".showPersonalViewModal").on("click", function(e){
      e.preventDefault();
      $(".js_click_hide").hide();
      $(".bg_overlay").fadeIn(300);
      var imageId = $(this).data("id")
      $(".showProfile").each(function(){
        if ($(this).data("id") == imageId){
          $(this).fadeIn(800)
        }
      })

    });
    $(".modal_close").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeOut(500);
      $(".showProfile").fadeOut(100);
    });
    $(".bg_overlay").on('click', function(e) {
      if (!$(e.target).closest('.showProfile').length) {
      $(".bg_overlay").fadeOut(500);
      $(".showProfile").fadeOut(100);
      }
    });
  });
})
