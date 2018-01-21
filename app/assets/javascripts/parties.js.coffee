jQuery ->
  $('#party_color').minicolors()
  
  $('.accordion-title.party-panel').on 'click', (event) ->
    event.preventDefault()
    party_id = $(event.target).data("id")
    $.ajax
      url: '/parties/jr_request/'+party_id
      success: (html) ->
        # only updates the table for the party clicked on
        #$('.available-parties#'+party_id).html html
        
        # updates all the tables at once
        $('.available-parties').html html
        
        updateLocation sessionStorage.getItem('location')
        return
    
  # $.ajax
  #   url: '/parties/jr_request_all'
  #   success: (html) ->
  #     #this needs to loop over all the .available-parties divs
  #     $('#script_placeholder').html html
  #     #updateLocation sessionStorage.getItem('location')
  #     return