$ ->
  # navigation menus
  delay = ''
  $('body').on 'focus', 'nav > ul > li > a', ->
    $('nav > ul > li').removeClass('on')
    $('nav > ul > li > ul').hide()
  $('body').on 'mouseenter', 'nav > ul > li.menu', (e) ->
    if $(window).width() > 768
      clearTimeout(delay)
      $('nav > ul > li').removeClass('on')
      $('nav > ul > li > ul').hide()
      $(this).addClass('on')
  $('body').on 'mouseleave', 'nav > ul > li.menu', (e) ->
    if $(window).width() > 768
      delay = setTimeout (->
        $('nav > ul > li').removeClass('on')
        $('nav > ul > li > ul').hide()
      ), 350
  $('body').on 'click', 'nav > ul > li.menu', (e) ->
    if $(window).width() < 768
      if $(e.target).parent('li.menu').size() > 0
        $this = $(this)
        $(this).children('ul').slideToggle 300, ->
          $this.toggleClass('on')
        e.preventDefault()
        return false
  $('body').on 'focus', 'nav > ul > li.menu > a', (e) ->
    $(this).parent('li.menu').trigger('mouseenter')
  $('body').on 'blur', 'nav > ul > li.menu li:last-child > a', (e) ->
    $(this).closest('li.menu').trigger('mouseleave')
  
  # dropdown buttons
  $('body').on 'focus', '.dropdown', (e) ->
    $(this).addClass('on')
  $('body').on 'blur', '.dropdown li:last-child a', (e) ->
    $('.dropdown').filter('.on').removeClass('on')
  $('body').on 'click', (e) ->
    if $(e.target).hasClass('dropdown')
      $(e.target).toggleClass('on')
    else
      if $('.dropdown').filter('.on').length
        $('.dropdown').filter('.on').removeClass('on')
    if $('nav > ul > li').filter('.menu.on').length
      $('nav > ul > li').filter('.menu.on').removeClass('on')

  # hamburger menus
  $('nav.menu').each ->
    $(this).attr('data-label','Menu') unless $(this).attr('data-label')
    $(this).prepend('<a href="#" class="menu-toggle"><i class="icon-reorder"></i></a>') unless $(this).find('.menu-toggle').length > 0
  $('body').on 'click', '.menu-toggle', (e) ->
    $(this).parent('nav.menu').toggleClass('on')
    e.preventDefault()
    return false

  return