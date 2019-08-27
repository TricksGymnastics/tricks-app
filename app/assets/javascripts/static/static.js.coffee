jQuery ->
  images = ["Folsom/IMG_7786.jpg", "Folsom/IMG_7790.jpg", "Folsom/IMG_7792.jpg", "Sacramento/IMG_7840.jpg", "Sacramento/IMG_7839.jpg", "Sacramento/IMG_7827.jpg"]

  img = $('#background_image_loader')

  i = 0
  img.prop('src', 'assets/site_header_images/'+images[i])

  changeBackgroundImage = ->
    if img.prop('complete')
      # image already loaded
      console.log("Background image loaded very fast!")
      swap()
    else
      console.log("Image still loading")
      img.one 'load', ->
        console.log("Image done loading")
        swap()

  swap = ->
    $('#background_images').fadeOut 500, ->
      $('#background_images').css('background-image', 'url(assets/site_header_images/'+images[i]+')')
      $('#background_images').fadeIn 1000, ->
        setTimeout changeBackgroundImage, 5000
      
    i = i + 1
    if i == images.length
      i = 0
    img.prop('src', 'assets/site_header_images/'+images[i])

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


