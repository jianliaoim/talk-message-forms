require 'volubile-ui/ui/index.less'
require './demo.less'

Highlight = require 'highlight.js/lib/highlight'
Highlight.registerLanguage('javascript', require('highlight.js/lib/languages/javascript'));

React = require 'react'

messages = require './data'

MessageForm = React.createFactory require '../src/index'

div  = React.createFactory 'div'
img  = React.createFactory 'img'
span = React.createFactory 'span'

App = React.createClass
  displayName: 'app'

  renderMessages: ->
    messages.map (message, index) =>
      div key: index, className: 'message',
        div className: 'avatar',
          img src: message.avatar.img
        span className: 'avatar-name', message.avatar.name
        span className: 'create-time', message.createTime
        div className: 'content', message.message,
          MessageForm message: message

  render: ->
    div className: 'app',
      @renderMessages()

root  = React.createFactory App
mount = document.getElementById('app')

React.render root(), mount
