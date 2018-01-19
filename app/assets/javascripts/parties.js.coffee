jQuery ->
  $('#party_color').minicolors()
  
  $('.accordion-title.party-panel').on 'click', (event) ->
    event.preventDefault()
    $.ajax
      url: '/parties/jr_request'
      success: (html) ->
        #this needs to loop over all the .available-parties divs
        $('.available-parties').html html
        updateLocation sessionStorage.getItem('location')
        return
        