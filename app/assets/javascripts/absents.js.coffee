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

  $('#absent_date').datepicker()

  ###
  #current the locations model does not have corret relations to have this capability
  $('#classtype_select').hide()
  types = $('#absent_classtype_id').html()
  console.log(types)
  $('#absent_location').change ->
    location = $('#absent_location :selected').text()
    options = $(types).filter("optgroup[label=#{location}]").html()
    console.log(options)
    if options
      $('#absent_classtype_id').html(options)
      $('#classtype_select').show()
    else
      $('#absent_classtype_id').empty()
      $('#classtype_select').hide()
  ###