jQuery ->
  if $('#classtype_5').attr('checked')
    $('#tag_image_container').show()
  else
    $('#tag_image_container').hide()
  $('#classtype_5').change ->
    $('#tag_image_container').toggle()
  