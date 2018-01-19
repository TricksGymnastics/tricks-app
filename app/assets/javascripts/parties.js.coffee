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
    
  $.ajax
    url: '/parties/jr_request_all'
    success: (html) ->
      #this needs to loop over all the .available-parties divs
      $('#script_placeholder').html html
      #updateLocation sessionStorage.getItem('location')
      return