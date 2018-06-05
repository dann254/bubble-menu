BubbleMenuView = require './bubble-menu-view'
{CompositeDisposable} = require 'atom'

module.exports = BubbleMenu =
  bubbleMenuView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @bubbleMenuView = new BubbleMenuView(state.bubbleMenuViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @bubbleMenuView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'bubble-menu:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @bubbleMenuView.destroy()

  serialize: ->
    bubbleMenuViewState: @bubbleMenuView.serialize()

  toggle: ->
    console.log 'BubbleMenu was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
