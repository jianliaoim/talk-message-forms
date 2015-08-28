require './main.less'

React = require 'react'

messages = require './data'

MessageFormImage = React.createFactory require('../src/index').Image
MessageFormQuote = React.createFactory require('../src/index').Quote
MessageFormRTF = React.createFactory require('../src/index').RTF

div  = React.createFactory 'div'
img  = React.createFactory 'img'
span = React.createFactory 'span'

T = React.PropTypes

Message = React.createFactory React.createClass
  displayName: 'message'

  propTypes:
    message: T.object.isRequired

  renderAttachments: ->
    attachments = @props.message.attachments
    attachments.map (attachment, index) =>
      switch attachment.category
        when 'image'
          MessageFormImage key: index, attachment: attachment
        when 'quote'
          MessageFormQuote key: index, attachment: attachment
        when 'rtf'
          MessageFormRTF key:index, attachment: attachment

  render: ->
    div className: 'message',
      div className: 'avatar',
        img src: @props.message.avatar.img
      span className: 'avatar-name', @props.message.avatar.name
      span className: 'create-time', @props.message.createTime
      div className: 'content', @props.message.message,
        @renderAttachments()

App = React.createClass
  displayName: 'app'

  renderMessages: ->
    messages.map (message, index) =>
      Message key: index, message: message

  render: ->
    div className: 'app',
      @renderMessages()

root  = React.createFactory App
mount = document.getElementById('example')

React.render root(), mount
