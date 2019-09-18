jQuery(function() {
  if ($('#classtype_5_hidden').attr('checked')) {
    $('#tag_image_container').show();
  } else {
    $('#tag_image_container').hide();
  }
  return $('#classtype_5').on('click', function() {
    return $('#tag_image_container').fadeToggle();
  });
});