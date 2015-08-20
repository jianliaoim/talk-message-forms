React = require 'react'

LiteImageLoading = React.createFactory require('react-lite-misc').ImageLoading

div = React.createFactory 'div'
img = React.createFactory 'img'
span = React.createFactory 'span'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-image'

  propTypes:
    collectionMode: T.bool
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
    return if not @props.attachment.data.thumbnailUrl.length

    imageHeight = @props.attachment.data.imageHeight
    imageWidth = @props.attachment.data.imageWidth
    thumbnailUrl = @props.attachment.data.thumbnailUrl

    boundary = if @props.collectionMode then 200 else 240
    reg = /(\/h\/\d+)|(\/w\/\d+)/g

    if imageWidth > boundary
      previewHeight = Math.round(imageHeight / (imageWidth / boundary))
      previewWidth = boundary
    else
      previewHeight = imageHeight
      previewWidth = imageWidth

    if previewHeight > boundary
      previewWidth = Math.round(previewWidth / (previewHeight / boundary))
      previewHeight = boundary


    if reg.test thumbnailUrl
      src = thumbnailUrl
        .replace(/(\/h\/\d+)/g, "/h/#{ previewHeight }")
        .replace(/(\/w\/\d+)/g, "/w/#{ previewWidth }")
    else
      src = thumbnailUrl

    style =
      height: previewHeight

    div className: 'attachment-image',
      div className: 'preview', style: style,
        LiteImageLoading
          uploading: @state.uploading
          src: src
          onClick: @onClick
          onLoaded: @onLoaded
