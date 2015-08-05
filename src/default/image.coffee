React = require 'react'

div = React.createFactory 'div'
img = React.createFactory 'img'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-image'

  propTypes:
    onClick:    T.func
    attachment: T.object.isRequired

  onClick: ->
    @props.onClick?()

  render: ->
    div className: 'attachment attachment-image', onClick: @onClick,
      div className: 'preview',
        img src: @props.attachment.data.thumbnailUrl
