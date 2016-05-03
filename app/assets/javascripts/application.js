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
// require turbolinks
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
  resetLocationButtons();
  
  // update info based on session variable for location
  updateLocation(sessionStorage.getItem('location'));
  
  // when a location button is clicked
  $('.location-button').on('click', function(event) {
    event.preventDefault();
    resetLocationButtons();
    updateLocation(event.target.text);
  });
});

function resetLocationButtons(){
    $('.location-button').each(function(i,obj){
      $(obj).removeClass('active');
    });
    
    $('.location-information').each(function(i, obj) {
      $(obj).hide();
    });
}

function updateLocation(loc){
  if (loc == "null"){
    $('.location-information#NONE').show();
    return;
  }
  var loc = convertToShortName(loc);
  
  sessionStorage.setItem('location', loc);

  $('.location-button#'+loc).addClass('active');
  $('.location-information#'+loc).show();
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

