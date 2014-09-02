# !!! Please Note !!!
# We are using localStorage as an example, but in a real-world scenario, this
# would involve XMLHttpRequest, or perhaps a newer client-server protocol.
# The function signatures below might be similar to what you would build, but
# the contents of the functions are just trying to simulate client-server
# communication and server-side processing.

'use strict'

ChatServerActionCreators = require '../actions/ChatServerActionCreators'

module.exports =
  getAllMessages: ->
    # simulate retrieving data from a database
    rawMessages = JSON.parse(localStorage.getItem('messages'))
    # simulate success callback
    ChatServerActionCreators.receiveAll(rawMessages)

  createMessage: (message, threadName) ->
    # simulate writing to a db
    rawMessages = JSON.parse(localStorage.getItem('messages'))
    timestamp = Date.now()
    id = 'm_' + timestamp
    threadID = message.threadID or ('t_' + Date.now())
    createMessage =
      id: id
      threadID: threadID
      threadName: threadName
      authorName: message.authorName
      text: message.text
      timestamp: timestamp
    rawMessages.push(createdMessage)
    localStorage.setItem('messages', JSON.stringify(rawMessages))

    # simulate success callback
    setTimeout((->
        ChatServerActionCreators.receiveCreatedMessage(createdMessage)
    ), 0)

