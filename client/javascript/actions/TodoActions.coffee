'use strict'

TodoDispatcher = require '../dispatchers/TodoDispatcher'
TodoConstants = require '../constants/TodoConstants'

TodoActions =
  # @param  {string} text
  create: (text) ->
    TodoDispatcher.handleViewAction(
      actionType: TodoConstants.TODO_CREATE
      text: text
    )

  # @param  {string} id The ID of the Todo Item
  # @param  {string} text
  updateText: (id, text) ->
    TodoDispatcher.handleViewAction(
      actionType: TodoConstants.TODO_UPDATE_TEXT
      id: id
      text: text
    )

  # Toggle whether a single Todo is complete
  # @param  {object} todo
  toggleComplete: (todo) ->
    id = todo.id
    if todo.complete
      TodoDispatcher.handleViewAction(
        actionType: TodoConstants.TODO_UNDO_COMPLETE
        id: id
      )
    else
      TodoDispatcher.handleViewAction(
        actionType: TodoConstants.TODO_COMPLETE
        id: id
      )

  # Mark all Todos as complete
  toggleCompleteAll: ->
    TodoDispatcher.handleViewAction(
      actionType: TodoConstants.TODO_TOGGLE_COMPLETE_ALL
    )

  # @param  {string} id
  destroy: (id) ->
    TodoDispatcher.handleViewAction(
      actionType: TodoConstants.TODO_DESTROY
      id: id
    )

  # Delete all the completed Todos
  destroyCompleted: ->
    TodoDispatcher.handleViewAction(
      actionType: TodoConstants.TODO_DESTROY_COMPLETED
    )

module.exports = TodoActions
