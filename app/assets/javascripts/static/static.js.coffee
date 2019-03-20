# https://api.jqueryui.com/tabs/
jQuery ->
  array = $('#background_images').children('img')
  
  $('#background_images').children('img').each (index) ->
    child = $(this)
    
    # img = new Image
    # img.onload = ->
    #   # child.attr 'style', 'margin-left: ' + -@width/2 + '; left: 50%; width: ' + @width +'; position: fixed; top: 0; z-index: -100;'
    #   return
    # img.src = child.attr 'src'
    
    child.hide
    return
  
  i = 0
  fadeInNext = ->
    i = i + 1
    if i == array.length
      i = 0
    array.eq(i).fadeIn(1000)
    return
    
  myFunction = ->
    array.eq(i).fadeOut(500, fadeInNext)
    return
  
  updateOrbitSize = ->
    $('.orbit-container').each (i, obj) ->
      $(this).height($(this).width() * (320/570) + 39 + "px")
      
  updateBlueBar = ->
    $('#blue_bar').height($('#blue_bar').parent().height())
  
  $(document).ready ->
    array.eq(0).fadeIn(500)
    setInterval myFunction, 10000
    updateOrbitSize()
    updateBlueBar()
    
  $(window).resize ->
    updateOrbitSize()
    updateBlueBar()
    
  