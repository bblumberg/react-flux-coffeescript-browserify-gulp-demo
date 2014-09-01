# @cjsx React.DOM

'use strict'

React = require 'react'
ReactPropTypes = React.PropTypes
TodoActions = require '../../actions/TodoActions'
TodoItem = require './TodoItem.react'

MainSection = React.createClass(
  propTypes:
    allTodos: ReactPropTypes.object.isRequired
    areAllComplete: ReactPropTypes.bool.isRequired

  # Event handler to mark all TODOs as complete
  _onToggleCompleteAll: ->
    TodoActions.toggleCompleteAll()


  render: ->
    # This section should be hidden by default
    # and shown when there are todos.
    return null if Object.keys(@props.allTodos).length < 1

    allTodos = @props.allTodos
    todos = []

    for key of allTodos
      todos.push(<TodoItem key={key} todo={allTodos[key]} />)

    return (
      <section id='main'>
        <input
          id='toggle-all'
          type='checkbox'
          onChange={@_onToggleCompleteAll}
          checked={if @props.areAllComplete then 'checked' else ''}
        />
        <label htmlFor="toggle-all">Mark all as complete</label>
        <ul id='todo-list'>{todos}</ul>
      </section>
    )
)

module.exports = MainSection
