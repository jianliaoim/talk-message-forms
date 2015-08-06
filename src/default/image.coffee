React = require 'react'

div = React.createFactory 'div'
img = React.createFactory 'img'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-image'

  propTypes:
    onClick:    T.func
    attachment: T.object.isRequired

  componentDidMount: ->
    @getImageProps()

  getImageProps: ->
    @imageHeight = @props.attachment.imageHeight
    @imageWidth = @props.attachment.imageWidth
    @maxWidth = 240

  onClick: ->
    @props.onClick?()

  render: ->
    return if not @imageHeight or not @imageWidth

    thumbnailUrl = @props.attachment.thumbnailUrl

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
