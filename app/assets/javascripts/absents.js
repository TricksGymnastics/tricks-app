jQuery(function() {
  var levels;
  $('#absent_level_id').prop("disabled", true);
  levels = $('#absent_level_id').html();
  return $('#absent_classtype_id').change(function() {
    var classtype, options;
    classtype = $('#absent_classtype_id :selected').text();
    options = $(levels).filter("optgroup[label=" + classtype + "]").html();
    console.log(options);
    if (options) {
      $('#absent_level_id').html(options);
      return $('#absent_level_id').prop("disabled", false);
    } else {
      $('#absent_level_id').empty();
      return $('#absent_level_id').prop("disabled", true);
    }
  });
});