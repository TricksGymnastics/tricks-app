jQuery ->
  $('#level_select').hide()
  levels = $('#absent_level_id').html()
  console.log(levels)
  $('#absent_classtype_id').change ->
    classtype = $('#absent_classtype_id :selected').text()
    options = $(levels).filter("optgroup[label=#{classtype}]").html()
    console.log(options)
    if options
      $('#absent_level_id').html(options)
      $('#level_select').show()
    else
      $('#absent_level_id').empty()
      $('#level_select').hide()