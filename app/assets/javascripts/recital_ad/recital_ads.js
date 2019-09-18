jQuery(function() {});

$(function() {
  $('#new_recital_ad').validate({
    rules: {
      "recital_ad[firstname]": "required",
      "recital_ad[lastname]": "required",
      "recital_ad[email]": {
        required: true,
        email: true
      },
      "recital_ad[message]": "required",
      "recital_ad[image]": "required",
      "recital_ad[pdf_file]": "required"
    },
    messages: {
      "recital_ad[firstname]": " First Name Required",
      "recital_ad[lastname]": " Last Name Required",
      "recital_ad[email]": {
        required: " Email is Required",
        email: " You must enter a valid email."
      },
      "recital_ad[image]": "Please choose a photo to upload",
      "recital_ad[pdf_file]": "Please select the .pdf file to upload"
    }
  });
  $("#new_recital_ad").bind("change keyup", function() {
    if ($(this).validate().checkForm()) {
      return $(".stripe-button-el").attr("disabled", false);
    } else {
      return $(".stripe-button-el").attr("disabled", true);
    }
  });
  $('.stripe-button-el').addClass('expanded button');
  return $('.stripe-button-el').attr('disabled', true);
});

this.check_length = function(object, count) {
  var array, length, maxwords;
  maxwords = word_max;
  array = object.value.split(" ");
  length = array.length;
  count.innerHTML = length;
  if (length > maxwords) {
    alert("Your message is limited to " + maxwords + " words.");
    array = array.slice(0, maxwords);
    object.value = array.join(" ");
    count.innerHTML = maxwords;
    return false;
  }
  return true;
};