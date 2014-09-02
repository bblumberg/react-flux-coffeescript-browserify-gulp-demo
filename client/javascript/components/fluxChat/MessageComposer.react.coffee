# @cjsx React.DOM

'use strict'

React = require 'react'

ChatMessageActionCreators = require '../../actions/ChatMessageActionCreators'

ENTER_KEY_CODE = 13

MessageComposer = React.createClass(
  getInitialState: ->
    text: ''

  _onChange: (e, val) ->
    @setState(text: e.target.value)

  _onKeyDown: (e) ->
    if e.keyCode is ENTER_KEY_CODE
      console.log @state.text
      text = @state.text.trim()
      ChatMessageActionCreators.createMessage(text) if text
      @setState(text: '')

  render: ->
    return (
      <textarea
        className='message-composer'
        name='message'
        value={@state.text}
        onChange={@_onChange}
        oneKeyDown={@_onKeyDown}
      />
    )
)

module.exports = MessageComposer
