$ ->
  # navigation menus
  delay = ''
  # open submenu function
  openMenu = (target) ->
    if $(window).width() < 1025 # need to replace this with hover support detection
      $(target).parent('li.menu').toggleClass('on')
  # hover on
  $('body').on 'mouseenter', 'nav > ul > li.menu', (e) ->
    if $(window).width() > 1024 # need to replace this with hover support detection
      clearTimeout(delay)
      $('nav > ul > li.menu.on').removeClass('on')
      $(this).addClass('on')
  # hover off
  $('body').on 'mouseleave', 'nav > ul > li.menu', (e) ->
    if $(window).width() > 1024 # need to replace this with hover support detection
      delay = setTimeout (->
        $('nav > ul > li.menu.on').removeClass('on')
      ), 350
  # click/touch
  $('body').on 'click', 'nav > ul > li.menu > a', (e) =>
    unless $(window).width() < 1025 # need to replace this with hover support detection
      $('nav > ul > li.menu.on').removeClass('on')
      $(e.target).parents('li.menu').addClass('on')
    openMenu(e.target)
    e.preventDefault()
    return false
  # keyboard accessibility
  $('body').on 'focus', 'nav > ul > li:not(.on) > a', ->
    $('nav > ul > li.menu.on').removeClass('on')
  $('body').on 'focus', 'nav > ul > li.menu > a', (e) =>
    openMenu(e.target)
    e.preventDefault()
    return false
  
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
  $('body').on 'click', 'nav.menu .menu-toggle', (e) ->
    $(this).parent('nav.menu').toggleClass('on')
    e.preventDefault()
    return false
  # keyboard accessibility


  return

$(window).on 'resize', ->
  if $('nav > ul > li.menu.on').length > 1
    $('nav > ul > li.menu.on').removeClass('on').first().addClass('on')