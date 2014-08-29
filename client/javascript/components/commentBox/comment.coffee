# @cjsx React.DOM

'use strict'

React = require('react')
Showdown = require('showdown')

converter = new Showdown.converter()

module.exports = React.createClass
  render: ->
    <div className="comment">
      <h2 className="commentAuthor">
        {@props.author}
      </h2>
      {converter.makeHtml(@props.children.toString())}
    </div>
