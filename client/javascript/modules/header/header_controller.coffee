Marionette = require 'backbone.marionette'
Radio = require '../../radio'

HeaderView = require './views/header_view'
HeaderEntity = require './entities/header'

module.exports = Marionette.Controller.extend
  initialize: ->
    HeaderEntity.initialize()
    @setHandlers()

  setActiveHeader: (headerUrl) ->
    links = Radio.reqres.request "global", "header:entities"
    headerToSelect = links.find( (header) ->
      header.get('url') is headerUrl
    )
    header = new HeaderView model: headerToSelect
    @options.headerRegion.show header

  setHandlers: ->
    Radio.commands.setHandler 'global', 'set:active:header', (name) =>
      @setActiveHeader(name)
