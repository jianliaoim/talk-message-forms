React = require 'react'
xss = require 'xss'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-file'

  propTypes:
    onClick: T.func
    attachment: T.object.isRequired
    eventBus: T.object
    color: T.string

  getInitialState: ->
    progress: 0

  componentDidMount: ->
    if @props.eventBus?
      unless @props.attachment.data.fileKey?
        @props.eventBus.addListener 'uploader/progress', @onProgress

  componentWillUnoumt: ->
    if @props.eventBus?
      eventBus.removeListener 'uploader/progress', @onProgress

  getColor: ->
    if @props.color?.length
      color = @props.color
    else
      color = '#7986CB'

  onClick: ->
    @props.onClick?()

  onProgress: (progress, data) ->
    {fileName, fileSize} = data
    if (fileName is @props.attachment.data.fileName) and (fileSize is @props.attachment.data.fileSize)
      if @isMounted()
        @setState progress: progress

  renderProgress: ->
    return if @props.eventBus?
    unless @props.attachment.data.fileKey?
      div className: 'progress', style: width: "#{@state.progress * 100}%"

  renderFileType: ->
    return if @props.attachment.data.fileType?
    fileType = if @props.attachment.data.fileType.length then @props.attachment.data.fileType else '?'
    style =
      backgroundColor: @getColor()
    div className: 'file-type', style: style, fileType

  renderFileName: ->
    return if @props.attachment.data.fileName?
    fileName = if @props.attachment.data.fileName.length then @props.attachment.data.fileName else '?'
    html =
      __html: xss fileName
    div className: 'file-name', dangerouslySetInnerHTML: html

  render: ->
    div className: 'attachment-file', onClick: @onClick,
      @renderFileType()
      @renderFileName()
      @renderProgress()
