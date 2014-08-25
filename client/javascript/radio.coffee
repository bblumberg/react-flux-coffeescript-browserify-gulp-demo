###
  Configure and export various pub/sub channels.
###

Backbone.Wreqr = require "backbone.wreqr"

# List channels here.
globalChannel = Backbone.Wreqr.radio.channel('global')

module.exports = Backbone.Wreqr.radio
