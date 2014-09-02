'use strict'

TodoDispatcher = require '../dispatchers/TodoDispatcher'
EventEmitter = require('events').EventEmitter
TodoConstants = require '../constants/TodoConstants'
merge  = require 'react/lib/merge'

CHANGE_EVENT = 'change'

_todos = {}

# Create a TODO item.
# @param  {string} text The content of the TODO
create = (text) ->
  # Hand waving here -- not showing how this interacts with XHR or persistent
  # server-side storage.
  # Using the current timestamp in place of a real id.
  id = Date.now()
  _todos[id] =
    id: id
    complete: false
    text: text

# Update a TODO item.
# @param  {string} id
# @param  {object} updates An object literal containing only the data to be updated.
update = (id, updates) ->
  _todos[id] = merge(_todos[id], updates)

# Update all of the TODO items with the same object.
# Used to mark all TODOs as completed.
# @param  {object} updates An object literal containing only the data to be updated.
updateAll = (updates) ->
  for id of _todos
    update(id, updates)

# Delete a TODO item.
# @param  {string} id
destroy = (id) ->
  delete _todos[id]

destroyCompleted = ->
  for id of _todos
    destroy(id) if _todos[id].complete

TodoStore = merge(EventEmitter.prototype,
  # Tests whether all the remaining TODO items are marked as completed.
  # @return {boolean}
  areAllComplete: ->
    for id of _todos
      return false if not _todos[id].complete
    true

  # Get the entire collection of TODOs.
  # @return {object}
  getAll: ->
    _todos

  emitChange: ->
    @emit(CHANGE_EVENT)

  # @param {function} cb
  addChangeListener: (cb) ->
    @on(CHANGE_EVENT, cb)

  # @param {function} cb
  removeChangeListener: (cb) ->
    @removeListener(CHANGE_EVENT, cb)
)

# Register Todo dispatcher to handle all updates
TodoDispatcher.register((payload) ->
  action = payload.action

  switch action.actionType
    when TodoConstants.TODO_CREATE
      text = action.text.trim()
      create(text) if text isnt ''

    when TodoConstants.TODO_TOGGLE_COMPLETE_ALL
      if TodoStore.areAllComplete
        updateAll(complete: false)
      else
        updateAll(complete: true)

    when TodoConstants.TODO_UNDO_COMPLETE
      update(action.id, complete: false)

    when TodoConstants.TODO_COMPLETE
      update(action.id, complete: true)

    when TodoConstants.TODO_UPDATE_TEXT
      text = action.text.trim()
      update(action.id, text: text) if text not ''

    when TodoConstants.TODO_DESTROY
      destroy(action.id)

    when TodoConstants.TODO_DESTROY_COMPLETED
      destroyCompleted()

    else
      true

  # This often goes in each case that should trigger a UI change. This store
  # needs to trigger a UI change after every view action, so we can make the
  # code less repetitive by putting it here.  We need the default case,
  # however, to make sure this only gets called after one of the cases above.
  TodoStore.emitChange()

  # No errors. Needed by promise in Dispatcher.
  true
)

module.exports = TodoStore
