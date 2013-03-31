$ ->
  # navigation menus
  delay = ''

  navitem = $('nav > ul > li')
  navitem.find('>a').on
    focus: (e) ->
      $('nav > ul > li').removeClass('on')
      $('nav > ul > li > ul').hide()

  menu = $('nav > ul > li.menu')
  menu.on
    mouseenter: (e) ->
      if $(window).width() > 768
        clearTimeout(delay)
        $('nav > ul > li').removeClass('on')
        $('nav > ul > li > ul').hide()
        $(this).addClass('on')
    mouseleave: (e) ->
      if $(window).width() > 768
        delay = setTimeout (->
          $('nav > ul > li').removeClass('on')
          $('nav > ul > li > ul').hide()
        ), 350
    click: (e) ->
      if $(window).width() < 768
        if $(e.target).parent('li.menu').size() > 0
          $this = $(this)
          $(this).children('ul').slideToggle 300, ->
            $this.toggleClass('on')
          e.preventDefault()
          return false
    tap: (e) ->
      if $(e.target).parent('li.menu').size() > 0
        $this = $(this)
        $(this).children('ul').slideToggle 300, ->
          $this.toggleClass('on')
        e.preventDefault()
        return false

  menu.find('>a').on
    focus: ->
      $(this).parent('li.menu').trigger('mouseenter')

  menu.find('li:last-child > a').on
    blur: ->
      $(this).closest('li.menu').trigger('mouseleave')

  # dropdown buttons
  dropdown = $('.dropdown')

  dropdown.on
    focus: ->
      $(this).addClass('on')

  dropdown.find('li:last-child a').on
    blur: ->
      dropdown.filter('.on').removeClass('on')

  # close dropdowns and menus on body click
  $('body').on 'click', (e) ->
    if $(e.target).hasClass('dropdown')
      $(e.target).toggleClass('on')
    else
      if dropdown.filter('.on').length
        dropdown.filter('.on').removeClass('on')
    if navitem.filter('.menu.on').length
      navitem.filter('.menu.on').removeClass('on')

  return