# @cjsx React.DOM

'use strict'

React = require('react')

ProductRow = React.createClass
  render: ->
    name = if @props.product.stocked
      @props.product.name
    else
      <span style={{color: 'red'}}>
        {@props.product.name}
      </span>

    return (
      <tr>
        <td>{name}</td>
        <td><@props.product.price</td>
      </tr>
    )

module.exports = ProductRow
