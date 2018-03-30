$(document).on('turbolinks:load',function(){
  $(function() {
    $("#selected_value").on("change", function(e){
      console.log("o");
      e.preventDefault();
      $(this).parents("form").submit();
    });
  });
})

