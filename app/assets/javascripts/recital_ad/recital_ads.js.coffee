jQuery ->
#   Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
#   recital_ad.setupForm()

# recital_ad =
#   setupForm: ->
#     $('#new_recital_ad').submit ->
#       $('input[type=submit]').attr('disabled', true)
#       if $('#card_number').length
#         recital_ad.processCard()
#         false
  
#   processCard: ->
#     card =
#       number: $('#card_number').val()
#       cvc: $('#card_code').val()
#       expMonth: $('#card_month').val()
#       expYear: $('#card_year').val()
#     Stripe.createToken(card, recital_ad.handleStripeResponse)
  
#   handleStripeResponse: (status, response) ->
#     alert(status)
#     if status == 200
#       $('#stripe_error').hide()
#       $('#recital_ad_stripe_card_token').val(response.id)
#       $('#new_recital_ad')[0].submit()
#     else
#       alert("Stripe payment failed!")
#       $('#stripe_error').text(response.error.message).show()
#       $('input[type=submit]').attr('disabled', false)

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
      "recital_ad[image]": "Please choose a photo to upload"
      "recital_ad[pdf_file]": "Please select the .pdf file to upload"
    }
  }) 
  $("#new_recital_ad").bind "change keyup", ->
    if $(this).validate().checkForm()
      $(".stripe-button-el").attr "disabled", false
    else
      $(".stripe-button-el").attr "disabled", true
      
  $('.stripe-button-el').addClass('expanded button')
  $('.stripe-button-el').attr('disabled', true)
  
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
  
# A failed attempt to show a display image for file about to be uploaded
# readURL = (input) ->
#   if input.files and input.files[0]
#     reader = new FileReader

#     reader.onload = (e) ->
#       $('#img_prev').attr('src', e.target.result).width(150).height 200
#       return

#     reader.readAsDataURL input.files[0]
#   return

# $('#recital_ad_image').bind "change", ->
#   readURL this