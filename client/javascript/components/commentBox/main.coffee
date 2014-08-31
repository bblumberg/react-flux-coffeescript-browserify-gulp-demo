# @cjsx React.DOM

'use strict'

React = require('react')
CommentBox = require('./commentBox')
baseURL = "http://localhost:3001/api/"

module.exports = React.renderComponent(
  <CommentBox url={baseURL + "comment"} pollInterval={2000000}/>,
  document.getElementById('commentBox-region')
)
