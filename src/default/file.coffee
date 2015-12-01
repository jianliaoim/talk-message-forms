xss = require 'xss'
React = require 'react'

a = React.createFactory 'a'
div = React.createFactory 'div'
span = React.createFactory 'span'

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

  onClick: (event) ->
    event.stopPropagation()
    @props.onClick?()

  renderProgress: ->
    progress = @props.attachment.progress
    if 0 <= progress <= 1
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
    div className: 'file-name',
      @renderProgress()
      span {}, dangerouslySetInnerHTML: html

  renderActions: ->
    unless @props.attachment.isUploading?
      div className: 'action',
        a href: @props.attachment.data.downloadUrl, target: '__blank',
          span className: 'icon icon-download'

  render: ->
    div className: 'attachment-file', onClick: @onClick,
      @renderFileType()
      @renderFileName()
      @renderActions()
