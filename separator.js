window.separator_mode = "PAUSED";

console.log("loadin");

/**

$(document).ready(function () {
  console.log($("#v_separator"));
  $("#v_separator").click(function handle_separator(){
    console.log(window.separator_mode);
    window.separator_mode = "RUNNING"
    console.log(window.separator_mode);

  });**/

$(document).mousemove(function (event){
  console.log("a "+ window.separator_mode)
  if(window.separator_mode == "RUNNING"){
    console.log(event.pageX*100.0/$(window).width());
    $("#div_left_panel").width(event.pageX*100.0/$(window).width()+ "%");
  }
});

$(document).click(function (event){
  if(window.separator_mode == "RUNNING"){
    window.separator_mode = "PAUSED";
  }else{
    if ($('#v_separator:hover').length != 0) {
      window.separator_mode = "RUNNING"
    }
  }
});
