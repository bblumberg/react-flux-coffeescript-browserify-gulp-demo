'use strict'

ChatConstants = require '../constants/ChatConstants'
Dispatcher = require 'flux/lib/Dispatcher'

copyProperties = require 'react/lib/copyProperties'

PayloadSources = ChatConstants.PayloadSources

ChatAppDispatcher = copyProperties(new Dispatcher(),

  # @param {object} action The details of the action, including the action's
  # type and additional data coming from the server.
  handleServerAction: (action) ->
    payload =
      source: PayloadSources.SERVER_ACTION
      action: action
    @dispatch(payload)

  # @param {object} action The details of the action, including the action's
  # type and additional data coming from the view.
  handleViewAction: (action) ->
    payload =
      source: PayloadSources.VIEW_ACTION
      action: action
    @dispatch(payload)
)

module.exports = ChatAppDispatcher
