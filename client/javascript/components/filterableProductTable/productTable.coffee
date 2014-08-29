# @cjsx React.DOM

'use strict'

React = require('react')
ProductRow = require('./productRow')
ProductCategoryRow = require('./productCategoryRow')

ProductTable = React.createClass
  render: ->
    rows = []
    lastCategory = null

    @props.products.forEach( (product) =>
      return if product.name.indexOf(@props.filterText) is -1 or
        (not product.stocked and @props.inStockOnly)
      if product.category isnt lastCategory
        rows.push(<ProductCategoryRow category={product.category} key={product.category} />)
      rows.push(<ProductRow product={product} key={product.name} />)
      lastCategory = product.category
    )

    return (
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>{rows}</tbody>
      </table>
    )

module.exports = ProductTable
