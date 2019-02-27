$ ->
  $('#data_type_image').click ->
    $('#data_type_image_box').slideDown(400)
    $('#html_input_field').slideUp(400)
    
  $('#data_type_html').click ->
    $('#html_input_field').slideDown(400)
    $('#data_type_image_box').slideUp(400)

  if $('#data_type_image').hasClass("selected")
    $('#data_type_image_box').slideDown(400)
    $('#html_input_field').slideUp(400)
  else
    $('#data_type_image_box').slideUp(400)
    $('#html_input_field').slideDown(400)

  $('#link_switch').click ->
    $('#link_path_input').slideToggle(400)
    
  if $('#link_switch').is(":checked")
    $('#link_path_input').slideDown(400)
  else
    $('#link_path_input').slideUp(400)

  $('#live_switch').click ->
    $('#order_input').slideToggle(400)
    $(".order_radio_buttons").removeAttr "checked"
    
  if $('#live_switch').is(":checked")
    $('#order_input').slideDown(400)
  else
    $('#order_input').slideUp(400)