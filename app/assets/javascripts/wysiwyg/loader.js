// loaded here so they aren't on the rest of the website
//= require froala_editor.min.js
//= require plugins/align.min.js
//= require plugins/code_beautifier.min.js
//= require plugins/code_view.min.js
//= require plugins/colors.min.js
//= require plugins/font_size.min.js
//= require plugins/link.min.js
// require plugins/paragraph_format.min.js
//= require plugins/paragraph_style.min.js
//= require plugins/table.min.js
// allows text to turn into links as you type them (http://www.tricksgym.com)
//= require plugins/url.min.js

$(function() {
  $('.wysiwyg').froalaEditor();
  $('a:contains("Unlicensed")').remove();
});