# @cjsx React.DOM

'use strict'

React = require 'react'
MessageComposer = require './MessageComposer.react'
MessageListItem = require './MessageListItem.react'
MessageStore = require '../../stores/MessageStore'
ThreadStore = require '../../stores/ThreadStore'

getStateFromStores = ->
  messages: MessageStore.getAllForCurrentThread()
  thread: ThreadStore.getCurrent()

getMessageListItem = (message) ->
  return (
    <MessageListItem
      key={message.id}
      message={message}
    />
  )

MessageSection = React.createClass(
  getInitialState: ->
    getStateFromStores()

  _scrollToBottom: ->
    ul = @refs.messageList.getDOMNode()
    ul.scrollTop = ul.scroll

  # Event handler for 'change' events coming from the MessageStore
  _onChange: ->
    @setState(getStateFromStores())

  componentDidMount: ->
    @_scrollToBottom()
    MessageStore.addChangeListener(@_onChange)
    ThreadStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    MessageStore.removeChangeListener(@_onChange)
    ThreadStore.removeChangeListener(@_onChange)

  render: ->
    messageListItems = @state.messages.map(getMessageListItem)
    return (
      <div className="message-section">
        <h3 className='message-thread-heading'>
          {@state.thread.name}
        </h3>
        <ul className='message-list' ref='messageList'>
          {messageListItems}
        </ul>
        <MessageComposer />
      </div>
    )
)

module.exports = MessageSection
