###
  Start the main app after DOM is ready.
###

# expose React to enable React tab
# in Chrome Dev Tools
# TODO: make this development only?

window.React = require('react')

$ = require 'jquery'
App = require './app'

$(document).ready ->
  App.start()
  console.log 'Started App'
