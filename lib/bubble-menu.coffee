BubbleMenuView = require './bubble-menu-view'
{CompositeDisposable} = require 'atom'
$ = jQuery = require 'jquery'
OS = require 'os'

module.exports = BubbleMenu =
  bubbleMenuView: null
  subscriptions: null

  config:
    bubbletext:
      title: "Bubble Text",
      description: "select if you want to display the pop up text beside icons",
      type: "boolean",
      default: false,
      order: 1
    bubbleReaction:
      title: "Bubble Reaction",
      description: "unselect if you want the bubble menu to stay open until the close button is clicked",
      type: "boolean",
      default: true,
      order: 2

    bubbleColor:
      type: 'color'
      default: 'cyan'
      description: "select bubble text color"
      order: 3

    bubbleBorder:
      type: 'color'
      default: 'cyan'
      description: "select bubble border color"
      order: 4

    bubbleBackground:
      type: 'color'
      default: 'black'
      description: "select bubble background color"
      order: 5

  activate: (state) ->

    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'bubble-menu:config': => @bconfig()

    @bubbleMenuView = new BubbleMenuView(state.bubbleMenuViewState)
    workspaceElement = atom.views.getView(atom.workspace).querySelector '.vertical > .panes'
    workspaceElement.appendChild @bubbleMenuView.getElement()

    start(@close)

    atom.config.observe "bubble-menu.bubbletext", (value) ->
      if !value
        $('.bubbleText').hide()
      else
        $('.bubbleText').show()

    atom.config.observe "bubble-menu.bubbleColor", (value) ->
      colorChange(value, 'color', 'li')
    atom.config.observe "bubble-menu.bubbleBorder", (value) ->
      colorChange(value, 'border-color', 'li')
      colorChange(value, 'border-color', 'span')
    atom.config.observe "bubble-menu.bubbleBackground", (value) ->
      colorChange(value, 'background-color', 'li')
      colorChange(value, 'background-color', 'span')

  deactivate: ->
    @bubbleMenuView.destroy()

  serialize: ->
    # bubbleMenuViewState: @bubbleMenuView.serialize()

  bconfig: ->
    console.log 'bam!!!'
    @home = OS.homedir()
    atom.workspace.open(@home + '/.atom/bubble-menu.cson', [activate: true])

start =(close) ->
  $('.ice-bubble-menu > .toggle').click ->
  	togglerFunc()
  $('.ice-bubble-menu').find('.menu-item').click ->
    commander = $(this).attr('data-event-name')
    atom.commands.dispatch(this, commander);
    if checkBubbleReaction()
      togglerFunc()
  togglerFunc = ->
    if $('.ice-bubble-menu').hasClass('transformium')
      $('.ice-bubble-menu').removeClass('transformium')
      setTimeout ( ->
        $('.ice-bubble-menu > .toggle').removeClass('fa-times')
        $('.ice-bubble-menu > .toggle').addClass('fa-th')

        $(".ice-bubble-container").removeClass("bubble-display")
        $(".ice-bubble-container").addClass("bubble-hide")
      ), 600
    else
      $('.ice-bubble-menu').addClass('transformium')
      setTimeout ( ->
        $('.ice-bubble-menu > .toggle').removeClass('fa-th')
        $('.ice-bubble-menu > .toggle').addClass('fa-times')
      ), 600

  $(".ice-bubble-container").mouseenter ->
    $(".ice-bubble-container").addClass("bubble-display")
    $(".ice-bubble-container").removeClass("bubble-hide")

  $(".ice-bubble-container").mouseleave ->
    if $('.ice-bubble-menu').hasClass('transformium')
      #pass
    else
      $(".ice-bubble-container").removeClass("bubble-display")
      $(".ice-bubble-container").addClass("bubble-hide")

colorChange = (color, type, element) ->
      $('.ice-bubble-menu').find(element).css(type, color)

checkBubbleReaction = ->
  atom.config.observe "bubble-menu.bubbleReaction", (value) ->
    @close = value
  @close
