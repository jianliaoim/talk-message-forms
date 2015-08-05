React = require 'react'

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
    return unless @props.eventBus
    unless @props.attachment.data.fileKey?
      div className: 'progress', style: width: "#{@state.progress * 100}%"

  renderFileType: ->
    style =
      backgroundColor: @getColor()

    if @props.attachment.data.fileType?.length
      div className: 'file-type', style: style, @props.attachment.data.fileType
    else
      div className: 'file-type', style: style, '?'

  renderFileName: ->
    if @props.attachment.data.fileName?.length
      div className: 'file-name', @props.attachment.data.fileName
    else
      div className: 'file-name', '?'

  render: ->
    div className: 'attachment attachment-file', onClick: @onClick,
      @renderFileType()
      @renderFileName()
      @renderProgress()
