jQuery ->
  images = ["Folsom/IMG_7786.jpg", "Folsom/IMG_7790.jpg", "Folsom/IMG_7792.jpg", "Sacramento/IMG_7840.jpg", "Sacramento/IMG_7839.jpg", "Sacramento/IMG_7827.jpg"]
  
  i = -1
  changeBackgroundImage = ->
    i = i + 1
    if i == images.length
      i = 0
    $('#background_images').fadeOut 500, ->
      $('#background_images').css('background-image', 'url(assets/site_header_images/'+images[i]+')')
      $('#background_images').fadeIn 1000, ->
        setTimeout changeBackgroundImage, 10000
  
  updateOrbitSize = ->
    $('.orbit-container').each (i, obj) ->
      $(this).height($(this).width() * (320/570) + 39 + "px")
      
  updateBlueBar = ->
    $('#blue_bar').height($('#blue_bar').parent().height())
    bottom = $(window).height() - ($('#blue_bar').position().top + $('#blue_bar').outerHeight(true));
    $('#background_images').css({bottom: bottom+"px"})
  
  $(document).ready ->
    changeBackgroundImage()
    updateOrbitSize()
    updateBlueBar()
    
  $(window).resize ->
    updateOrbitSize()
    updateBlueBar()
    
  