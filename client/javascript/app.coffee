# Main app that holds all admin panel modules.

'use strict'

# Enable react chrome dev tools.
window.React = require('react')
window.keyMirror = require 'react/lib/keyMirror'

# Require apps below.
#require './components/commentBox/main'
#require './components/filterableProductTable/main'
# require './components/fluxTodo/Main.react'
require './components/fluxChat/Main.react'

console.log 'Started!'
