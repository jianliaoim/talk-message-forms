React = require 'react'

div = React.createFactory 'div'
img = React.createFactory 'img'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-image'

  propTypes:
    attachment: T.object.isRequired

  render: ->
    div className: 'attachment-image',
      div className: 'preview',
        img src: @props.attachment.data.downloadUrl
