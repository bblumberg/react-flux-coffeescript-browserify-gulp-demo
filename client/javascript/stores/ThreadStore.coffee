'use strict'

ChatAppDispatcher = require '../dispatchers/ChatAppDispatcher'
ChatConstants = require '../constants/ChatConstants'
ChatMessageUtils = require '../utils/ChatMessageUtils'
EventEmitter = require('events').EventEmitter
merge = require 'react/lib/merge'

ActionTypes = ChatConstants.ActionTypes
CHANGE_EVENT = 'change'

_currentID = null
_threads = {}

ThreadStore = merge(EventEmitter.prototype,
  init: (rawMessages) ->
    rawMessages.forEach((message) ->
      threadID = message.threadID
      thread = _threads[threadID]
      return if thread and (thread.lastTimestamp > message.timestamp)
      _threads[threadID] =
        id: threadID
        name: message.threadName
        lastMessage: ChatMessageUtils.convertRawMessage(message, _currentID)
    , @)

    if not _currentID
      allChrono = @getAllChrono()
      _currentID = allChrono[allChrono.length - 1].id

    _threads[_currentID].lastMessage.isRead = true

  emitChange: ->
    @emit(CHANGE_EVENT)

  # @param {function} cb
  addChangeListener: (cb) ->
    @on(CHANGE_EVENT, cb)

  # @param {function} cb
  removeChangeListener: (cb) ->
    @removeListener(CHANGE_EVENT, cb)

  # @param {string} id
  get: (id) ->
    _threads[id]

  getAll: ->
    _threads

  getAllChrono: ->
    orderedThreads = []
    for id of _threads
      thread = _threads[id]
      orderedThreads.push(thread)
    orderedThreads.sort((a, b) ->
      if a.lastMessage.date < b.lastMessage.date
        -1
      else if a.lastMessage.date > b.lastMessage.date
        1
      0
    )
    orderedThreads

  getCurrentID: ->
    _currentID

  getCurrent: ->
    @get(@getCurrentID())
)

ThreadStore.dispatchToken = ChatAppDispatcher.register((payload) ->
  action = payload.action

  switch action.type
    when ActionTypes.CLICK_THREAD
      _currentID = action.threadID
      _threads[_currentID].lastMessage.isRead = true
      ThreadStore.emitChange()
    when ActionTypes.RECEIVE_RAW_MESSAGES
      ThreadStore.init(action.rawMessages)
      ThreadStore.emitChange()
    else
      # Do nothing
)

module.exports = ThreadStore
