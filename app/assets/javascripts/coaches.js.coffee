jQuery ->
  $('#start_date').datepicker({dateFormat: 'MM d, yy'})
  $('#birth_date').datepicker({dateFormat: 'MM d, yy'})
  if $('#classtype_5').attr('checked')
    $('#tag_image_container').show()
  else
    $('#tag_image_container').hide()
  $('#classtype_5').change ->
    $('#tag_image_container').toggle()
  