'use strict'

$ ->

  isOpen = location.hash is '#open'

  _animate = ->
    setTimeout(->
      $('.cover').addClass 'animated'
    , 1000)

  _expand = (options)->
    $('main, .cover, html, #menu-button').toggleClass 'expanded'
    Uno.search.form options.form

  $('#menu-button').click ->
    $('.cover, main, #menu-button, html').toggleClass 'expanded'

  $("#{window.open_button}, #avatar-link, .nav-home").click (event) ->
    if Uno.is 'page', 'home'
      event.preventDefault()
      location.hash = if location.hash is '' then '#open' else ''
      return $('#menu-button').trigger 'click' unless Uno.is 'device', 'desktop'
      _expand form: 'toggle'

  if (Uno.is 'page', 'home')
    _animate()
    _expand form: 'hide' if !isOpen


