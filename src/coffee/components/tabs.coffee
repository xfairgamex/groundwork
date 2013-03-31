$ ->
  # tabs
  $('body').on 'click', '.tabs > ul > li > a[href^=#]', (e) ->
    unless $(this).hasClass('disabled')
      tabs = $(this).parents('.tabs')
      tabs.find('> ul li a').removeClass('active')
      $(this).addClass('active')
      tabs.children('div').removeClass('active')
      tabs.children($(this).attr('href')).addClass('active')
    e.preventDefault()
    return false