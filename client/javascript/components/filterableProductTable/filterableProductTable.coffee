# @cjsx React.DOM

'use strict'

React = require('react')
ProductsTable = require('./productTable')
SearchBar = require('./searchBar')

FilterableProductTable = React.createClass
  getInitialState: ->
    filterText: ''
    inStockOnly: false

  handleUserInput: (filterText, inStockOnly) ->
    @setState
      filterText: filterText
      inStockOnly: inStockOnly

  render: ->
    return (
      <div>
        <SearchBar
          filterText={@state.filterText}
          inStockOnly={@state.inStockOnly}
          onUserInput={@handleUserInput}
        />
        <ProductsTable
          products={@props.products}
          filterText={@state.filterText}
          inStockOnly={@state.inStockOnly}
        />
      </div>
    )

module.exports = FilterableProductTable

