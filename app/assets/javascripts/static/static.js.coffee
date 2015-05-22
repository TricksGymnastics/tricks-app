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
  window.setInterval (->
    selected = $('#promo-tabs').tabs('option', 'active')
    $('#promo-tabs').tabs 'option', 'active', selected + 1
  ), 6000
