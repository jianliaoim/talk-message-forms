React = require 'react'

LiteImageLoading = React.createFactory require('react-lite-misc').ImageLoading

div = React.createFactory 'div'
img = React.createFactory 'img'
span = React.createFactory 'span'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-image'

  propTypes:
    onClick: T.func
    onLoaded: T.func
    attachment: T.object.isRequired
    eventBus: T.object

  getInitialState: ->
    uploading: false

  componentDidMount: ->
    if @props.eventBus?
      unless @props.attachment.data.fileKey?
        @props.eventBus.addListener 'uploader/progress', @onProgress
        @props.eventBus.addListener 'uploader/complete', @onDone
        @props.eventBus.addListener 'uploader/error', @onDone

  componentWillUnoumt: ->
    if @props.eventBus?
      @props.eventBus.removeListener 'uploader/progress', @onProgress
      @props.eventBus.removeListener 'uploader/complete', @onDone
      @props.eventBus.removeListener 'uploader/error', @onDone

  onClick: ->
    @props.onClick?()

  onLoaded: ->
    @props.onLoaded?()

  onProgress: ->
    if @isMounted()
      @setState uploading: true

  onDone: ->
    if @isMounted()
      @setState uploading: false

  render: ->
    thumbnailUrl = @props.attachment.data.thumbnailUrl or @props.attachment.data.previewUrl
    return if not thumbnailUrl.length

    imageHeight = @props.attachment.data.imageHeight
    imageWidth = @props.attachment.data.imageWidth
    maxWidth = 240

    if imageWidth > maxWidth
      height = Math.round imageHeight / (imageWidth / maxWidth)
      src = thumbnailUrl.replace('h/200', "h/#{ height }").replace('w/200', "w/#{ maxWidth }")
    else
      src = thumbnailUrl.replace('h/200', "h/#{ imageHeight }").replace('w/200', "w/#{ imageWidth }")

    div className: 'attachment-image',
      span className: 'preview',
        LiteImageLoading
          uploading: @state.uploading
          src: src
          onClick: @onClick
          onLoaded: @onLoaded
