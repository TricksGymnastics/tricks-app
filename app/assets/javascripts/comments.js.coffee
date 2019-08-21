jQuery ->
  $('#load_more_comments').on 'click', ->
    url = $('.pagination .next a').attr('href')
    if url
      $('#load_more_comments').removeClass("large").html('<img src="/assets/loading-spinner-white.gif" style="width:30px;">');
      $.getScript(url)
    return
  # setTimeout (->
  #     if $('.pagination').length
  #         $(window).scroll ->
  #             url = $('.pagination .next a').attr('href')
  #             if url && $(window).scrollTop() > $(document).height() - $(window).height() - 800
  #                 $('.pagination').text("Fetching more products...")
  #                 $.getScript(url)
  #         # $(window).scroll()
  # ), 500