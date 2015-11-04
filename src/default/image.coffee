React = require 'react'

LiteImage = React.createFactory require('react-lite-image')

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

  renderLoadingScreen: (previewWidth, previewHeight) ->
    progress = @props.attachment.progress
    if @props.attachment.isUploading and 0 <= progress <= 1
      style =
        top: previewHeight + 5
      barStyle =
        width: "#{progress * 100}%"
      div className: 'progress-background', style: style,
        div className: 'progress-bar', style: barStyle

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
      height: previewHeight
      maxWidth: previewWidth

    image = LiteImage
      src: src
      onClick: @onClick
      onLoaded: @onLoaded
      width: previewWidth
      height: previewHeight

    div className: 'preview', style: style,
      image
      @renderLoadingScreen(previewWidth, previewHeight)
      #@renderLoadingIndicator()

  render: ->
    div className: 'attachment-image',
      @renderPreview()
