jQuery ->
  $('form').on 'click', '.remove_datenight', (event) ->
    didConfirm = confirm("Are you sure?")
    if didConfirm is true
      $(this).prev('input[type=hidden]').val('1')
      $(this).closest('fieldset').hide()
      event.preventDefault()
    else
      

  $('form').on 'click', '.add_datenights', (event) ->
    event.preventDefault()
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $('.gb-date').datepicker({dateFormat: 'MM d, yy'})
    $('.fol-date').datepicker({dateFormat: 'MM d, yy'})
    $('.sac-date').datepicker({dateFormat: 'MM d, yy'})
    
    
  $('.gb-date').datepicker({dateFormat: 'MM d, yy'})
  $('.fol-date').datepicker({dateFormat: 'MM d, yy'})
  $('.sac-date').datepicker({dateFormat: 'MM d, yy'})