'use strict'

ChatAppDispatcher = require '../dispatchers/ChatAppDispatcher'
ChatConstants = require '../constants/ChatConstants'

ActionTypes = ChatConstants.ActionTypes

module.exports =
  clickThread: (threadID) ->
    ChatAppDispatcher.handleViewAction(
      type: ActionTypes.CLICK_THREAD
      threadID: threadID
    )
