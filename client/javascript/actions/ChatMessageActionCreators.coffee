'use strict'

ChatAppDispatcher = require '../dispatchers/ChatAppDispatcher'
ChatAppDispatcher = require '../dispatchers/ChatAppDispatcher'
ChatConstants = require '../constants/ChatConstants'
ChatWebAPIUtils = require '../utils/ChatWebAPIUtils'
MessageStore = require '../stores/MessageStore'

ActionTypes = ChatConstants.ActionTypes

module.exports =
  createMessage: (text) ->
    ChatAppDispatcher.handleViewAction(
      type: ActionTypes.CREATE_MESSAGE
      text: text
    )
    message = MessageStore.getCreatedMessageData(text)
    ChatWebAPIUtils.createMessage(message)
