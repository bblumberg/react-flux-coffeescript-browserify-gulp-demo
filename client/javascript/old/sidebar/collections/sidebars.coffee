Backbone = require 'backbone'
Backbone.Picky = require 'backbone.picky'
_ = require 'underscore'

Sidebar = require '../models/sidebar'

module.exports = Backbone.Collection.extend
  model: Sidebar
  initialize: ->
    singleSelect = new Backbone.Picky.SingleSelect(@)
    _.extend(@, singleSelect)
