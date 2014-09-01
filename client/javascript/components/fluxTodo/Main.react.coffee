# @cjsx React.DOM

'use strict'

React = require 'react'
TodoApp = require './TodoApp.react'

module.exports = React.renderComponent(
  <TodoApp />,
  document.getElementById 'todoApp'
)
