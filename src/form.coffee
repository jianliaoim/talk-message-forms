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

  renderAttachments: ->
    @props.message.attachments.map (attachment, index) =>
      switch attachment.category
        when 'file'    then FormFile    key: index, attachment: attachment
        when 'image'   then FormImage   key: index, attachment: attachment
        when 'quote'   then FormQuote   key: index, attachment: attachment
        when 'rtf'     then FormRTF     key: index, attachment: attachment
        when 'snippet' then FormSnippet key: index, attachment: attachment
        when 'speech'  then FormSpeech  key: index, attachment: attachment
        else                FormDefault key: index, attachment: attachment

  render: ->
    div className: 'message-form', @props.message.message,
      @renderAttachments()
