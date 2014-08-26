# @cjsx React.DOM

React = require('react')
Comment = require('./comment')

module.exports = React.createClass
  render: ->
    commentNodes = @props.data.map( (comment) ->
      <Comment author={comment.author}>
        {comment.text}
      </Comment>
    )

    <div className="commentList">
      {commentNodes}
    </div>
