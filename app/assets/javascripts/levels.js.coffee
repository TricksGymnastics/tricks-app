jQuery ->
  $('.accordion-title.level-panel').on 'click', (event) ->
    event.preventDefault()
    level_id = $(event.target).data("id")
    $.ajax
      url: '/levels/jr_request/'+level_id
      success: (html) ->
        $('.level-classes#'+level_id).html html
        updateLocation sessionStorage.getItem('location')
        return
