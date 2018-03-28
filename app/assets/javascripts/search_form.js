$(document).on(function(){
  $(".reset_button").on("click", function(){
  $(this.search_form).find("#q_alcohol_id_eq_3 > :checked").prop("checked", false);
  });
});