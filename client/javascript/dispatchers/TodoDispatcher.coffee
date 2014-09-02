# A singleton that operates as the central hub for application updates.
'use strict'

Dispatcher = require 'flux/lib/Dispatcher'

copyProperties = require 'react/lib/copyProperties'

TodoDispatcher = copyProperties(new Dispatcher(),
  # A bridge function between the views and the dispatcher, marking the action
  # as a view action.  Another variant here could be handleServerAction.
  # @param  {object} action The data coming from the view.
  handleViewAction: (action) ->
    @dispatch(
      source: 'VIEW_ACTION'
      action: action
    )
)

module.exports = TodoDispatcher
