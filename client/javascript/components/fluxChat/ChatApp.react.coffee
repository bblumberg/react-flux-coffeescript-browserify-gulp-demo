# @cjsx React.DOM

'use strict'

React = require 'react'
MessageSection = require './MessageSection.react'
ThreadSection = require './ThreadSection.react'

ChatApp = React.createClass(
  render: ->
    return (
      <div className='chatapp'>
        <ThreadSection />
        <MessageSection />
      </div>
    )
)

module.exports = ChatApp
