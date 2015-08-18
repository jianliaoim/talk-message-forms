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
    attachment: T.object.isRequired
    errorMessage: T.string

  onClick: ->
    @props.onClick?()

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

    div className: 'attachment-image', onClick: @onClick,
      span className: 'preview',
        LiteImageLoading onClick: (->), src: src, errMsg: @props.errorMessage or 'x'
