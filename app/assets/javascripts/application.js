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
//= require foundation
//= require jquery.minicolors
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require_directory .

<<<<<<< HEAD
$(function(){ $(document).foundation(); });

=======
>>>>>>> c4d2ba79434621329f13690bbf0986b5cc0e1f1d
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
<<<<<<< HEAD
});
=======
});
>>>>>>> c4d2ba79434621329f13690bbf0986b5cc0e1f1d
