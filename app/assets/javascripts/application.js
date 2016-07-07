// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui/datepicker
//= require jquery_ujs
//= require jquery.minicolors
//= require foundation
//= require_directory .

/*global $*/

$(function(){ $(document).foundation(); });

$(window).bind("load", function () {
    var footer = $("#footer");
    var pos = footer.position();
    var height = $(window).height();
    height = height - pos.top;
    height = height - footer.height();
    if (height > 0) {
        footer.css({
            'margin-top': height + 'px'
        });
    }
});

$(function(){
  var new_height = $("#mobile_menu").parent().height() + 10;
  $("#mobile_menu").parent().css({"position":"absolute", "top":"48px", "left":"-100%", "z-index":"5", "width":"70%", 
  "background-color":"#FEFEFE", "border":"solid 2px #666", "box-shadow":"0 0 25px #222", "height":new_height+"px"});
  
  
  var showing_menu = false;
  $('.menu-icon').on('click', function(event) {
    event.preventDefault();
    if (showing_menu){
      $("#mobile_menu").parent().animate({"left" : "-100%"}, 500);//.slideToggle(200);
      showing_menu = false;
    }
    else{
      $("#mobile_menu").parent().animate({"left" : "0"}, 500);//.slideToggle(200);
      showing_menu = true;
    }
  });
  
  
  // update info based on session variable for location
  updateLocation(sessionStorage.getItem('location'));
  
  // when a location button is clicked
  $('.location-button').on('click', function(event) {
    event.preventDefault();
    updateLocation(event.target.text);
  });
});

function resetLocationButtons(){
    $('.location-button').each(function(i,obj){
      $(obj).removeClass('active');
    });
    
    $('.footer-location-information').each(function(i, obj) {
      $(obj).hide();
    });
    
    $('.location-classes-information').each(function(i, obj) {
      $(obj).hide();
    });
    $('#choose_program_modal').hide();
    $('.program-button#Swim').fadeOut(300);
}

function updateLocation(loc){
  resetLocationButtons();
  if (loc == null || loc == "null"){
    $('.footer-location-information#NONE').show();
    return;
  }
  var loc = convertToShortName(loc);
  
  sessionStorage.setItem('location', loc);

  $('.location-button#'+loc).addClass('active');
  $('.footer-location-information#'+loc).show();
  $('.location-classes-information#'+loc).show();
  $('#choose_program_modal').show();
  if (loc == "FOL"){
    $('.program-button#Swim').fadeIn(300);
  }
}

function convertToShortName(loc){  
  switch(loc){
    case "Granite Bay":
      return "GB";
    case "Folsom":
      return "FOL";
    case "Sacramento":
      return "SAC";
  }
  return loc;
}

function convertToFullName(loc){  
  switch(loc){
    case "GB":
      return "Granite Bay";
    case "FOL":
      return "Folsom";
    case "SAC":
      return "Sacramento";
  }
  return loc;
}

$(function () {
  $("#comments_table th a, #comments_table .pagination a").on("click", function () {
    $.getScript(this.href);
    return false;
  });
  $("#comments_search input").keyup(function() {
    $.get($("#comments_search").attr("action"), $("#comments_search").serialize(), null, "script");
    return false;
  });
});

$(function () {
  $("#quotes_table th a, #quotes_table .pagination a").on("click", function () {
    $.getScript(this.href);
    return false;
  });
  $("#quotes_search input").keyup(function() {
    $.get($("#quotes_search").attr("action"), $("#quotes_search").serialize(), null, "script");
    return false;
  });
});

$(function () {
  $("#users_table th a, #users_table .pagination a").on("click", function () {
    $.getScript(this.href);
    return false;
  });
  $("#users_search input").keyup(function() {
    $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });
});

$(function () {
  $("#schedules_table th a, #schedules_table .pagination a").on("click", function () {
    $.getScript(this.href);
    return false;
  });
  $("#schedules_search input").keyup(function() {
    $.get($("#schedules_search").attr("action"), $("#schedules_search").serialize(), null, "script");
    return false;
  });
});

