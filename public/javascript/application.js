$(document).ready(function() {

  $('.dropdown-toggle').dropdown();

  /* main page */
  /* group members slide toggle */
  $("#group-members-slidedown").click(function(){
    if ($("#group-members-slide").is(":hidden")) {  
      $("#group-members-slide").slideDown("slow");    
    } else {
      $("#group-members-slide").slideUp("slow");
    }
  });

  /* chore stats slide toggle */
  $("#chore-stats-slidedown").click(function(){
    if ($("#chore-stats-slide").is(":hidden")) {
      $("#chore-stats-slide").slideDown("slow");
    } else {
      $("#chore-stats-slide").slideUp("slow");
    }
  });

});
