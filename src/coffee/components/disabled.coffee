$ ->
  # remove ability to tab to .disabled elements
  $('.disabled').each ->
    $(this).attr('tabindex','-1')
  
  # remove ability to click on .disabled elements
  $('body').on 'click', '.disabled', (e) ->
    e.preventDefault()
    return false
    
  return