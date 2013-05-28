jQuery ->
  $('#level_select').hide()
  levels = $('#schedule_level_id').html()
  console.log(levels)
  $('#schedule_classtype_id').change ->
    classtype = $('#schedule_classtype_id :selected').text()
    options = $(levels).filter("optgroup[label=#{classtype}]").html()
    console.log(options)
    if options
      $('#schedule_level_id').html(options)
      $('#level_select').show()
    else
      $('#schedule_level_id').empty()
      $('#level_select').hide()