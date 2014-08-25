Marionette = require 'backbone.marionette'
$ = require 'jquery'
Radio = require '../../radio'

SidebarsView = require './views/sidebars_view'
SidebarEntity = require './entities/sidebar'

module.exports = Marionette.Controller.extend
  initialize: ->
    SidebarEntity.initialize()
    @setHandlers()

  setActiveSidebar: (sidebarUrl) ->
    links = Radio.reqres.request "global", "sidebar:entities"
    sidebarToSelect = links.find( (sidebar) ->
      sidebar.get('url') is sidebarUrl
    )
    sidebarToSelect.select()
    links.trigger('reset')

  listSidebar: ->
    links = Radio.reqres.request "global", "sidebar:entities"
    sidebars = new SidebarsView collection: links

    sidebars.on "brand:clicked", ->
      Radio.vent.trigger "global", "page:support"

    sidebars.on "childview:navigate", (childView, model) ->
      trigger = model.get "navigationTrigger"
      Radio.vent.trigger "global", trigger

    @options.sidebarRegion.show sidebars

  setHandlers: ->
    Radio.commands.setHandler 'global', 'set:active:sidebar', (name) =>
      @setActiveSidebar(name)

    Radio.vent.on 'global', 'toggle:sidebar', ->
      $('#page-wrapper').toggleClass('active')
