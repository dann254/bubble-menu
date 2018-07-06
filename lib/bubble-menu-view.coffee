fs = require 'fs-plus'
season = require 'season'
OS = require 'os'
BubbleMenuDefaults = require './bubble-menu-defaults'
module.exports =
class BubbleMenuView
  constructor: (serializedState) ->
    @home = OS.homedir()
    @bubbleDefaults = new BubbleMenuDefaults()
    config_url = @home + '/.atom/bubble-menu.cson'

    if !season.resolve config_url
      season.writeFileSync config_url , @bubbleDefaults.getDefaults(), (err) ->
        if err
          throw err
        return
      console.log 'Bubble config Created!'

    # Create root element
    @element = document.createElement('div')
    @element.classList.add('ice-bubble-container')
    @element.classList.add('bubble-hide')

    # Create menu element
    menu_items = document.createElement('ul')

    menu_items.classList.add('ice-bubble-menu')
    toggleButton = document.createElement 'li'
    toggleButton.classList.add 'toggle'
    toggleButton.classList.add 'fa-th'
    menu_items.appendChild toggleButton

    @crusts = season.readFileSync config_url, (err) ->
      if err
        throw err
      return

    for crust in @crusts
      bubble = document.createElement 'li'
      bubble.classList.add 'menu-item'
      bubble.setAttribute 'data-event-name', crust.command
      bubble.classList.add crust.icon

      bubbleText = document.createElement 'span'
      bubbleText.classList.add 'bubbleText'
      textVariables = document.createTextNode(crust.text)
      bubbleText.appendChild textVariables

      bubble.appendChild bubbleText
      menu_items.appendChild bubble

    @element.appendChild(menu_items)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
