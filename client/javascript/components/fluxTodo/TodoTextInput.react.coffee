# @cjsx React.DOM

'use strict'

React = require 'react'
ReactPropTypes = React.PropTypes

ENTER_KEY_CODE = 13

TodoTextInput = React.createClass(
  propTypes:
    className: ReactPropTypes.string
    id: ReactPropTypes.string
    placeholder: ReactPropTypes.string
    onSave: ReactPropTypes.func.isRequired
    value: ReactPropTypes.string

  getInitialState: ->
    value: @props.value or ''

  # Invokes the callback passed in as onSave, allowing this component to be
  # used in different ways.
  _save: ->
    @props.onSave(@state.value)
    @setState(value: '')

  _onChange: (e) ->
    @setState(value: e.target.value)

  _onKeyDown: (e) ->
    @_save() if e.keyCode is ENTER_KEY_CODE

  render: ->
    return (
      <input
        className={@props.className}
        id={@props.id}
        placeholder={@props.placeholder}
        onBlur={@_save}
        onChange={@_onChange}
        onKeyDown={@_onKeyDown}
        value={@state.value}
        autoFocus={true}
      />
    )
)

module.exports = TodoTextInput
