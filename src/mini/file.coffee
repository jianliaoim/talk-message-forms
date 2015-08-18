React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-file'

  propTypes:
    getColor:   T.func
    onClick:    T.func
    attachment: T.object.isRequired
    eventBus:   T.object
    colors:     T.oneOfType([ T.array, T.object ])

  getInitialState: ->
    progress: 0

  componentDidMount: ->
    if @props.eventBus?
      unless @props.attachment.data.fileKey?
        @props.eventBus.addListener 'uploader/progress', @onProgress

  componentWillUnoumt: ->
    if @props.eventBus?
      eventBus.removeListener 'uploader/progress', @onProgress

  onClick: ->
    @props.onClick?()

  onProgress: (progress, data) ->
    {fileName, fileSize} = data.file
    if (fileName is @props.data.fileName) and (fileSize is @props.data.fileSize)
      if @isMounted()
        @setState progress: progress

  renderProgress: ->
    if @props.eventBus?
      unless @props.data.fileKey?
        div className: 'progress', style: width: "#{@state.progress * 100}%"

  renderFileType: ->
    style =
      if @props.getColor?
        backgroundColor: @props.getColor @props.attachment.data.fileType
      else if @props.colors?.length
        backgroundColor: @props.colors[@props.attachment.data.fileType] or @props.colors['default']
      else
        backgroundColor: '#7986CB'

    div className: 'file-type', style: style, if @props.attachment.data.fileType?.length then @props.attachment.data.fileType else '?'

  renderFileName: ->
    div className: 'file-name', if @props.attachment.data.fileName?.length then @props.attachment.data.fileName else '?'

  render: ->
    div className: 'attachment-file', onClick: @onClick,
      @renderFileType()
      @renderFileName()
      @renderProgress()
