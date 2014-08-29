# @cjsx React.DOM

'use strict'

React = require('react')

ProductCategoryRow = React.createClass
  render: ->
    <tr><th colSpan="2:">{@props.category}</th></tr>

module.exports = ProductCategoryRow
