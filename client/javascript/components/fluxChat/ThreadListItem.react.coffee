# @cjsx React.DOM

'use strict'

React = require 'react'
ChatThreadActionCreators = require '../../actions/ChatThreadActionCreators'
ReactPropTypes = React.PropTypes
cx = require 'react/lib/cx'

ThreadListItem = React.createClass(
  propTypes:
    thread: ReactPropTypes.object
    currentThreadID: ReactPropTypes.string

  _onClick: ->
    ChatThreadActionCreators.clickThread(@props.thread.id)

  render: ->
    thread = @props.thread
    lastMessage = thread.lastMessage
    return (
      <li
        className={cx(
          'thread-list-item': true
          'active': thread.id is @props.currentThreadID
        )}
        onClick={@_onClick}>
      <h5 className='thread-name'>{thread.name}</h5>
      <div className='thread-time'>
        {lastMessage.date.toLocaleTimeString()}
      </div>
      </li>
    )
)

module.exports = ThreadListItem
