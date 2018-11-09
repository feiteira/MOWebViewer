window.separator_mode = "PAUSED";

$(document).mousedown(function (event){
  if ($('#v_separator:hover').length != 0) {
    window.separator_mode = "RUNNING"
  }
});

$(document).mousemove(function (event){
  if(window.separator_mode == "RUNNING"){
    console.log(event.pageX*100.0/$(window).width());
    $("#div_left_panel").width(event.pageX*100.0/$(window).width()+ "%");
  }
});

$(document).mouseup(function (event){
  if(window.separator_mode == "RUNNING"){
    window.separator_mode = "PAUSED";
  }
});
