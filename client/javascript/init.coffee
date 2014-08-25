###
  Start the main app after DOM is ready.
###

$ = require 'jquery'
App = require './app'
Demo = require './modules/react/demo'

$(document).ready ->
  App.start()
  console.log 'Started App'
