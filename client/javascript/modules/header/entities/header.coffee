Marionette = require 'backbone.marionette'
HeaderCollection = require '../collections/headers'
Radio = require '../../../radio'

headers = undefined

module.exports =
  initialize: ->
    @setHandlers()

  initializeHeaders: ->
    headers = new HeaderCollection([
      { name: "App", url: "", navigationTrigger: "" }
    ])

  getHeaders: ->
    if headers is undefined
      @initializeHeaders()
    headers

  setHandlers: ->
    Radio.reqres.setHandler "global", "header:entities", =>
      @getHeaders()

