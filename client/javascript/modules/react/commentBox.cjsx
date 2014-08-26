# @cjsx React.DOM

React = require('react')
CommentList = require('./commentList')
CommentForm = require('./commentForm')

module.exports = React.createClass
  getInitialState: ->
    { data: [] }
  componentDidMount: ->
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
  render: ->
    <div className="commentBox">
      <h1>Comments</h1>
      <CommentList data={ @state.data }/>
      <CommentForm />
    </div>
