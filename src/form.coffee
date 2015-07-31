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
  displayName: 'message-forms'

  propTypes:
    onFileClick:    T.func
    onImageClick:   T.func
    onQuoteClick:   T.func
    onRTFClick:     T.func
    onSnippetClick: T.func
    onSpeechClick:  T.func
    message:        T.object.isRequired

  renderAttachments: ->
    if @props.message.attachments?.length > 0
      div className: 'message-attachments',
        @props.message.attachments.map (attachment, index) =>
          switch attachment.category
            when 'file'
              FormFile
                key: index
                attachment: attachment
                onClick: if @props.onFileClick? then @props.onFileClick else (->)
            when 'image'
              FormImage
                key: index
                attachment: attachment
                onClick: if @props.onImageClick? then @props.onImageClick else (->)
            when 'quote'
              FormQuote
                key: index
                attachment: attachment
                onClick: if @props.onQuoteClick? then @props.onQuoteClick else (->)
            when 'rtf'
              FormRTF
                key: index
                attachment: attachment
                onClick: if @props.onRTFClick? then @props.onRTFClick else (->)
            when 'snippet'
              FormSnippet
                key: index
                attachment: attachment
                onClick: if @props.onSnippetClick? then @props.onSnippetClick else (->)
            when 'speech'
              FormSpeech
                key: index
                attachment: attachment
                onClick: if @props.onSpeechClick? then @props.onSpeechClick else (->)
            else
              FormDefault
                key: index
                attachment: attachment
                onClick: (->)

  render: ->
    div className: 'message-forms',
      @renderAttachments()
