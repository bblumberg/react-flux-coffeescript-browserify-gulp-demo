# @cjsx React.DOM

'use strict'

React = require('react')

SearchBar = React.createClass
  handleChange: ->
    @props.onUserInput(
      @refs.filterTextInput.getDOMNode().value,
      @refs.inStockOnlyInput.getDOMNode().checked
    )

  render: ->
    return (
      <form>
        <input
          type='text'
          placeholder='search...'
          value={@props.filterText}
          ref='filterTextInput'
          onChange={@handleChange}
        />
        <p>
          <input
            type='checkbox'
            value={@props.inStockOnly}
            ref='inStockOnlyInput'
            onChange={@handleChange}
          />
          Only show products in stock.
        </p>
      </form>
    )

module.exports = SearchBar
