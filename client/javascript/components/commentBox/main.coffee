# @cjsx React.DOM

'use strict'

React = require('react')
CommentBox = require('./commentBox')

module.exports = React.renderComponent(
  <CommentBox url="data/comments.json" pollInterval={2000000}/>,
  document.getElementById('commentBox-region')
)
