# @cjsx React.DOM

React = require('react')

CommentBox = React.createClass
  render: ->
    <div className="commentBox">
      Hello world, imma comment box.
    </div>

module.exports = React.renderComponent(
  <CommentBox />,
  document.getElementById('main-region')
)
