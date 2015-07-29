React = require 'react'

LiteCodeViewer = React.createFactory require('react-lite-coder').CodeViewer

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-snippet'

  propTypes:
    getHighlight: T.func
    attachment: T.object.isRequired

  renderTitle: ->
    if @props.attachment.data.title.length > 0
      div className: 'title', @props.attachment.data.title

  renderContent: ->
    if @props.getHighlight?
      codeType = @props.getHighlight @props.attachment.data.codeType
    else
      if @props.attachment.data.codeType?
        codeType = @props.attachment.data.codeType
      else
        codeType = 'nohighlight'

    div className: 'content',
      LiteCodeViewer
        name: 'attachment-snippet'
        mode: codeType,
          @props.attachment.data.text

  render: ->
    div className: 'attachment-snippet',
      @renderTitle()
      @renderContent()
