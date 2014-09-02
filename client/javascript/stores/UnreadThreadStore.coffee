'use strict'

ChatAppDispatcher = require '../dispatchers/ChatAppDispatcher'
ChatConstants = require '../constants/ChatConstants'
EventEmitter = require('events').EventEmitter
MessageStore = require '../stores/MessageStore'
ThreadStore = require '../stores/ThreadStore'
merge = require 'react/lib/merge'

ActionTypes = ChatConstants.ActionTypes
CHANGE_EVENT = 'change'

UnreadThreadStore = merge(EventEmitter.prototype,
  emitChange: ->
    @emit(CHANGE_EVENT)

  # @param {function} cb
  addChangeListener: (cb) ->
    @on(CHANGE_EVENT, cb)

  # @param {function} cb
  removeChangeListener: (cb) ->
    @removeListener(CHANGE_EVENT, cb)

  getCount: ->
    threads = ThreadStore.getAll()
    unreadCount = 0
    for id of threads
      if not threads[id].lastMessage.isRead
        unreadCount++
    unreadCount
)

UnreadThreadStore.dispatchToken = ChatAppDispatcher.register((payload) ->
  ChatAppDispatcher.waitFor([
    ThreadStore.dispatchToken
    MessageStore.dispatchToken
  ])

  action = payload.action
  switch action.type
    when ActionTypes.CLICK_THREAD
      UnreadThreadStore.emitChange()
    when ActionTypes.RECEIVE_RAW_MESSAGES
      UnreadThreadStore.emitChange()
    else
      # do nothing
)

module.exports = UnreadThreadStore

