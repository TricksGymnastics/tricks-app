jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  recital_ad.setupForm()

recital_ad =
  setupForm: ->
    $('#new_recital_ad').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        recital_ad.processCard()
        false
  
  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, recital_ad.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#stripe_error').hide()
      $('#recital_ad_stripe_card_token').val(response.id)
      $('#new_recital_ad')[0].submit()
    else
      $('#stripe_error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)

$ ->
  $('#new_recital_ad').validate({
    rules: {
      "recital_ad[firstname]": "required",
      "recital_ad[lastname]": "required",
      "recital_ad[email]": {
        required: true,
        email: true
      },
      "recital_ad[message]": "required"
      "recital_ad[image]": "required"
      "recital_ad[pdf_file]": "required"
    },
    messages: {
      "recital_ad[firstname]": " First Name Required",
      "recital_ad[lastname]": " Last Name Required",
      "recital_ad[email]": {
        required: " Email is Required",
        email: " You must enter a valid email."
      },
      "recital_ad[message]": "Please enter your message"
      "recital_ad[image]": "Please choose a photo to upload"
      "recital_ad[pdf_file]": "Please select the .pdf file to upload"
    }
  }) 
  $("#new_recital_ad").bind "change keyup mouseenter", ->
    if $(this).validate().checkForm()
      $("#continue_button").removeClass("button_disabled").attr "disabled", false
    else
      $("#continue_button").addClass("button_disabled").attr "disabled", true
  $('#continue_button').click ->    
    $('#personal_info').hide(500)
    $('#continue_button').hide(500)
    $('#personal_errors').hide(500)
    $('#payment_info').show(500)
  $('#back_button').click ->
    $('#personal_info').show(500)
    $('#payment_info').hide(500)
    $('#continue_button').show(500)

@check_length = (object, count) ->
  maxwords = word_max
  array = object.value.split(" ")
  length = array.length
  count.innerHTML = length
  if length > maxwords
    alert "Your message is limited to " + maxwords + " words."
    array = array.slice(0, maxwords)
    object.value = array.join(" ")
    count.innerHTML = maxwords
    return false
  true