$ ->
  $('#image_radio_button').click ->    
    $('#image_select_field').show(300)
    $('#html_input_field').hide(300)
  $('#html_radio_button').click ->
    $('#html_input_field').show(300)
    $('#image_select_field').hide(300)

  if $('#image_radio_button').is(":checked")
    $('#image_select_field').show(300)
    $('#html_input_field').hide(300)
  else
    $('#image_select_field').hide(300)
    $('#html_input_field').show(300)

  $('#link_check_box').click ->
    $('#link_path_input').toggle(300)
  if $('#link_check_box').is(":checked")
    $('#link_path_input').show(300)
  else
    $('#link_path_input').hide(300)

  $('#live_check_box').click ->
    $('#order_input').toggle(300)
    $(".order_radio_buttons").removeAttr "checked"
  if $('#live_check_box').is(":checked")
    $('#order_input').show(300)
  else
    $('#order_input').hide(300)