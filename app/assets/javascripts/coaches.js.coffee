jQuery ->
  if $('#classtype_5_hidden').attr('checked')
    $('#tag_image_container').show()
  else
    $('#tag_image_container').hide()
    
  $('#classtype_5').on 'click', ->
    $('#tag_image_container').fadeToggle()