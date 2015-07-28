require './demo.less'

_     = require 'lodash'
React = require 'react'

messages = require './data'

MessageForm = React.createFactory require '../src/index'

div = React.createFactory 'div'

App = React.createClass
  displayName: 'app'

  renderMessages: ->
    messages.map (message, index) =>
      return MessageForm key: index, message: message

  render: ->
    div className: 'app',
      @renderMessages()

root  = React.createFactory App
mount = document.getElementById('app')

React.render root(), mount
