var autoSizeText;

autoSizeText = function() {
  var element, elements, i, len, magic_scaling_number, results;
  elements = $('.resize');
  if (elements.length <= 0) {
    return;
  }
  magic_scaling_number = 0.7;
  results = [];
  for (i = 0, len = elements.length; i < len; i++) {
    element = elements[i];
    results.push((function(element) {
      var current_test_size, max, min, new_font_size, resizeText;
      $(element).css('font-size', max + "px");
      min = 0;
      max = parseInt($(element).data("maxFontSize")) / magic_scaling_number;
      current_test_size = Math.min(Math.max(parseFloat($(element).css('font-size').slice(0, -2)), 0), max);
      resizeText = function() {
        var next_test_size;
        if ((element.offsetHeight > 0 && element.scrollHeight > element.offsetHeight) || (element.offsetWidth > 0 && element.scrollWidth > element.offsetWidth)) {
          max = current_test_size;
          next_test_size = current_test_size + (min - current_test_size) / 2;
        } else {
          min = current_test_size;
          next_test_size = current_test_size + (max - current_test_size) / 2;
        }
        current_test_size = next_test_size;
        return $(element).css('font-size', current_test_size);
      };
      while (Math.abs(max - min) > 1) {
        resizeText();
      }
      new_font_size = (parseInt($(element).css('font-size').slice(0, -2)) * magic_scaling_number) + 'px';
      return $(element).css('font-size', new_font_size);
    })(element));
  }
  return results;
};

$(document).ready(function() {
  return autoSizeText();
});

$(window).resize(function() {
  return autoSizeText();
});