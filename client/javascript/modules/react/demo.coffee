React = require 'react'
Demo = require './templates/demo.cjsx'

React.renderComponent Demo({rad:"mos def"}),
  document.getElementById('container')
