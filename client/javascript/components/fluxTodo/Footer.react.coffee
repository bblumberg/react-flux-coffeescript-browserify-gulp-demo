# @cjsx React.DOM

'use strict'

React = require 'react'
ReactPropTypes = React.PropTypes
TodoActions = require '../../actions/TodoActions'

Footer = React.createClass(
  propTypes:
    allTodos: ReactPropTypes.object.isRequired

  # Event handler to delete all completed TODOs
  _onClearCompletedClick: ->
    TodoActions.destroyCompleted()

  render: ->
    allTodos = @props.allTodos
    total = Object.keys(allTodos).length

    return null if total is 0

    completed = 0
    for key of allTodos
      completed++ if allTodos[key].complete

    itemsLeft = total - completed
    itemsLeftPhrase = if itemsLeft is 1 then ' item ' else ' items '
    itemsLeftPhrase += 'left'

    # Undefined and thus not rendered if no completed items are left.
    if completed
      clearCompletedButton =
        <button
          id="clear-completed"
          onClick={@_onClearCompletedClick}>
          Clear completed ({completed})
        </button>

    return (
      <footer id="footer">
        <span id="todo-count">
          <strong>
            {itemsLeft}
          </strong>
          {itemsLeftPhrase}
        </span>
        {clearCompletedButton}
      </footer>
    )
)

module.exports = Footer
