require './demo.less'
require 'volubile-ui/ui/index.less'

React = require 'react'

data = require './data'

MessageFile = React.createFactory require('index').File
MessageImage = React.createFactory require('index').Image
MessageQuote = React.createFactory require('index').Quote
MessageRTF = React.createFactory require('index').RTF
MessageSnippet = React.createFactory require('index').Snippet
MessageSpeech = React.createFactory require('index').Speech

div = React.createFactory 'div'

App = React.createClass
  displayName: 'app'

  render: ->
    div className: 'app',
      MessageFile()
      MessageImage()
      MessageQuote()
      MessageRTF()
      MessageSnippet()
      MessageSpeech()

root  = React.createFactory App
mount = document.getElementById('app')

React.render root(), mount
