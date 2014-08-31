Marionette = require 'backbone.marionette'
SidebarView = require './sidebar_view'
Radio = require '../../../radio'

module.exports = Marionette.CompositeView.extend
  template: require './templates/sidebar_template'
  childView: SidebarView
  childViewContainer: "ul"

  events:
    "click li#toggle-sidebar": "toggleSidebar"

  toggleSidebar: (e) ->
    e.preventDefault()
    Radio.vent.trigger 'global', 'toggle:sidebar'
