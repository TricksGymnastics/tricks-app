# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#schedule_level_id').parent().hide()
  levels = $('#schedule_level_id').html()
  console.log(levels)
  $('#schedule_classtype_id').change ->
    classtype = $('#schedule_classtype_id :selected').text()
    options = $(levels).filter("optgroup[label=#{classtype}]").html()
    console.log(options)
    if options
      $('#schedule_level_id').html(options)
      $('#schedule_level_id').parent().show()
    else
      $('#schedule_level_id').empty()
      $('#schedule_level_id').parent().hide()