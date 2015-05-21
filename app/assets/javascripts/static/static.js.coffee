jQuery ->
  $('#promo-tabs').tabs();
  # $('#promo-tabs').tabs($('.promo_image'),
  #   effect: 'fade'
  #   fadeInSpeed: 'slow'
  #   rotate: true
  #   onBeforeClick: (event, tabIndex) ->
  #     alert('test')
  #     i = 0
  #     while i <= 4
  #       pt = '#slide_' + i
  #       if i == tabIndex
  #         $(pt).addClass 'current'
  #       else
  #         $(pt).removeClass 'current'
  #       i++
  #     return
  # )
  # return