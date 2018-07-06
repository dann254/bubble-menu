module.exports =
class BubbleMenuDefaults
  constructor: () ->
    @config_data = [
      {
        command: "bubble-menu:config"
        icon: "fa-cogs"
        text: "bubble config"
      }
      {
        command: "window:reload"
        icon: "fa-refresh"
        text: "Reload atom"
      }
      {
        command: "settings-view:open"
        icon: "fa-cog"
        text: "Settings"
      }
      {
        command: "settings-view:core"
        icon: "fa-sun-o"
        text: "Core settings"
      }
      {
        command: "settings-view:editor"
        icon: "fa-wrench"
        text: "Editor settings"
      }
    ]
  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getDefaults: ->
    @config_data
