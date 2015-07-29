React = require 'react'

FormDefault = React.createFactory require './forms/default'
FormFile    = React.createFactory require './forms/file'
FormImage   = React.createFactory require './forms/image'
FormQuote   = React.createFactory require './forms/quote'
FormRTF     = React.createFactory require './forms/rtf'
FormSnippet = React.createFactory require './forms/snippet'
FormSpeech  = React.createFactory require './forms/speech'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form'

  propTypes:
    message: T.object.isRequired

  renderMessage: ->
    if @props.message.message?.length > 0
      div className: 'message-content', @props.message.message

  renderAttachments: ->
    if @props.message.attachments?.length > 0
      div className: 'message-attachments',
        @props.message.attachments.map (attachment, index) =>
          switch attachment.category
            when 'file'
              FormFile
                key: index
                attachment: attachment
            when 'image'
              FormImage
                key: index
                attachment: attachment
            when 'quote'
              FormQuote   key: index, attachment: attachment
            when 'rtf'
              FormRTF     key: index, attachment: attachment
            when 'snippet'
              FormSnippet key: index, attachment: attachment
            when 'speech'
              FormSpeech  key: index, attachment: attachment
            else
              FormDefault key: index, attachment: attachment

  render: ->
    div className: 'message-forms',
      @renderMessage()
      @renderAttachments()
