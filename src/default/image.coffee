React = require 'react'

LiteImageLoading = React.createFactory require('react-lite-misc').ImageLoading

div = React.createFactory 'div'
img = React.createFactory 'img'
span = React.createFactory 'span'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-image'

  propTypes:
    # attachment = {
    #   data:
    #     thumbnailUrl: string
    #     imageHeight: number
    #     imageWidth: number
    #   isUploading: boolean
    #   progress: boolean
    # }
    attachment: T.object.isRequired
    collectionMode: T.bool
    onClick: T.func
    onLoaded: T.func

  onClick: ->
    @props.onClick?()

  onLoaded: ->
    @props.onLoaded?()

  renderLoadingScreen: ->
    progress = @props.attachment.progress
    if @props.attachment.isUploading and Number.isFinite(progress) and 0 <= progress <= 1
      style =
        width: "#{progress * 100}%"
      div className: 'progress-background',
        div className: 'progress-bar', style: style

  renderLoadingIndicator: ->
    if @props.attachment.isUploading
      div className: 'uploading-indicator'

  renderPreview: ->
    thumbnailUrl = @props.attachment.data.thumbnailUrl
    imageHeight = @props.attachment.data.imageHeight
    imageWidth = @props.attachment.data.imageWidth

    boundary = if @props.collectionMode then 200 else 240

    if imageWidth > boundary
      previewHeight = Math.round(imageHeight / (imageWidth / boundary))
      previewWidth = boundary
    else
      previewHeight = imageHeight
      previewWidth = imageWidth

    if previewHeight > boundary
      previewWidth = Math.round(previewWidth / (previewHeight / boundary))
      previewHeight = boundary

    src = # don't parse preview image if thumbnailUrl is a data uri generated from canvas.todataurl
      if thumbnailUrl.substring(0, 4) is 'data'
        thumbnailUrl
      else
        thumbnailUrl
          .replace(/(\/h\/\d+)/g, "/h/#{previewHeight}")
          .replace(/(\/w\/\d+)/g, "/w/#{previewWidth}")

    style =
      height: if @props.attachment.isUploading and previewHeight < 120 then 120 else previewHeight
      maxWidth: previewWidth

    image = LiteImageLoading
      src: src
      onClick: @onClick
      onLoaded: @onLoaded

    div className: 'preview', style: style,
      image
      @renderLoadingScreen()
      #@renderLoadingIndicator()

  render: ->
    div className: 'attachment-image',
      @renderPreview()
