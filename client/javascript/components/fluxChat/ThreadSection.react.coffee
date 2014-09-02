# @cjsx React.DOM

'use strict'

React = require 'react'
MessageStore = require '../../stores/MessageStore'
ThreadStore = require '../../stores/ThreadStore'
UnreadThreadStore = require '../../stores/UnreadThreadStore'
ThreadListItem = require './ThreadListItem.react'

getStateFromStores = ->
  threads: ThreadStore.getAllChrono()
  currentThreadID: ThreadStore.getCurrent()
  unreadCount: UnreadThreadStore.getCount()

ThreadSection = React.createClass(
  getInitialState: ->
    getStateFromStores()

  componentDidMount: ->
    ThreadStore.addChangeListener(@_onChange)
    UnreadThreadStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    ThreadStore.removeChangeListener(@_onChange)
    UnreadThreadStore.removeChangeListener(@_onChange)

  _onChange: ->
    @setState(getStateFromStores())

  render: ->
    console.log @state.currentThreadID
    threadListItems = @state.threads.map(
      ((thread) ->
        return (
          <ThreadListItem
            key={thread.id}
            thread={thread}
            currentThreadID={@state.currentThreadID}
          />
        )
      ), @)

    unread = if @state.unreadCount is 0
      null
    else
      <span>Unread threads: {@state.unreadCount}</span>

    return (
      <div className='thread-section'>
        <div className='thread-count'>
          {unread}
        </div>
        <ul className='thread-list'>
          {threadListItems}
        </ul>
      </div>
    )
)

module.exports = ThreadSection
