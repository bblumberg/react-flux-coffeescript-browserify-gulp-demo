'use strict'

ChatAppDispatcher = require '../dispatchers/ChatAppDispatcher'
ChatConstants = require '../constants/ChatConstants'
ChatMessageUtils = require '../utils/ChatMessageUtils'
EventEmitter = require('events').EventEmitter
ThreadStore = require '../stores/ThreadStore'
merge = require 'react/lib/merge'

ActionTypes = ChatConstants.ActionTypes
CHANGE_EVENT = 'change'

_messages = {}

_addMessages = (rawMessages) ->
  rawMessages.forEach((message) ->
    if not _messages[message.id]
      _messages[message.id] = ChatMessageUtils.convertRawMessage(
        message,
        ThreadStore.getCurrentID()
      )
  )

_markAllInThreadRead = (threadID) ->
  for id of _messages
    if _messages[id].threadID is threadID
      _messages[id].isRead = true

MessageStore = merge(EventEmitter.prototype,
  emitChange: ->
    @emit(CHANGE_EVENT)

  # @param {function} callback
  addChangeListener: (callback) ->
    @on(CHANGE_EVENT, callback)

  get: (id) ->
    _messages[id]

  getAll: ->
    _messages

  # @param {string} threadID
  getAllForThread: (threadID) ->
    threadMessages = []
    for id of _messages
      if _messages[id].threadID is threadID
        threadMessages.push(_messages[id])
    threadMessages.sort((a, b) ->
      if a.date < b.date
        -1
      else if a.date > b.date
        1
      0
    )
    threadMessages

  getAllForCurrentThread: ->
    @getAllForThread(ThreadStore.getCurrentID())

  getCreatedMessageData: (text) ->
    timestamp = Date.now()
    return (
      id: 'm_' + timestamp
      threadID: ThreadStore.getCurrentID()
      authorName: 'Bill' # hardcoded as example
      date: new Date(timestamp)
      isRead: true
    )
)

MessageStore.dispatchToken = ChatAppDispatcher.register((payload) ->
  action = payload.action

  switch action.type
    when ActionTypes.CLICK_THREAD
      ChatAppDispatcher.waitFor([ThreadStore.dispatchToken])
      _markAllInThreadRead(ThreadStore.getCurrentID())
      MessageStore.emitChange()
    when ActionTypes.CREATE_MESSAGE
      message = MessageStore.getCreatedMessageData(action.text)
      _messages[message.id] = message
      MessageStore.emitChange()
    when ActionTypes.RECEIVE_RAW_MESSAGES
      _addMessages(action.rawMessages)
      ChatAppDispatcher.waitFor([ThreadStore.dispatchToken])
      _markAllInThreadRead(ThreadStore.getCurrentID())
      MessageStore.emitChange()
    else
      # Do nothing
)

module.exports = MessageStore
