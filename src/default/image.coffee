React = require 'react'

div = React.createFactory 'div'
img = React.createFactory 'img'
span = React.createFactory 'span'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-image'

  propTypes:
    onClick: T.func
    attachment: T.object.isRequired
    eventBus: T.object

  getInitialState: ->
    inProgress: false

  componentDidMount: ->
    @getImageProps()
    if @props.eventBus?
      if not @props.attachment.data.fileKey?
        @props.eventBus.addListener 'uploader/progress', @onProgress

  componentWillUnoumt: ->
    if @props.eventBus?
      eventBus.removeListener 'uploader/progress', @onProgress

  getImageProps: ->
    @imageHeight = @props.attachment.data.imageHeight
    @imageWidth = @props.attachment.data.imageWidth
    @maxWidth = 240

  onClick: ->
    @props.onClick?()

  onProgress: (progress, data) ->
    {fileName, fileSize} = data
    if (fileName is @props.attachment.data.fileName) and (fileSize is @props.attachment.data.fileSize)
      if @isMounted()
        @setState progress: progress

  renderProgress: ->
    return if not @props.eventBus?
    if not @props.attachment.data.fileKey?
      div className: 'progress', style: width: "#{@state.progress * 100}%"

  render: ->
    thumbnailUrl = @props.attachment.data.thumbnailUrl

    if @imageWidth >= @imageHeight and @imageWidth >= @maxWidth
      height = Math.round ( @imageHeight / ( @imageWidth / @maxWidth ) )
      src = thumbnailUrl.replace('h/200', "h/#{ height }").replace('w/200', 'w/240')
    else
      height = @imageHeight
      src = thumbnailUrl.replace('h/200', "h/#{ @imageHeight }").replace('w/200', "w/#{ @imageWidth }")

    style =
      height: height

    div className: 'attachment-image', onClick: @onClick,
      span className: 'preview',
        img src: src, style: style
