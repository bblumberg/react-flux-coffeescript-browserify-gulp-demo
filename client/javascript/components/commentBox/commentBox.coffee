# @cjsx React.DOM

'use strict'

React = require('react')
$ = require('jquery')

CommentList = require('./commentList')
CommentForm = require('./commentForm')

CommentBox = React.createClass
  loadCommentsFromServer: ->
    $.ajax(
      url: @props.url
      dataType: 'json'
      success:( (data) ->
        @setState {data}
      ).bind(@)
      error:( (xhr, status, err) ->
        console.error @props.url, status, err.toString()
      ).bind(@)
    )

  handleCommentSubmit: (comment) ->
    comments = @state.data
    newComments = comments.concat([comment])
    @setState data: newComments
    $.ajax(
      url: @props.url
      dataType: 'json'
      type: 'POST'
      data: comment
      success:( (data) ->
        @setState {data}
      ).bind(@)
      error:( (xhr, status, err) ->
        console.error @props.url, status, err.toString()
      ).bind(@)
    )

  getInitialState: ->
    { data: [] }

  componentDidMount: ->
    @loadCommentsFromServer()
    setInterval(@loadCommentsFromServer, @props.pollInterval)

  render: ->
    <div className="commentBox">
      <h1>Comments</h1>
      <CommentList data={@state.data} />
      <CommentForm onCommentSubmit={@handleCommentSubmit} />
    </div>

module.exports = CommentBox
