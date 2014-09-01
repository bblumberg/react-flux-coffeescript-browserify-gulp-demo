# @cjsx React.DOM

'use strict'

React = require 'react'
ChatApp = require './ChatApp.react'
ChatExampleData = require '../../data/ChatExampleData'
ChatWebAPIUtils = require '../../utils/ChatWebAPIUtils'

# Load example data into localStorage
ChatExampleData.init()

ChatWebAPIUtils.getAllMessages()

module.exports = React.renderComponent(
  <ChatApp />,
  document.getElementById 'chatApp'
)
