# @attachment.category === 'file'
# @attachment.data
#   fileKey:      String
#   fileName:     String
#   fileType:     String
#   fileSize:     Number
#   fileCategory: String
#   imageWidth:   Number
#   imageHeight:  Number
#   downloadUrl:  String
#   thumbnailUrl: String
#   previewUrl:   String

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
    if @props.getColor?
      color = @props.getColor @props.attachment.data.fileType
    else if @props.colors?.length
      color = @props.colors[@props.attachment.data.fileType] or @props.colors['default']
    else
      color = '#7986CB'

    style =
      backgroundColor: color

    if @props.attachment.data.fileType?.length
      div className: 'file-type', style: style, @props.attachment.data.fileType
    else
      div className: 'file-type', style: style, '?'

  renderFileName: ->
    if @props.attachment.data.fileName?.length
      div className: 'file-name', @props.attachment.data.fileName

  render: ->
    div className: 'attachment-file', onClick: @onClick,
      @renderFileType()
      @renderFileName()
      @renderProgress()
