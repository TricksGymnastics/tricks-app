(function() {
  jQuery(function() {
    var total_tabs;
    $('#promo-tabs').tabs({
      hide: {
        effect: 'fadeOut',
        duration: 300
      },
      show: {
        effect: 'fadeIn',
        duration: 300
      }
    });
    total_tabs = $('#promo-tabs ul li').length;
    return window.setInterval((function() {
      var selected;
      selected = $('#promo-tabs').tabs('option', 'active') + 1;
      if (selected >= total_tabs) {
        selected = 0;
      }
      return $('#promo-tabs').tabs('option', 'active', selected);
    }), 6000);
  });

}).call(this);
