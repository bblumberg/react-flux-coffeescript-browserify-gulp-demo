Marionette = require 'backbone.marionette'
SidebarController = require './sidebar_controller'

module.exports = class SidebarModule extends Marionette.Module
  onStart: ->
    @startMediator()
    @controller.listSidebar()

  startMediator: ->
    @controller = new SidebarController
      sidebarRegion: @app.sidebarRegion

