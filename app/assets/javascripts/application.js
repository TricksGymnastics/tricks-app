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
  $("#mobile_menu").parent().css({"position":"relative", "top":"0px", "left":"-100%", "z-index":"5", "width":"250px", 
  "background-color":"#FEFEFE", "border":"solid 2px #666", "box-shadow":"0 0 25px #222", "height":new_height+"px", "margin-bottom":"-"+new_height+"px"});
  
  var showing_menu = false;
  $('#mobile_menu_button').on('click', function(event) {
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
  
  var showing_staff_menu = false;
  var staff_menu_new_height = $("#logged_in_menu").parent().height() + 10;
  var distance_to_hide_top = staff_menu_new_height + 48;
  var logged_in_menu_button_is_bound = false;
  
        
  if ($("#logged_in_top_bar").is(':visible')){
    var initialize_logged_in_menu = function(){
      if (!Foundation.MediaQuery.atLeast('large')) {
        // alert ("small or medium");
        $("#logged_in_menu").parent().css({"position":"relative", "top":"-"+distance_to_hide_top+"px", "left":"0", "z-index":"20", "width":"100%", 
        "background-color":"#333", "box-shadow":"0 0 25px #222", "height":staff_menu_new_height+"px", "margin-bottom":"-"+staff_menu_new_height+"px"});
        
        if (!logged_in_menu_button_is_bound){
          $("#logged_in_menu_button").on('click', function(event) {
            event.preventDefault();
            if (showing_staff_menu){
              $("#logged_in_menu").parent().animate({"top" : "-"+distance_to_hide_top+"px"}, 200);//.slideToggle(200);
              showing_staff_menu = false;
            }
            else{
              $("#logged_in_menu").parent().animate({"top" : "0"}, 500);//.slideToggle(200);
              showing_staff_menu = true;
            }
          });
          logged_in_menu_button_is_bound = true;
        }
        
      }
      else{
        // alert ("large or xlarge");
      }
    };
    
    
    initialize_logged_in_menu();
  
    // detect a change in media size
    $(window).on('changed.zf.mediaquery', function(event, newSize, oldSize) {
      // alert ("Window changed size - old: " + oldSize + " new: " +newSize);
      if ((oldSize == "small" || oldSize == "medium") && (newSize == "large" || newSize == "xlarge")){
        // going from mobile menu to normal menu
        if (showing_staff_menu){
          $("#logged_in_menu").parent().animate({"top" : "-"+distance_to_hide_top+"px"}, 1);//.slideToggle(200);
          showing_staff_menu = false;
        }
      }
      initialize_logged_in_menu();
    });
  }
  
  
 
  
  
  
  
  
  // update info based on session variable for location
  updateLocation(sessionStorage.getItem('location'));
  
  // when a location button is clicked
  $('.location-button').on('click', function(event) {
    event.preventDefault();
    updateLocation(event.target.text);
  });
  
  $("input:submit").on('click', function(event){
    var show_uploading_overlay = true;
    if (typeof $(this).data('confirm') != 'undefined'){
      event.stopImmediatePropagation();
      if (!confirm($(this).data('confirm'))){
        event.preventDefault();
        show_uploading_overlay = false;
      }
    } 
    
    if (show_uploading_overlay){
      $("input:file").each(function( index ) {
        if ($(this).val() != "")
          $("#uploading_modal_hidden_trigger").trigger('click');
      });
    }
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
    
    $('.location-schedule-pdf').each(function(i, obj) {
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
  $('.location-schedule-pdf#'+loc).show();
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

