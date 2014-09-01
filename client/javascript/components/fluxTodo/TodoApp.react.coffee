# @cjsx React.DOM
#
# This component operates as a "Controller-View".  It listens for changes in
# the TodoStore and passes the new data to its children.

'use strict'

React = require 'react'
TodoStore = require '../../stores/TodoStore'
Footer = require './Footer.react'
Header = require './Header.react'
MainSection = require './MainSection.react'

# Retrieve current TODO data from TodoStore.
getTodoState = ->
  allTodos: TodoStore.getAll()
  areAllComplete: TodoStore.areAllComplete()

TodoApp = React.createClass(
  getInitialState: ->
    getTodoState()

  componentDidMount: ->
    TodoStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    TodoStore.removeChangeListener(@_onChange)

  _onChange: ->
    @setState(getTodoState())

  render: ->
    return (
      <div>
        <Header />
        <MainSection
          allTodos={@state.allTodos}
          areAllComplete={@state.areAllComplete}
        />
        <Footer allTodos={@state.allTodos} />
      </div>
    )
)

module.exports = TodoApp
