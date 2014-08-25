Marionette = require 'backbone.marionette'
HeaderController = require './header_controller'

module.exports = class HeaderModule extends Marionette.Module
  onStart: ->
    @startMediator()
    @controller.setActiveHeader("")

  startMediator: ->
    @controller = new HeaderController
      headerRegion: @app.headerRegion

