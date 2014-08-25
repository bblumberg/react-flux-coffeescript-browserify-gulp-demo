Marionette = require 'backbone.marionette'
SidebarCollection = require '../collections/sidebars'
Radio = require '../../../radio'

sidebars = undefined

module.exports =
  initialize: ->
    @setHandlers()

  initializeSidebars: ->
    sidebars = new SidebarCollection([
      { name: "App", url: "", navigationTrigger: "" }
    ])

  getSidebars: ->
    if sidebars is undefined
      @initializeSidebars()
    sidebars

  setHandlers: ->
    Radio.reqres.setHandler "global", "sidebar:entities", =>
      @getSidebars()

