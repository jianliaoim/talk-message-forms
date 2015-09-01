xss = require 'xss'
React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-file'

  propTypes:
    onClick: T.func
    attachment: T.object.isRequired
    color: T.string

  getColor: ->
    if @props.color?.length
      color = @props.color
    else
      color = '#7986CB'

  onClick: ->
    @props.onClick?()

  renderProgress: ->
    progress = @props.attachment.progress
    if Number.isFinite(progress) and 0 <= progress <= 1
      style =
        backgroundColor: @getColor()
        width: "#{progress * 100}%"
      div className: 'progress', style: style

  renderFileType: ->
    return if not @props.attachment.data.fileType?
    fileType = if @props.attachment.data.fileType.length then @props.attachment.data.fileType else '?'
    style =
      backgroundColor: @getColor()
    div className: 'file-type', style: style, fileType

  renderFileName: ->
    return if not @props.attachment.data.fileName?
    fileName = if @props.attachment.data.fileName.length then @props.attachment.data.fileName else '?'
    html =
      __html: xss fileName
    div className: 'file-name', dangerouslySetInnerHTML: html

  render: ->
    div className: 'attachment-file', onClick: @onClick,
      @renderFileType()
      @renderFileName()
      @renderProgress()
