'use strict'

module.exports =
  convertRawMessage: (rawMessage, currentThreadID) ->
    id: rawMessage.id
    threadID: rawMessage.threadID
    authorName: rawMessage.authorName
    date: new Date(rawMessage.timestamp)
    text: rawMessage.text
    isRead: rawMessage.threadID is currentThreadID
