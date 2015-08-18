React = require 'react'

LiteAudio = React.createFactory require 'react-lite-audio'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-speech'

  propTypes:
    isUnread: T.bool
    onClick: T.func
    attachment: T.object.isRequired

  onClick: ->
    @props.onClick?()

  render: ->
    div className: 'attachment-speech', onClick: @onClick,
      LiteAudio
        duration: @props.attachment.data.duration
        isUnread: @props.isUnread
        source: @props.attachment.data.previewUrl
