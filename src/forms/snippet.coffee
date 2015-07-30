React = require 'react'

LiteCodeViewer = React.createFactory require('react-lite-coder').CodeViewer

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-snippet'

  propTypes:
    getCodeType: T.func
    onClick:     T.func
    attachment:  T.object.isRequired

  onClick: ->
    @props.onClick?()

  renderTitle: ->
    if @props.attachment.data.title?.length
      div className: 'title', @props.attachment.data.title

  renderContent: ->
    if @props.getCodeType?
      codeType = @props.getCodeType @props.attachment.data.codeType
    else if @props.attachment.data.codeType?.length
      codeType = @props.attachment.data.codeType
    else
      codeType = 'nohighlight'

    div className: 'content',
      LiteCodeViewer
        name: 'attachment-snippet'
        mode: codeType,
          @props.attachment.data.text

  render: ->
    div className: 'attachment-snippet', onClick: @onClick,
      @renderTitle()
      @renderContent()
