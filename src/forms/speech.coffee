React = require 'react'

LiteAudio = React.createFactory require 'react-lite-audio'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-speech'

  propTypes:
    # @attachment.category === 'speech'
    # @attachment.data
    #   fileKey: String
    #   fileName: String
    #   fileType: String
    #   fileSize: Number
    #   fileCategory: String
    #   duration: Number
    attachment: T.object.isRequired

  render: ->
    div className: 'attachment-speech',
      LiteAudio
        source: @props.attachment.data.previewUrl
        duration: @props.attachment.data.duration
