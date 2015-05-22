# https://api.jqueryui.com/tabs/
jQuery ->  
  $('#promo-tabs').tabs(
    hide: 
      effect: 'fadeOut'
      duration: 300
    show: 
      effect: 'fadeIn' 
      duration: 300
  )
  total_tabs = $('#promo-tabs ul li').length
  window.setInterval (->
    selected = $('#promo-tabs').tabs('option', 'active') + 1
    if selected >= total_tabs
      selected = 0
    $('#promo-tabs').tabs 'option', 'active', selected
  ), 6000
