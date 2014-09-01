# @cjsx React.DOM

'use strict'

React = require 'react'
TodoActions = require '../../actions/TodoActions'
TodoTextInput = require './TodoTextInput.react'

Header = React.createClass(
  # Event handler called within TodoTextInput.
  # Defining this here allows TodoTextInput to be used in multiple places
  # in different ways.
  # @param {string} text
  _onSave: (text) ->
    TodoActions.create(text) if text.trim()

  render: ->
    return (
      <header id='header'>
        <h1>todos</h1>
        <TodoTextInput
          id='new-todo'
          placeholder='What needs to be done?'
          onSave={@_onSave}
        />
      </header>
    )
)

module.exports = Header
