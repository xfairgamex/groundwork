###
 *
 *  Groundwork JS by Gary Hepting - https://github.com/groundworkcss/groundwork
 *  
 *  Open source under the BSD License. 
 *
 *  Copyright © 2013 Gary Hepting. All rights reserved.
 *
###

$(document).ready ->

  # navigation menus
  delay = ''
  $('nav > ul > li.menu').on
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
  
  # select all text on invalid input field entries
  $('.error input, .error textarea, 
     .invalid input, .invalid textarea, 
     input.error, textarea.error, 
     input.invalid, textarea.invalid').on
    click: ->
      $(this).focus()
      $(this).select()

  # polyfill select box placeholders
  $('span.select select').each ->
    if $(this).children('option').first().val() == '' and $(this).children('option').first().attr('selected')
      $(this).addClass('unselected')
    else
      $(this).removeClass('unselected')
  $('span.select select').on
    change: ->
      if $(this).children('option').first().val() == '' and $(this).children('option').first().attr('selected')
        $(this).addClass('unselected')
      else
        $(this).removeClass('unselected')

  # tabs
  $('.tabs > ul > li > a').not('.disabled').click (e) ->
    tabs = $(this).parents('.tabs')
    tabs.find('> ul li a').removeClass('active')
    $(this).addClass('active')
    tabs.children('div').removeClass('active')
    tabs.children($(this).attr('href')).addClass('active')
    e.preventDefault()
    return false

  # responsive headings
  $('.responsive').each (index, object) ->
    scale = 10
    min = 10
    max = 200
    scale = parseFloat $(this).attr('data-scale') || scale
    min = parseFloat $(this).attr('data-min') || min
    max = parseFloat $(this).attr('data-max') || max
    $(object).responsiveText
      agressiveness: scale,
      minSize: min,
      maxSize: max

$(window).load ->
  $('.slider').orbit()