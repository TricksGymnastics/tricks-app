jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    if $('#survey_scoreable').is(":checked")
      $('.weight_select').show()

  $('#survey_scoreable').click ->
    $('.weight_select').toggle()
    $('#image_result_box').toggle() 
    $('#image_result_uploader').hide(150)
    $('#survey_image_result').prop('checked', false)
    $('.weight_radio_button').prop('checked', false)
  if $('#survey_scoreable').is(":checked")
    $('.weight_select').show()
    $('#image_result_box').show()
  else
    $('.weight_select').hide()
    $('#image_result_box').hide()

  $('#survey_image_result').click ->
    $('#image_result_uploader').toggle(150)
  if $('#survey_image_result').is(":checked") and $('#survey_scoreable').is(":checked")
    $('#image_result_uploader').show()
  else
    $('#image_result_uploader').hide()

  countUnchecked = ->
    n = $(":radio:checked").length
    q = $('.questions > li').length
    if n == q
      $("#submit_button").removeClass("button_disabled").attr "disabled", false
  $("#new_survey_result").bind "change keyup", ->
    countUnchecked()
