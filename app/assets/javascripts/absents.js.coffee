jQuery ->
  $('#absent_level_id').prop("disabled", true)
  levels = $('#absent_level_id').html()
  # console.log(levels)
  $('#absent_classtype_id').change ->
    classtype = $('#absent_classtype_id :selected').text()
    options = $(levels).filter("optgroup[label=#{classtype}]").html()
    console.log(options)
    if options
      $('#absent_level_id').html(options)
      $('#absent_level_id').prop("disabled", false)
    else
      $('#absent_level_id').empty()
      $('#absent_level_id').prop("disabled", true)

  $('#absent_date').datepicker({dateFormat: 'MM d, yy'})
  








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