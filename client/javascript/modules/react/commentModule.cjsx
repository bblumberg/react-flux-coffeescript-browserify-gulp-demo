# @cjsx React.DOM

React = require('react')

CommentBox = require('./commentBox')

module.exports = React.renderComponent(
  <CommentBox url="data/comments.json" />,
  document.getElementById('main-region')
)
