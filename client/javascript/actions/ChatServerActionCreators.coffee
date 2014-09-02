'use strict'

ChatAppDispatcher = require '../dispatchers/ChatAppDispatcher'
ChatConstants = require '../constants/ChatConstants'

ActionTypes = ChatConstants.ActionTypes

module.exports =
  receiveAll: (rawMessages) ->
    ChatAppDispatcher.handleServerAction(
      type: ActionTypes.RECEIVE_RAW_MESSAGES
      rawMessages: rawMessages
    )

  receiveCreatedMessage: (createdMessages) ->
    ChatAppDispatcher.handleServerAction(
      type: ActionTypes.RECEIVE_RAW_CREATED_MESSAGE
      rawMessages: createdMessages
    )

