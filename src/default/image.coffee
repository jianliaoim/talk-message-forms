React = require 'react'

LiteImageLoading = React.createFactory require('react-lite-misc').ImageLoading
LiteImageLocal = React.createFactory require './image-local'

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
    isUpload: false

  componentDidMount: ->
    if @props.eventBus?
      unless @props.attachment.data.fileKey?
        @props.eventBus.addListener 'uploader/create', @onCreate
        @props.eventBus.addListener 'uploader/progress', @onProgress
        @props.eventBus.addListener 'uploader/complete', @onDone
        @props.eventBus.addListener 'uploader/error', @onDone

  componentWillUnoumt: ->
    if @props.eventBus?
      @props.eventBus.removeListener 'uploader/create', @onCreate
      @props.eventBus.removeListener 'uploader/progress', @onProgress
      @props.eventBus.removeListener 'uploader/complete', @onDone
      @props.eventBus.removeListener 'uploader/error', @onDone

  onClick: ->
    @props.onClick?()

  onClickUploading: ->
    if(@state.progress>=1)
      @props.onClick?()

  onLoaded: ->
    @props.onLoaded?()

  onCreate: ->
    @setState
      isUpload: true
      progress: 0

  onProgress: (progress, data)->
    {fileName, fileSize} = data
    if (fileName is @props.attachment.data.fileName) and (fileSize is @props.attachment.data.fileSize)
      @setState
        progress: progress
        isUpload: true

  onDone: ->
    @setState progress: 1

  renderPreview: ->
    if @props.attachment.data.thumbnailUrl?.length
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

    if reg.test thumbnailUrl
      src = thumbnailUrl
        .replace(/(\/h\/\d+)/g, "/h/#{ previewHeight }")
        .replace(/(\/w\/\d+)/g, "/w/#{ previewWidth }")
    else
      src = thumbnailUrl

    style =
      height: previewHeight
      maxWidth: previewWidth

    if @state.isUpload
      image = LiteImageLocal
        key: @props.attachment.data.fileName
        src: src
        onClick: @onClickUploading
        onLoaded: @onLoaded
    else
      image = LiteImageLoading
        uploading: @state.isUpload && @state.progress < 1
        src: src
        onClick: @onClick
        onLoaded: @onLoaded

    div className: 'preview', style: style,
      image
      @renderLoadingScreen()
      @renderLoadingIndicator()

  renderLoadingScreen: ->
    return if not @state.isUpload
    style =
      width: "#{@state.progress * 100}%"
    div className: 'progress-background',
      div className: 'progress-bar', style: style

  renderLoadingIndicator: ->
    return if not @state.isUpload
    div className: 'uploading-indicator'

  render: ->
    div className: 'attachment-image',
      @renderPreview()