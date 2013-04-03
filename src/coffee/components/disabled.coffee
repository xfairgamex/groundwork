$ ->
  # remove ability to tab to .disabled elements
  $('.disabled').each ->
    $(this).attr('tabindex','-1')
    $(this).find('a').attr('tabindex','-1') # disable tabindex on nested link items
  
  # remove ability to click on .disabled elements
  $('body').on 'click', '.disabled', (e) ->
    e.preventDefault()
    return false
    
  return